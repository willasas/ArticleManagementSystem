---
Order: 56
TOCTitle: Nov 2020
PageTitle: markdown模板
MetaDescription: 这是一个markdown的模板页面
Date: 2020-11-12
Update: 2020-11-12
DownloadVersion: 1.0.0
---

## **环境说明**

#### 准备工作

- Windows 10 2004 版本（Windows 系统）
- 其他信息
- [秘迹搜索](https://m.mijisou.com/)

## **步骤说明**

**1. 代码片段格式如下：**

```cmd
cd /workspace/  #命令说明
```

**2. 图片引入格式**

![示例图片](../img/mo_img/1.png)

**3. 常用命令**

| 字段 1 | 字段 2 | 字段 3 | 字段 4 |
| ------ | ------ | ------ | ------ |
| 内容 1 | 内容 2 | 内容 3 | 内容 4 |
| 内容 5 | 内容 6 | 内容 7 | 内容 8 |

**4. 详细步骤说明**

- 第一步

- 第二步

**5. 带说明的链接**

- <a href="#" title="链接说明">链接名称</a>

```sql
-- 创建表
CREATE TABLE student (
  id INT NOT NULL AUTO_INCREMENT,
  stu_id INT NOT NULL,
  name VARCHAR(30) NOT NULL,
  age INT NOT NULL,
  address VARCHAR(30) NOT NULL,
  UNIQUE KEY `un_stu_id` (stu_id),
  PRIMARY KEY (id),
) ENGINE=InnoDB DEFAULT CHARSET=utf8m64;
```

#### 注意事项
