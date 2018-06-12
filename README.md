# CentOS7.5 (VirtualBox)

### 前提条件 ###
下記3つのソフトウェアをインストールしている必要があります。

* [Git (Windows)](https://qiita.com/reflet/items/5c6ba6e29fe8436c3185) -> ※ Git Bash/OpenSSH
* [Git (Mac/Linux)](https://git-scm.com/book/ja/v1/使い始める-Gitのインストール)
* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](https://www.vagrantup.com)

### ユーザーについて ###
下記の２ユーザーが初期で登録されています。

```
・管理者ユーザー
 User: root
 Password: vagrant

・デフォルトユーザー (パスワードなしのsudo権限あり)
 User: vagrant
 Password: vagrant
```

---
### 利用方法について ###

**ファイルを配置する**
```sh
$ mkdir -p ~/Documents/vagrant/centos75/
$ cd ~/Documents/vagrant/centos75/		
$ git clone https://github.com/reflet/vagrant-centos-7.5.git .
```
※windowsは、GitBashで操作ください。もし、エラーになる場合は、以下のコマンドを実行してみる。
```
$ mkdir -p %USERPROFILE%\Documents\vagrant\centos75
$ cd %USERPROFILE%\Documents\vagrant\centos75
$ git clone https://github.com/reflet/vagrant-centos-7.5.git .
```

**Vagrant起動と接続**
```sh
$ vagrant up
$ vagrant ssh
```

**Vagrant終了**
```
$ vagrant halt
```

**Vagrantイメージの出力(package.box)**
```
$ vagrant package
```

**古いVagrantイメージの削除**
```
$ vagrant box remove reflet/centos-7.5 --box-version 1.0.0
```

---
### 秘密鍵の配置 ###
CentOS7.5の内部でgitコマンドが使えるように秘密鍵を配置します。

※ 秘密鍵は、Windows(Mac)で作成したものを配置します。

<配置方法>

vagrant sshコマンドで、CentOS7.3に接続して実行してください。

```sh
$ install -m 0700 -d ~/.ssh/
$ vi ~/.ssh/id_rsa
　※ キーボードの「 i 」を押す
　※ 秘密鍵を貼り付ける ( 貼り付け方法は、windows/macで異なるので省略 )
　※ キーボードの「esc」を押す
　※ キーボードの「:」→「w」→「q」→「enter」を押す
$ chmod 0700 ~/.ssh/id_rsa
```

---
### 補足情報 （vagrant upでエラーが出る場合） ###
下記エラーが表示される場合は、下記サイトを参照ください。

```
/sbin/mount.vboxsf: mounting failed with the error: No such device
```

**＜参考サイト＞**
* [vagrantのshared folderのmountに失敗してしまった場合](https://qiita.com/ak-ymst/items/bdc37aaf53f857d37fcc)

「Vagranfile」のif文（# auto update off.）をコメントアウトして、プラグインをインストールして再起動する。
```
$ vagrant plugin install vagrant-vbguest
$ vagrant halt
$ vagrant up
```

正常に起動したら、「Vagrantfile」のコメントアウトを元に戻してください。

---
## ■ 補足情報 （プロビジョニングについて）

プロビジョニングの設定にて、初回起動時に下記ツールが自動インストールされます。

* Git
* vim
* docker, docker-compose

---
## ■ 補足情報 （VirtualBoxのイメージについて）
VirtualBoxのイメージについては、下記サイトからCentOS7.5(minimal)で構築しています。

* [CentOS 7.5 Minimal (64bit OS)](http://ftp.yz.yamagata-u.ac.jp/pub/linux/centos/7/isos/x86_64/CentOS-7-x86_64-Minimal-1804.iso)

イメージの作成方法は、下記サイトにて公開しています。

* [VagrantでCentOS7のBOXを作成する（Mac）](http://qiita.com/reflet/items/423d9640e90d65730c32)

