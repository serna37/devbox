[![tag](https://img.shields.io/badge/tag-v0.0.1-green)](https://github.com/serna37/devbox/releases/tag/v0.0.1)

[![tag_release](https://github.com/serna37/devbox/actions/workflows/tag_release.yml/badge.svg?branch=master)](https://github.com/serna37/devbox/actions/workflows/tag_release.yml)

# devbox
This repository is `devbox`.

<!-- icon generator -->
<a href="https://serna37.github.io/icon-badge/">
  <img src="http://img.shields.io/badge/icon_badge-generator-4d9aff.svg?logo=icon&logoColor=&labelColor=696969&style=flat">
</a>

- App Profile
<!-- Badges -->
<table>
  <tr>
    <td>License</td>
    <td>Env</td>
    <td>Editor</td>
  </tr>
  <tr>
    <!-- License -->
    <td>
      <a href="./LICENSE">
        <img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat">
      </a>
    </td>
    <!-- Env -->
    <td>
      <img src="https://img.shields.io/badge/-Docker-EEE.svg?logo=docker&style=flat">
      <img src="https://img.shields.io/badge/-shell-555.svg?logo=shell&style=flat">
      <br>
      <img src="http://img.shields.io/badge/-macOS-000000.svg?logo=apple&logoColor=ffffff&style=flat">
      <img src="http://img.shields.io/badge/-debian-A81D33.svg?logo=debian&logoColor=ffffff&style=flat">
    </td>
    <!-- Editor -->
    <td>
      <a href="https://github.com/serna37/vim">
        <img src="http://img.shields.io/badge/vim-9.1-36b04a.svg?logo=vim&logoColor=019733&labelColor=c4c4c4&style=flat">
      </a>
    </td>
  </tr>
</table>

- [Author Profile](https://github.com/serna37)

---

# OVER VIEW

## What is devbox?
devbox can build Dev Container without any hesitate.

## Dependency
- on macOS
- OrbStack
- your dotfiles install.sh

## pre setup
on your vimrc for inner container, this setting is essential to pipe clipboard.
```vim
" This Repository's Dockerfile using debian OS, my host is macOS(Darwin).
if system('uname -s')->split('\n')[0] =~ 'Linux'
    aug Yank
        au!
        " yankした文字列を共有ファイルに書き込む
        au TextYankPost * cal system('tee <&0 > /shared-register/clip', @")
    aug END
endif
```

## Flow
When you execute command `devbox` in devbox.sh, devbox do this flow.
1. If not running Docker engine, open OrbStack.
2. Read these files (I recommend you to put these on your dotfiles repozitory).
  - Dockerfile
  - docker-compose.yml
  - devbox_gitignore.txt
3. If not exist, create directory `.devbox-XXX` and setup files.
`XXX` is unique number at that time. Here is the sample.
<!-- file tree -->
<a href="https://tree.nathanfriend.io/">
  <img src="https://img.shields.io/badge/file-tree-lightgray.svg?logo=files&style=flat">
</a>

```
.
├── .devbox-1234/
│   ├── shared-register/  : created when start container
│   │      ├── clip       : vim yank register in container
│   │      └── tmp        : for watch changeing clip
│   ├── vol/                : bind mount folder to work something
│   ├── docker-compose.yml  : from your dotfiles repozitory
│   └── Dockerfile          : from your dotfiles repozitory
└── .gitignore         : add contents from devbox_gitignore.txt
```

4. Check checksum `Dockerfile`, `docker-compose.yml` by md5 and replace from dotfiles repozitory when it has any diff.
5. Build image. arg `devbox re` will build without cache.
6. Construct `shared-register` and pipe `vim yank in container` and `host clipboard` on async process.
7. Start and login container with `zsh`.
8. When you logout from container, destruct `shared-register`.

My dotfiles is [here](https://github.com/serna37/dotfiles).

---

# Usage
1. Inclue or copy `devbox.sh` in your `.zshrc` and `exec $SHELL -l` to reload.
2. Copy tree files on `~/git/dotfiles/conf/devbox`
- Dockerfile
- docker-compose.yml
- devbox_gitignore.txt
3. Do `devbox` on any directory.

---

# 日本語ドキュメント
私は日本人なので、こちらの方が饒舌です。

## devbox
devbox コマンドを用いると、どこでも簡単にコンテナを作成してログインし
気軽に作業して壊せるようになります。
やっていることはただコンテナを起動しているだけですが、いくつか工夫が必要なため
レポジトリにまとめました。
VSCodeから来たdev-containerやdev-container-cliの、より汎用版を目指しました。

## 前提の環境
- M2 MacBookで動作確認済みです
- OrbStack (Dockerが動けば良いのですが、Docker for Desktopよりこちらのが軽いので)
- あなたのdotfilesレポジトリと、そのinstall.shを作っておいてください。

なお、正直たいした行数のshellではないので、ご自分の環境に合わせて適宜修正して使うことは難しくありません。

## 事前準備
vimrcに以下を追記することで、コンテナ内のvimでヤンクした値を
共有ファイルに書き込むようにしておき、後述の仕組みから
ホストのクリップボードに値を渡せます。
```vim
" このレポジトリではDockerfileにdebianのOSイメージを採用しています。
" ホストはmacOSなのでDarwinとなり、同じvimrcでもコンテナで動かしてる時のみ提要できます
if system('uname -s')->split('\n')[0] =~ 'Linux'
    aug Yank
        au!
        " yankした文字列を共有ファイルに書き込む
        au TextYankPost * cal system('tee <&0 > /shared-register/clip', @")
    aug END
endif
```

## devboxが行う流れ
devbox.sh内の関数`devbox`を実行すると、以下の流れでコンテナを作成します。
1. Dockerエンジンが起動していなければOrbStackを起動します。
2. 以下のファイルを参照します。 (本レポジトリにもありますが、あなたのdotfilesに入れると良いと思います。)
  - Dockerfile
  - docker-compose.yml
  - devbox_gitignore.txt
3. なければ`.devbox-XXX`というフォルダを作成し、以下のように構成します。
`XXX`の部分は一意になるような数字です。
未指定でdocker-composeがつけるコンテナ名が{フォルダ名}-{サービス名}なので一意にしています。
<!-- file tree -->
<a href="https://tree.nathanfriend.io/">
  <img src="https://img.shields.io/badge/file-tree-lightgray.svg?logo=files&style=flat">
</a>

```
.
├── .devbox-1234/
│   ├── shared-register/  : コンテナ起動直前に作成します。
│   │      ├── clip       : コンテナ内のvimでヤンクした値を入れ、ホスト側のクリップボードに渡すためのファイル
│   │      └── tmp        : clipファイルの変更検知のためのもの
│   ├── vol/                : バインドマウントフォルダ。作業でお好きにお使いいただけます。
│   ├── docker-compose.yml  : このymlでコンテナを立ち上げます。
│   └── Dockerfile          : この構成のコンテナにします。
└── .gitignore         : バインドマウントしているvol以外を無視するよう、既存gitignoreに追記します。
```

4. `Dockerfile`, `docker-compose.yml`のチェックサムをmd5で確認し、差分があればdotfilesの物で更新します。
5. イメージをビルドします。差分があればコンテナをレイヤのキャッシュを見てビルドします。
`devbox re`とreオプションをつけることで、キャッシュを見ずに一からビルドします。
6. `shared-register`フォルダの部分を構築し、`コンテナ内のvimでのヤンク`と`ホストのclipboard`を
非同期プロセスで繋ぎます。このプロセスはコンテナを抜けた際に終了されます。
7. コンテナを起動し、zshでログインします。
8. コンテナをexitすると、`shared-register`やプロセスを消します。

My dotfiles is [here](https://github.com/serna37/dotfiles).

---

# 使い方など
1. `devbox.sh`の内容をあなたの`.zshrc`にsourceするなりコピペするなりして、`exec $SHELL -l`なり`exec /bin/zsh -l`なりで適用します。
2. 本レポジトリのうち、以下3つを`~/git/dotfiles/conf/devbox`にコピーしてください。
パスが嫌であれば、devbox関数の中身の変数を変更できます。
- Dockerfile
- docker-compose.yml
- devbox_gitignore.txt
3. 任意のフォルダでdevbox関数を実行すれば、そこに.devbox-XXXフォルダを構成して実行されていきます。

なお、Dockerとして当然の話ですが
最初のビルドのみ時間がかかるものの、以降同じDockerfileであれば
何個めでも何回目でも、キャッシュを利用するため即時立ち上がります。

---

# Development

## Dockergile
```Dockerfile
# using debian
# debian使ってます
FROM debian:bullseye-slim

# Enable multi-arch
# マルチアーキ対応させます。x86系(amd64)のバイナリも実行できるようになります。
# https://docs.orbstack.dev/machines/#multi-architecture
RUN dpkg --add-architecture amd64 \
    && apt update \
    && apt upgrade -y \
    && apt install -y libc6:amd64

# install some.
# お好きな物いれてください
RUN apt install -y \
    wget sudo time \
    curl zsh git \
    build-essential ca-certificates \
    gzip file exiftool

# vim 9をビルドします。debianでapt install vimは8.xしかなかったです
# for vim9
# https://uhoho.hatenablog.jp/entry/2023/05/09/033455
RUN apt install -y build-essential autoconf automake cproto \
    gettext libtinfo-dev libacl1-dev libgpm-dev \
    libxmu-dev libgtk-3-dev libxpm-dev \
    libperl-dev python3-dev ruby-dev \
    libncurses-dev \
    lua5.4 liblua5.4-dev \
    libsodium-dev libcanberra-dev tcl-dev \
    && git clone --depth 1 https://github.com/vim/vim.git \
    && cd vim/src \
    && ./configure --prefix=/root/.local --enable-multibyte --enable-cscope --enable-perlinterp --enable-python3interp --enable-rubyinterp --enable-luainterp --enable-fontset --enable-xim --enable-terminal --enable-fail-if-missing --with-x --enable-gui=gtk3 --enable-tclinterp \
    && make && make install \
    && ln -nfs /root/.local/bin/vim /usr/bin/vim

# for shared-register (clipboard)
# vimヤンクとホストのクリップボードを非同期で繋ずるために必要です
RUN mkdir /shared-register

# dotfiles
# あなたのdotfilesを入れるinstall.shをcurlで呼び出します。

# apt install kind.
# debianなのでapt install系で作ってください。
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/serna37/dotfiles/master/install.sh)"
```

## docker-compose.yml
```docker-compose.yml
services:
  sandbox:
    build: .
    volumes:
      # for shared-register
      # クリップボード共有のため
      - type: bind
        source: ./shared-register
        target: /shared-register
      # for work
      # 好きな作業用に。コンテナからここに入れたものが成果物みたいなイメージ
      - type: bind
        source: ./vol
        target: /work
    # to keep running container
    # コンテナを起動させ続ける
    # https://qiita.com/messhii222/items/01ae86ebedd576355fab
    tty: true
    stdin_open: true
```
