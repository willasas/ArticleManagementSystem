## **环境说明**
#### 准备工作
* [安装node.js环境](../Nodejs/node_js安装教程.md)
* [vue安装教程](vue安装教程.md)
* VS Code IDE

## **步骤说明**
**1. 安装node.js和vue.js**

**2. 安装VS Code插件**

插件名 | 说明
---|---
ESLint | JavaScript代码检查工具
Vetur | 官方推荐的vue工具
Prettier-Code formatter | 规范代码工具

**3. 打开VS Code的设置界面：文件 > 首选项 > 设置，点击右上角的打开设置按钮，进行设置**
``` @settings.json
    // 基础设置
     "editor.tabSize": 2,
     "workbench.startupEditor": "welcomePage",
     "editor.quickSuggestions": {
         "strings": true
     },
     
     // vue设置
     "emmet.syntaxProfiles": {
         "vue-html": "html",
         "vue": "html"
     },
     "files.associations": {
         "*.vue": "vue"
     },
     
     // vetur设置
     "vetur.format.defaultFormatter.html": "js-beautify-html",
     "vetur.format.defaultFormatter.js": "vscode-typescript",
     
     // eslint设置
     //"eslint.autoFixOnSave": true,
     "eslint.validate": [
         "javascript",
         "javascriptreact",
         {
             "language": "html",
             "autoFix": true
         },
         {
             "language": "vue",
             "autoFix": true
         }
     ],
     
     // format设置
     "javascript.format.insertSpaceBeforeFunctionParenthesis": false,
     "prettier.singleQuote": true,
     "prettier.semi": false,
     "prettier.useTabs": true,
     
     // git设置
     "gitlens.advanced.messages": {
         "suppressCommitHasNoPreviousCommitWarning": false,
         "suppressCommitNotFoundWarning": false,
         "suppressFileNotUnderSourceControlWarning": false,
         "suppressGitVersionWarning": false,
         "suppressLineUncommittedWarning": false,
         "suppressNoRepositoryWarning": false,
         "suppressUpdateNotice": false,
         "suppressWelcomeNotice": true
     }
```

#### 注意事项