Git 的用法

```
mkdir xia //创建一个空目录xia
cd xia
pwd   //显示当前目录

git init //将当前目录变为git可以管理的仓库
```

在目录xia中新建一个read.txt文件
并 git add 、 git commit
如：
```
git add read.txt
git commit -m "wrote a reamde file"
```
一次`commit`可以提交多次`add`的文件

在本地仓库目录下，输入下述命令，就可以将远程仓库中的文件先拉到本地，相当于同步。
```
git pull origin
```

在本地仓库目录下对文件修改之后，
```
git add
git commit -m "..."
```
可以将自己做出的修改commit到本地仓库中（这是一个git仓库，你不commit它不知道）
再
```
git push origin
```
可将修改push到远程库中

以上都是默认远程库名为origin