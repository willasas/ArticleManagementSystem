## **环境说明**

#### 准备工作

- [SQL Fiddle](http://sqlfiddle.com/)
- [DB Fiddle](https://www.db-fiddle.com/)
- [db<>fiddle](https://dbfiddle.uk/)
- [SQL Online](https://sqliteonline.com/)
- [Oracle Live SQL](https://livesql.oracle.com/apex/f?p=590:1000)

## **步骤说明**

**1.对比**

| 在线SQL数据库 | 支持数据库 | 是否需要注册 | 备注 |
| ------ | ------ | ------ | ------ |
| SQL Fiddle | MySQL 5.6、Oracle 11g R2、PostgreSQL 9.6、、SQLite 3.32.1以及SQL Server 2017 | 不需要 | 数据库不是最新版 |
| DB Fiddle | MySQL 5.5-8.0、SQLite 3.30、PostgreSQL 9.4-13 | 不需要 | 支持团队协作 |
| db<>fiddle | MySQL 5.5-8.0、MariaDB 10.3-10.5、Oracle 18c、SQLite 3.27、MariaDB 10.3-10.5、SQLite 3.27、DB2 11.1、Firebird 3.0、PostgreSQL 13以及SQL Server 2014-2019 | 不需要 | 支持产品最全，支持比较功能 |
| SQL Online | SQLite 3.30、MariaDB 10.4、PostgreSQL 12.4以及SQL Server 2019 | 不需要 | 共享功能需要注册 |
| Oracle Live SQL | Oracle 19c | 免费注册 | 学习Oracle首选 |

**2. SQL Fiddle**

- 左侧文本框用于输入初始化语句创建表结构和数据，点击“Build Schema📥”运行；也可以通过“Text to DDL”将格式化文本转换为 DDL 语句。右侧文本框用于输入 SQL 语句，点击“Run SQL▶️”执行，执行结果显示在页面下方；“Run SQL▶️”可以选择输出结果的格式，包括表格、普通文本 以及 Markdown 三种格式。
- 复制网页地址可以分享本次测试的数据和结果

**3. DB Fiddle**

- 其中，最左侧文本框可以输入本次测试的标题和描述。中间文本框用于输入初始化语句，点击“▶️Run”运行；也可以通过“Text to DDL”将格式化文本转换为 DDL 语句。最右侧文本框用于输入 SQL 查询，点击“▶️Run”执行，执行结果显示在页面下方。点击“Copy as Markdown”可以将输出结果以 Markdown 格式进行复制。
- 点击“💾Save”或者“💾Update”可以保存并生成唯一 URL
- 可以多人在线协作，点击“👥Collaborate”生成一个邀请链接，其他人点击即可加入协作，同时支持语音和文字聊天。

**4. db<>fiddle**

- 这个网站应该是目前支持数据库种类最多的在线环境，而且每种数据库还提供了不同的版本。如果你点击“compare”，可以同时在两个不同的数据库中运行测试，比较它们的结果。
- 一旦点击“run”按钮之后，就可以生成一个唯一 URL。

**5. SQL Online**

- “File”按钮提供了本地保存和打开功能；“🌏Owner DB”可以连接到指定的远程数据库；“▶️Run”用于执行 SQL 语句；“📥Export”用于导出查询结果和 DDL 语句，支持 CSV、XML 以及 JSON 格式；“📤Import”用于从本地文件导入 DDL 和数据。页面右上角的“⚙️”可以用于设置界面风格。
- 另外，“Share”用于生成共享链接，需要注册一个免费账号才能使用。
- 团队协作功能“Team”需要付费才能使用。

**6. Oracle Live SQL**

- 需要注册一个免费账号。
- SQL Worksheet 是输入和运行 SQL 语句的工作区，支持脚本的在线保存（私有脚本和共享脚本）和离线保存功能以及结果导出功能；My Session 提供了历史会话管理功能；Schema 提供了模式对象的查看功能，包括系统提供的模式，例如 HR、OE 等；Quick SQL 可以通过格式化文本快速创建 SQL 语句；My Scripts 保存了历史脚本；My Tutorials 是自定义的教程；Code Library 是其他人共享的教程和脚本库，可以点击运行或者下载使用。

#### 总结