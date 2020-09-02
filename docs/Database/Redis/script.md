## **环境说明**

#### 准备工作

- Windows 10 2004 版本（Windows 系统）
- Redis version 5.0.9

## **步骤说明**

**1. Redis 脚本**

- Redis 脚本使用 Lua 解释器来执行脚本。 Redis 2.6 版本通过内嵌支持 Lua 环境。执行脚本的常用命令为 EVAL。
- 基本语法：

```cmd
EVAL script numkeys key [key ...] arg [arg ...]
```

**2. 实例**

```@cmd
EVAL "return {KEYS[1],KEYS[2],ARGV[1],ARGV[2]}" 2 key1 key2 frist second
```

- 事务可以理解为一个打包的批量执行脚本，但批量指令并非原子化的操作，中间某条指令的失败不会导致前面已做指令的回滚，也不会造成后续的指令不做。

**3. 脚本常用命令**

| 序号 | 命令                                             | 描述                                                   |
| ---- | ------------------------------------------------ | ------------------------------------------------------ |
| 1    | EVAL script numkeys key [key ...] arg [arg ...]  | 执行 Lua 脚本                                          |
| 2    | EVALSHA sha1 numkeys key [key ...] arg [arg ...] | 执行 Lua 脚本                                          |
| 3    | SCRIPT EXISTS script [script ...]                | 查看指定的脚本是否已经被保存在缓存当中                 |
| 4    | SCRIPT FLUSH                                     | 从脚本缓存中移除所有脚本                               |
| 5    | SCRIPT KILL                                      | 杀死当前正在运行的 Lua 脚本                            |
| 6    | SCRIPT LOAD script                               | 将脚本 script 添加到脚本缓存中，但并不立即执行这个脚本 |
