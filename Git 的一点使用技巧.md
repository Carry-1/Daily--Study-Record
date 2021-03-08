1.从远程仓库git clone一个仓库到本地之后，本地这个仓库和远程仓库就关联起来了，可以git pull 和git push文件了。
2. 在mac上配置ssh秘钥和在上配置Linux上配置方法一样。
如果在用户主目录下没有`.ssh`文件，那么运行下述命令
`
$ ssh-keygen -t rsa -C "youremail@example.com"
`
在根据提示一直按回车，可生成秘钥，（秘钥 文件夹`.ssh`自动生成在用户主目录下）再在`github`上的`settings-SSH and GPG keys`中配置秘钥即可。

在windows上直接在git bash中输入上述命令即可，也会自动在c盘上的用户目录下生成`.ssh`文件夹。