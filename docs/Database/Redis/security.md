## **环境说明**

#### 准备工作

- Windows 10 2004 版本（Windows 系统）
- Redis version 5.0.9

## **步骤说明**

**1. 设置密码验证**

```cmd
CONFIG set requirepass "Aa123"  #设置密码验证
CONFIG get requirepass  #查看是否设置了密码验证
```
