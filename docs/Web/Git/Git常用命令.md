## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- Git 环境

## **步骤说明**

**1. 查看 Git 信息**

```bash
# 查看系统配置
git config --list
# 查看用户配置
cat ~/.gitconfig
# 查看当前项目的 git 配置
cat .git/config
# 查看暂存区的文件
git ls-files
# 查看本地 git 命令历史
git reflog
# 查看所有 git 命令
git --help -a
# 查看当前 HEAD 指向
cat .git/HEAD

# git 中 D 向下翻一行  F 向下翻页  B 向上翻页  Q 退出
# 查看提交历史
git log --oneline
        --grep="关键字"
        --graph
        --all
        --author "username"
        --reverse
        -num
        -p
        --before=  1  day/1  week/1  "2019-06-06"
        --after= "2019-06-06"
        --stat
        --abbrev-commit
        --pretty=format:"xxx"

# oneline -> 将日志记录一行一行的显示
# grep="关键字" -> 查找日志记录中(commit提交时的注释)与关键字有关的记录
# graph -> 记录图形化显示 ！！！
# all -> 将所有记录都详细的显示出来
# author "username" -> 查找这个作者提交的记录
# reverse -> commit 提交记录顺序翻转
# before -> 查找规定的时间(如:1天/1周)之前的记录
# num -> git log -10 显示最近10次提交 ！！！
# stat -> 显示每次更新的文件修改统计信息，会列出具体文件列表 ！！！
# abbrev-commit -> 仅显示 SHA-1 的前几个字符，而非所有的 40 个字符 ！！！
# pretty=format:"xxx" ->  可以定制要显示的记录格式 ！！！
# p -> 显示每次提交所引入的差异（按 补丁 的格式输出）！！！
```

**2. git log 点线图**

- 「git 中一条分支就是一个指针，新建一条分支就是基于当前指针新建一个指针」
- 「切换至某个分支 ，就是将 HEAD 指向某条分支（指针）」
- 「切换至某个 commit ，就是将 HEAD 指向某个 commit」
- 符号解释：

```
*	表示一个 commit
|	表示分支前进
/	表示分叉
\	表示合入
|/	表示新分支
```

**3. Git 常用命令**

```bash
# 查看工作区和暂存区的状态
git status
# 将工作区的文件提交到暂存区
git add .
# 提交到本地仓库
git commit -m "本次提交说明"
# add和commit的合并，便捷写法（未追踪的文件无法直接提交到暂存区/本地仓库）
git commit -am "本次提交说明"
# 将本地分支和远程分支进行关联
git push -u origin branchName
# 将本地仓库的文件推送到远程分支
git push
# 拉取远程分支的代码
git pull origin branchName
# 合并分支
git merge branchName
# 查看本地拥有哪些分支
git branch
# 查看所有分支（包括远程分支和本地分支）
git branch -a
# 切换分支
git checkout branchName
# 临时将工作区文件的修改保存至堆栈中
git stash
# 将之前保存至堆栈中的文件取出来
git stash pop
```

**4. branch**

```bash
# 查看本地分支
git branch | git branch -l
# 查看远程分支
git branch -r
# 查看所有分支（本地分支+远程分支）
git branch -a
# 查看所有分支并带上最新的提交信息
git branch -av
# 查看本地分支对应的远程分支
git branch -vv

# 新建分支
# 在别的分支下新建一个分支，新分支会复制当前分支的内容
# 注意：如果当前分支有修改，但是没有提交到仓库，此时修改的内容是不会被复制到新分支的
git branch branchname
# 切换分支(切换分支时，本地工作区，仓库都会相应切换到对应分支的内容)
git checkout branchname
# 创建一个 aaa 分支，并切换到该分支 （新建分支和切换分支的简写）
git checkout -b aaa
# 可以看做是基于 master 分支创建一个 aaa 分支，并切换到该分支
git checkout -b aaa master

# 新建一条空分支（详情请看问题列表）
git checkout --orphan emptyBranchName
git rm -rf .

# 删除本地分支,会阻止删除包含未合并更改的分支
git brnach -d branchname
# 强制删除一个本地分支，即使包含未合并更改的分支
git branch -D branchname
# 删除远程分支
# 推送一个空分支到远程分支，其实就相当于删除远程分支
git push origin  :远程分支名
# 或者
git push origin --delete 远程分支名

# 修改当前分支名
git branch -m branchname
```

**5. merge 三种常用合并方法**

