> [!Caution]
> This `README.md` is created for sample repository, should modify for new one.
> Please substitute :%s/template/collect_name/g

[![tag](https://img.shields.io/badge/tag-v0.0.1-green)](https://github.com/serna37/template/releases/tag/v0.0.1)

[![build](https://github.com/serna37/template/actions/workflows/build.yml/badge.svg?branch=develop)](https://github.com/serna37/template/actions/workflows/build.yml)
[![deploy](https://github.com/serna37/template/actions/workflows/deploy.yml/badge.svg?branch=release)](https://github.com/serna37/template/actions/workflows/deploy.yml)
[![cron](https://github.com/serna37/template/actions/workflows/cron.yml/badge.svg?branch=release)](https://github.com/serna37/template/actions/workflows/cron.yml)
[![tag_release](https://github.com/serna37/template/actions/workflows/tag_release.yml/badge.svg?branch=master)](https://github.com/serna37/template/actions/workflows/tag_release.yml)

# template
This repository is `template`.

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
    <td>Lang</td>
    <td>DB</td>
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
      <img src="https://img.shields.io/badge/-Google-333.svg?logo=google&style=flat">
      <img src="https://img.shields.io/badge/-Docker-EEE.svg?logo=docker&style=flat">
      <img src="https://img.shields.io/badge/-k8s-EEE.svg?logo=kubernetes&style=flat">
      <br>
      <img src="https://img.shields.io/badge/-shell-555.svg?logo=shell&style=flat">
      <img src="https://img.shields.io/badge/-zsh-555.svg?logo=&style=flat">
    </td>
    <!-- Lang -->
    <td>
      <img src="https://img.shields.io/badge/-HTML5-333.svg?logo=html5&style=flat">
      <img src="https://img.shields.io/badge/-CSS3-1572B6.svg?logo=css3&style=flat">
      <br>
      <img src="https://img.shields.io/badge/-GAS-333.svg?logo=googleappsscript&style=flat">
      <img src="https://img.shields.io/badge/-JavaScript-276DC3.svg?logo=javascript&style=flat">
      <img src="https://img.shields.io/badge/-Node.js-555.svg?logo=nodedotjs&style=flat">
      <img src="https://img.shields.io/badge/-TypeScript-555.svg?logo=typescript&style=flat">
      <img src="https://img.shields.io/badge/-React-555.svg?logo=react&style=flat">
      <br>
      <img src="https://img.shields.io/badge/-Python-F9DC3E.svg?logo=python&style=flat">
      <img src="https://img.shields.io/badge/-Flask-000000.svg?logo=flask&style=flat">
      <img src="https://img.shields.io/badge/-pandas-%23150458.svg?logo=pandas&style=flat">
      <img src="https://img.shields.io/badge/-selenium-555.svg?logo=selenium&style=flat">
      <br>
      <img src="https://img.shields.io/badge/-Go-555.svg?logo=go&style=flat">
      <img src="https://img.shields.io/badge/-Gin-555.svg?logo=go&style=flat">
      <img src="https://img.shields.io/badge/-Gorm-555.svg?logo=go&style=flat">
      <br>
      <img src="https://img.shields.io/badge/-Java-F80000.svg?logo=&style=flat">
      <img src="https://img.shields.io/badge/-Spring-555.svg?logo=spring&style=flat">
      <img src="https://img.shields.io/badge/-SpringBoot-555.svg?logo=springboot&style=flat">
      <img src="https://img.shields.io/badge/-MyBatis-000000.svg?logo=&style=flat">
      <br>
      <img src="https://img.shields.io/badge/-C-00599C.svg?logo=c&style=flat">
      <img src="https://img.shields.io/badge/-C++-00599C.svg?logo=cplusplus&style=flat">
      <img src="https://img.shields.io/badge/-Rust-555.svg?logo=rust&style=flat">
    </td>
    <!-- DB -->
    <td>
      <img src="https://img.shields.io/badge/sqlite-%2307405e.svg?logo=sqlite&style=flat">
      <img src="https://img.shields.io/badge/-PostgreSQL-555.svg?logo=postgresql&style=flat">
      <img src="https://img.shields.io/badge/-MySQL-000000.svg?logo=mysql&style=flat">
    </td>
    <!-- Editor -->
    <td>
      <a href="https://github.com/serna37/vim">
        <img src="http://img.shields.io/badge/vim-9.0-36b04a.svg?logo=vim&logoColor=019733&labelColor=c4c4c4&style=flat">
      </a>
    </td>
  </tr>
</table>

- [Author Profile](https://github.com/serna37)

---

# OVER VIEW

## File Tree
<!-- file tree -->
<a href="https://tree.nathanfriend.io/">
  <img src="https://img.shields.io/badge/file-tree-lightgray.svg?logo=files&style=flat">
</a>

```
.
├── core/
│   ├── forge.js       : 🛠️manage obsidian logic
│   ├── obsidian.js    : 💎store info
│   └── vital.js       : 📲important logic
├── components/
│   └── *.js           : 📦make component files
├── remnant/
│   ├── playground.js  : 📑render logic
│   └── prototype.js   : 📜on load logic
└── index.html         : 🔖entry point
```

## Sequence
<!-- mermaid -->
<a href="https://mermaid.live/">
  <img src="http://img.shields.io/badge/Mermaid-live_editor-f52ee5.svg?logo=Mermaid&logoColor=&labelColor=696969&style=flat">
</a>

```mermaid
sequenceDiagram
    Front->>+This: sample API
    This-->>+DB: query
    DB-->>-This: select result
    This->>-Front: response
```

## API IF
|status|method|endpoint|feature|remarks|
|--|--|--|--|--|
|<ul><li>[ ] </ul>|`POST`|`/app`|description|remarks|
|<ul><li>[x] </ul>|`GET`|`/app/test`|description|remarks|

## ER
<!-- mermaid -->
<a href="https://mermaid.live/">
  <img src="http://img.shields.io/badge/Mermaid-live_editor-f52ee5.svg?logo=Mermaid&logoColor=&labelColor=696969&style=flat">
</a>

```mermaid
erDiagram
    %% comment
    table_1 ||--|| table_2 : one_to_one_identify
    table_1 }o--|{ table_3 : zero_many_to_one-many_identify
    table_4
    table_5 ||..|| table_6 : one_to_one_non-identify
```

---

# Usage
## 基本運用
- どうたらする
- どうたらする

## メンテ作業
- `test.py`へ関数追加
- ブランチ`release`へPR、マージ

---

# Development

## Branch
> [!Important]
> ## *Branch Rule*
> - develop (default): work.
> - release: deploy server and publish. PR `[release <- develop]`
> - master: tag-release. PR `[master <- release]`

<!-- mermaid -->
<a href="https://mermaid.live/">
  <img src="http://img.shields.io/badge/Mermaid-live_editor-f52ee5.svg?logo=Mermaid&logoColor=&labelColor=696969&style=flat">
</a>

```mermaid
%%{init: { 
 'gitGraph': { 'mainBranchName': 'master' }
} }%%
gitGraph
    commit
    branch release
    checkout release
    branch develop
    checkout develop
    commit
    commit
    branch feature
    checkout feature
    commit
    commit
    commit
    checkout develop
    merge feature
    commit id: "Build CI"
    checkout release
    merge develop
    commit id: "Release CD"
    checkout master
    merge release
    commit id: "release tag"
```

> [!TIP]
> - GitHub CLIでPR `base`<-`head` (alias設定)
> ```zsh
> alias pr_develop_feature='gh pr create --base develop --head $(git branch --contains | cut -d " " -f 2) --title "modify" --body ""'
> alias pr_release_develop='gh pr create --base release --head develop --title "Publish" --body ""'
> alias pr_master_release='gh pr create --base master --head release --title "Publish" --body ""'
> ```
>
> - PRをブラウザで開く (sample #10)
> ```shell
> gh browse 10
> ```

## Commands
- Python仮想環境を設定
```shell
python -m venv .
```

- 仮想環境を起動
```shell
. bin/activate
```

- pip install
```shell
pip install -r requirements.txt
```

- 仮想環境を終了
```shell
deactivate
```

---

# Build & Deploy
## Util
- コンテナ停止 + 削除 (コンテナ名重複を防ぐ)
```shell
docker stop $(docker ps -aq -f name=NAME)
docker rm $(docker ps -aq -f name=NAME)
```

- 停止コンテナ全削除 + <none>イメージ全削除
```shell
docker container prune
docker rmi $(docker images -f "dangling=true" -q)
```

## Local
- ローカルサーバ起動
```shell
sh deploy.sh && lazydocker
```

- コマンド内容
```shell
cp ../DB/DB.db ./DB \
  && docker build -t IMAGENAME:latest . \
  && docker run \
    --name NAME \
    -d \
    -p 8080:8080 \
    -v "$(pwd)/../DB:/asset/app/DB" \
    NAME:latest
```

## Remote
- `release`ブランチへのPRマージで、`Github Actions`からデプロイ。
  - https://github.com/serna37/template/actions
  - `README.md`のバッチ等で`workflow`の成功を確認 ※ブランチに注意する

> [!Note]
> - `GitHub Actions`でSSH接続する場合`シークレット`が必要。[^1]
>   - https://github.com/serna37/template/settings/secrets/actions

[^1]:https://qiita.com/0622okakyo/items/5295b7b13daf3c35b3e1

<details>

<summary>シークレット登録コマンド</summary>

```shell
gh secret set HOST --body 'neras-sta.com'
gh secret set PORT --body '22'
gh secret set USERNAME --body 'some value'
gh secret set PASSWORD --body 'some value'
gh secret set MAIL_HOST --body 'smtp.gmail.com'
gh secret set MAIL_PORT --body '465'
gh secret set MAIL_USERNAME --body 'some value'
gh secret set MAIL_PASSWORD --body 'some value'
gh secret set MAIL_FROM --body 'some value'
gh secret set MAIL_TO --body 'some value'
```

</details>

<details>

<summary>サーバ側の事前準備</summary>

### サーバ側でクローン後、認証不要に
`$GITHUB_TOKEN`はGitHubログインのトークン。
```shell
git remote set-url origin https://$GITHUB_TOKEN@github.com/serna37/template.git
```

### ポートのプロセスを確認
```shell
lsof -P -i:8080
kill {PID}
```

### リバプロ追加
- `su`して実行
```shell
vim /etc/httpd/conf/httpd.conf
```
```vim
syntax on | set number laststatus=2 showtabline=2 incsearch hlsearch ignorecase smartcase shortmess-=S
```

- 設定追加
```xml
<Location /PATH>
  ProxyPass http://localhost:8080
  ProxyPassReverse http://localhost:8080
</Location>
```

- apache再起動
```shell
systemctl restart httpd
```

</details>

---

# Note
- dockerでsudoしなくていい設定[^2]

[^2]:https://qiita.com/DQNEO/items/da5df074c48b012152ee

```shell
# dockerグループがなければ作る
sudo groupadd docker

# 現行ユーザをdockerグループに所属させる
sudo gpasswd -a $USER docker

# dockerデーモンを再起動する (CentOS7の場合)
sudo systemctl restart docker

# exitして再ログインすると反映される。
exit
```

- dockerデーモンの権限がない場合 (Docker for Desktopで確認)
```shell
sudo chown -R $(whoami) ~/.docker
```

- GitHub ActionsからGmail送信の準備
  - 2段階認証のため、アプリパスワードを作成する[^3]

[^3]:https://zenn.dev/nakamura196/articles/789122b57d595b
