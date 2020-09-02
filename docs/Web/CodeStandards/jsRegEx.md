## **前端常用 js 正则表达式**

#### 正则表达式

**1. 用户名正则**

```js
//用户名正则，4到16位（字母，数字，下划线，减号）
var uPattern = /^[a-zA-Z0-9_-]{4,16}$/
//输出 true
console.log(uPattern.test('iFat3'))
```

**2. 密码强度正则**

```js
//密码强度正则，最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符
var pPattern = /^.*(?=.{6,})(?=.*d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*? ]).*$/
//输出 true
console.log('==' + pPattern.test('iFat3#'))
```

**3. 整数正则**

```js
//正整数正则
var posPattern = /^d+$/
//负整数正则
var negPattern = /^-d+$/
//整数正则
var intPattern = /^-?d+$/
//输出 true
console.log(posPattern.test('42'))
//输出 true
console.log(negPattern.test('-42'))
//输出 true
console.log(intPattern.test('-42'))
```

**4. 数字正则**

```js
//正数正则
var posPattern = /^d*.?d+$/
//负数正则
var negPattern = /^-d*.?d+$/
//数字正则
var numPattern = /^-?d*.?d+$/
console.log(posPattern.test('42.2'))
console.log(negPattern.test('-42.2'))
console.log(numPattern.test('-42.2'))
```

**5. Email 正则**

```js
//Email正则
//输出 true
console.log(ePattern.test('65974040@qq.com'))
```

**6. 手机号码正则**

```js
//手机号正则
var mPattern = /^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))d{8}$/
//输出 true
console.log(mPattern.test('18600000000'))
```

**7. 身份证号正则**

```js
//身份证号（18位）正则
var cP = /^[1-9]d{5}(18|19|([23]d))d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)d{3}[0-9Xx]$/
//输出 true
console.log(cP.test('11010519880605371X'))
```

**8. URL 正则**

```js
//URL正则
var urlP= /^((https?|ftp|file)://)?([da-z.-]+).([a-z.]{2,6})([/w .-]*)*/?$/;
//输出 true
console.log(urlP.test("http://42du.cn"));
```

**9. IPv4 地址正则**

```js
//ipv4地址正则
var ipP = /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?).){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/
//输出 true
console.log(ipP.test('115.28.47.26'))
```

**10. 十六进制颜色正则**

```js
//RGB Hex颜色正则
var cPattern = /^#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$/
//输出 true
console.log(cPattern.test('#b8b8b8'))
```

**11. 日期正则**

```js
//日期正则，简单判定,未做月份及日期的判定
var dP1 = /^d{4}(-)d{1,2}d{1,2}$/
//输出 true
console.log(dP1.test('2017-05-11'))
//输出 true
console.log(dP1.test('2017-15-11'))
//日期正则，复杂判定
var dP2 = /^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$/
//输出 true
console.log(dP2.test('2017-02-11'))
//输出 false
console.log(dP2.test('2017-15-11'))
//输出 false
console.log(dP2.test('2017-02-29'))
```

**12. QQ 号码正则**

```js
//QQ号正则，5至11位
var qqPattern = /^[1-9][0-9]{4,10}$/
//输出 true
console.log(qqPattern.test('65974040'))
```

**13. 微信号正则**

```js
//微信号正则，6至20位，以字母开头，字母，数字，减号，下划线
var wxPattern = /^[a-zA-Z]([-_a-zA-Z0-9]{5,19})+$/
//输出 true
console.log(wxPattern.test('RuilongMao'))
```

**14. 车牌号正则**

```js
//车牌号正则
var cPattern = /^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}$/
//输出 true
console.log(cPattern.test('京K39006'))
```

**15. 包含中文正则**

```js
//包含中文正则
var cnPattern = /[一-龥]/
//输出 true
console.log(cnPattern.test('42度'))
```

#### 注意事项