```bash
# 默认 fast-forward ，HEAD 指针直接指向被合并的分支
$ git merge

# 禁止快进式合并,会生成一个新的提交,让当前分支的提交历史不会那么乱
$ git merge --no-ff
# 不会生成新的提交，会将被合并分支多次提交的内容直接存到工作区和暂存区，由开发者手动去提交，这样当前分支最终只会多出一条提交记录，不会掺杂被合并分支的提交历史
$ git merge --squash
```

**6. stash**

- 能够将所有未提交的修改保存至堆栈中，用于后续恢复当前工作区内容
- 如果文件没有提交到「暂存区（使用 git add . 追踪新的文件）」，使用该命令会提示 No local changes to save ，无法将修改保存到堆栈中

```bash
# 将所有未提交的修改（提交到暂存区）保存至堆栈中
git stash
# 给本次存储加个备注，以防时间久了忘了
git stash save "存储"
# 存储未追踪的文件
git stash -u

# 查看存储记录
git stash list

在 Windows 上和 PowerShell 中，需要加双引号
# 恢复后，stash 记录并不删除
git stash apply "stash@{index}"
# 恢复的同时把 stash 记录也删了
git stash pop "stash@{index}"
# 删除 stash 记录
git stash drop "stash@{index}"
# 删除所有存储的进度
git stash clear
# 查看当前记录中修改了哪些文件
git stash show "stash@{index}"
# 查看当前记录中修改了哪些文件的内容
git stash show -p "stash@{index}"
```

**7. diff**

```bash
# 查看工作区和暂存区单个文件的对比
git diff filename
# 查看工作区和暂存区所有文件的对比
git diff
# 查看工作区和暂存区所有文件的对比，并显示出所有有差异的文件列表
git diff --stat
# 注意：
# 1.你修改了某个文件，但是没有提交到暂存区，这时候会有对比的内容
# 一旦提交到暂存区，就不会有对比的内容(因为暂存区已经更新)
# 2.如果你新建了一个文件，但是没有提交到暂存区，这时候 diff 是没有结果的

# 查看暂存区与上次提交到本地仓库的快照（即最新提交到本地仓库的快照）的对比
git diff --cached/--staged
# 查看工作区与上次提交到本地仓库的快照（即最新提交到本地仓库的快照）的对比
git diff branchname
# 查看工作区与 HEAD 指向（默认当前分支最新的提交）的对比
git diff HEAD

# 查看两个本地分支中某一个文件的对比
git diff branchname..branchname filename
# 查看两个本地分支所有的对比
git diff branchname..branchname
# 查看远程分支和本地分支的对比
git diff origin/branchname..branchname
# 查看远程分支和远程分支的对比
git diff origin/branchname..origin/branchname

# 查看两个 commit 的对比
git diff commit1..commit2
```

**8. remote**

```bash
# 查看所有远程主机
git remote
# 查看关联的远程仓库的详细信息
git remote -v
# 删除远程仓库的 “关联”
git remote rm projectname
# 设置远程仓库的 “关联”
git remote set-url origin <newurl>
```

**9. tag(常用于发布版本)**

```bash
# 默认在 HEAD 上创建一个标签
git tag v1.0
# 指定一个 commit id 创建一个标签
git tag v0.9 f52c633
# 创建带有说明的标签，用 -a 指定标签名，-m 指定说明文字
git tag -a v0.1 -m "version 0.1 released"

# 查看所有标签
# 注意：标签不是按时间顺序列出，而是按字母排序的。
git tag

# 查看单个标签具体信息
git show <tagname>

# 推送一个本地标签
git push origin <tagname>
# 推送全部未推送过的本地标签
git push origin --tags

# 删除本地标签
# 因为创建的标签都只存储在本地，不会自动推送到远程。
# 所以，打错的标签可以在本地安全删除。
git tag -d v0.1
# 删除一个远程标签（先删除本地 tag ，然后再删除远程 tag）
git push origin :refs/tags/<tagname>
```

**10. 删除文件**

```bash
# 删除暂存区和工作区的文件
git rm filename
# 只删除暂存区的文件，不会删除工作区的文件
git rm --cached filename
```

**11. 版本切换 & 重设 & 撤销**

- 「checkout 可以撤销工作区的文件，reset 可以撤销工作区/暂存区的文件」
- 「reset 和 checkout 可以作用于 commit 或者文件，revert 只能作用于 commit」

- checkout 详解

