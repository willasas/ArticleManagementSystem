## **环境说明**
#### 准备工作
* Windows 10 1909版本（Windows系统）/Linux/MAC OS

## **步骤说明**
**1. 在项目中创建一个dto文件夹，并在该文件夹内创建user_dto.go文件，代码如下：**
``` @user_dto.go
package dto

import "unic.org/ginessential/model"

//定义一个UserDto结构体
type UserDto struct {
	Name string `json:"name"`
	Telephone string `json:"telephone"`
}

// 定义一个转换的函数
func ToUserDto(user model.User) UserDto {
	return UserDto{
		Name:      user.Name,
		Telephone: user.Telephone,
	}
}
```

**2. 在UserController.go文件中，将user替换成UserDto,内容如下：**
``` @UserController.go
//用户信息对应的函数
func Info(c *gin.Context){
	user, _ := c.Get("user")

	c.JSON(http.StatusOK, gin.H{"code": 200, "data": gin.H{"user": dto.ToUserDto(user.(model.User))}})

}
```

2.2 测试，结果只返回姓名和手机号，如下：
![token测试](../../img/go_img/test16.png)

**3. 封装http返回**

3.1 在项目中新建一个response文件夹，并在该文件夹下新建response.go文件，代码如下:
``` @response.go
package response

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func Response(c *gin.Context, httpStatus int, code int, data gin.H, msg string) {
	c.JSON(httpStatus, gin.H{"code": code, "data": data, "msg": msg})
}

func Success(c *gin.Context, data gin.H, msg string){
	Response(c, http.StatusOK, 200, data, msg)
}

func Fail(c *gin.Context, msg string, data gin.H){
	Response(c, http.StatusOK, 400, data, msg)
}
```

3.2 在UserController.go文件中调用该函数,代码如下：
``` @UserController.go
package controller

import (
	"github.com/gin-gonic/gin"
	"github.com/jinzhu/gorm"
	"golang.org/x/crypto/bcrypt"
	"log"
	"net/http"
	"unic.org/ginessential/common"
	"unic.org/ginessential/dto"
	"unic.org/ginessential/model"
	"unic.org/ginessential/response"
	"unic.org/ginessential/util"
)

func Register(c *gin.Context) {
	DB := common.GetDB()
	// 获取参数
	name := c.PostForm("name")
	telephone := c.PostForm("telephone")
	password := c.PostForm("password")
	// 数据验证
	if len(telephone) != 11 {
		response.Response(c, http.StatusUnprocessableEntity, 422, nil, "手机号必须为11位")
		return
	}
	if len(password) < 6 {
		response.Response(c, http.StatusUnprocessableEntity, 422, nil, "密码不能少于6位")
		return
	}

	// 如果名称没有传，给一个10位的随机字符串
	if len(name) == 0 {
		name = util.RandomString(10)
	}
	log.Println(name, telephone, password)

	// 判断手机号是否存在
	if isTelephoneExist(DB, telephone) {
		response.Response(c, http.StatusUnprocessableEntity, 422, nil, "用户已存在")
		return
	}

	// 创建用户
	// 加密密码
	hasedPassword, err := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
	if err != nil {
		response.Response(c, http.StatusUnprocessableEntity, 500, nil, "加密错误")
		return
	}
	newUser := model.User{
		Name:      name,
		Telephone: telephone,
		Password:  string(hasedPassword),
	}
	DB.Create(&newUser)

	// 返回结果
	response.Success(c, nil, "注册成功")
}

//添加登录的控制器
func Login(c *gin.Context) {
	DB := common.GetDB()
	// 获取参数
	telephone := c.PostForm("telephone")
	password := c.PostForm("password")
	// 数据验证
	if len(telephone) != 11 {
		c.JSON(http.StatusUnprocessableEntity, gin.H{"code": 422, "msg": "手机号必须为11位"})
		return
	}
	if len(password) < 6 {
		c.JSON(http.StatusUnprocessableEntity, gin.H{"code": 422, "msg": "密码不能少于6位"})
		return
	}
	// 判断手机号是否存在
	var user model.User
	DB.Where("telephone = ?", telephone).First(&user)
	if user.ID == 0 {
		c.JSON(http.StatusUnprocessableEntity, gin.H{"code": 422, "msg": "用户不存在"})
		return
	}
	// 判断密码是否正确
	if err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(password)); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"code": 400, "msg": "密码错误"})
		return
	}
	// 发放token
	token, err := common.ReleaseToken(user)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"code": 500, "msg": "系统异常"})
		log.Printf("token generate error: %v", err)
		return
	}
	// 返回结果
	response.Success(c, gin.H{"token": token}, "登录成功")
}

//用户信息对应的函数
func Info(c *gin.Context){
	user, _ := c.Get("user")

	c.JSON(http.StatusOK, gin.H{"code": 200, "data": gin.H{"user": dto.ToUserDto(user.(model.User))}})

}

// 验证手机号函数
func isTelephoneExist(db *gorm.DB, telephone string) bool {
	var user model.User
	db.Where("telephone = ?", telephone).First(&user)
	if user.ID != 0 {
		return true
	}
	return false
}
```