```bash
# 恢复暂存区的指定文件到工作区
git checkout <filename>
# 恢复暂存区的所有文件到工作区
git checkout .

# 回滚到最近的一次提交
# 如果修改某些文件后，没有提交到暂存区，此时的回滚是回滚到上一次提交
# 如果是已经将修改的文件提交到仓库了，这时再用这个命令回滚无效
# 因为回滚到的是之前自己修改后提交的版本
git checkout HEAD
git checkout HEAD -- filename
# 回滚到最近一次提交的上一个版本
git checkout HEAD^
# 回滚到最近一次提交的上2个版本
git checkout HEAD^^

# 切换分支，在这里也可以看做是回到项目「当前」状态的方式
git checkout <当前你正在使用的分支>
# 切换到某个指定的 commit 版本
git checkout <commit_id>
# 切换指定 tag
git checkout <tag>
```

- 「在开发的正常阶段，HEAD 一般指向 master 或是其他的本地分支，但当你使用 git checkout <commit id> 切换到指定的某一次提交的时候，HEAD 就不再指向一个分支了——它直接指向一个提交，HEAD 就会处于 detached 状态（游离状态）」。
- 切换到某一次提交后，你可以查看文件，编译项目，运行测试，甚至编辑文件而不需要考虑是否会影响项目的当前状态，你所做的一切都不会被保存到主栈的仓库中。当你想要回到主线继续开发时，使用 git checkout branchName 回到项目初始的状态（「这时候会提示你是否需要新建一条分支用于保留刚才的修改」）。
- 「哪怕你切换到了某一版本的提交，并且对它做了修改后，不小心提交到了暂存区，只要你切换回分支的时候，依然会回到项目的初始状态。（**_注意：你所做的修改，如果 commit 了，会被保存到那个版本中。切换完分支后，会提示你是否要新建一个分支来保存刚才修改的内容。如果你刚才解决了一个 bug ，这时候可以新建一个临时分支，然后你本地自己的开发主分支去合并它，合并完后删除临时分支_**）。」
- 「一般我都是用 checkout 回退版本，查看历史代码，测试 bug 在哪」

* reset 详解

* git reset [--hard|soft|mixed|merge|keep][<commit>或head]：将当前的分支重设(reset)到指定的 <commit> 或者 HEAD (默认，如果不显示指定 <commit>，默认是 HEAD ，即最新的一次提交)，并且根据 [mode] 有可能更新索引和工作目录。mode 的取值可以是 hard、soft、mixed、merged、keep 。

```bash
# 从暂存区撤销特定文件，但不改变工作区。它会取消这个文件的暂存，而不覆盖任何更改
git reset <fileName>
# 重置暂存区最近的一次提交，但工作区的文件不变
git reset
# 等价于
git reset HEAD （默认）
# 重置暂存区与工作区，回退到最近一次提交的版本内容
git reset --hard
# 生成一个撤销最近一次提交的上一次提交的新提交
git revert HEAD^
# 生成一个撤销最近一次提交的上两次提交的新提交
git revert HEAD^^
# 生成一个撤销最近一次提交的上n次提交的新提交
git revert HEAD~num
# 重置暂存区与工作区，回退到最近一次提交的上一个版本
git reset --hard HEAD^

# 将当前分支的指针指向为指定 commit（该提交之后的提交都会被移除），同时重置暂存区，但工作区不变
git reset <commit>
# 等价于
git reset --mixed  <commit>
# 生成一个撤销指定提交版本的新提交
git revert <commit_id>
# 生成一个撤销指定提交版本的新提交，执行时不打开默认编辑器，直接使用 Git 自动生成的提交信息
git revert <commit_id> --no-edit

# 将当前分支的指针指向为指定 commit（该提交之后的提交都会被移除），但保持暂存区和工作区不变
git reset --soft  <commit>
# 将当前分支的指针指向为指定 commit（该提交之后的提交都会被移除），同时重置暂存区、工作区
git reset --hard  <commit>
```

**12. git submodule 子模块**

- Git 通过子模块来解决这个问题，允许你将一个 Git 仓库作为另一个 Git 仓库的子目录。它能让你将另一个仓库克隆到自己的项目中，同时还保持提交的独立

```bash
# 在主项目中添加子项目，URL 为子模块的路径，path 为该子模块存储的目录路径
git submodule add [URL] [Path]

# 克隆含有子项目的主项目
git clone [URL]
# 当你在克隆这样的项目时，默认会包含该子项目的目录，但该目录中还没有任何文件
# 初始化本地配置文件
git submodule init
# 从当前项目中抓取所有数据并检出父项目中列出的合适的提交
git submodule update
# 等价于 git submodule init && git submodule update
git submodule update --init

# 自动初始化并更新仓库中的每一个子模块， 包括可能存在的嵌套子模块
git clone --recurse-submodules [URL]
```

**13. 跳过 pre-commit 继续提交代码**

```bash
# 跳过验证
git commit --no-verify
git commit -n
```
