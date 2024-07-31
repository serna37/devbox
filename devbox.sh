# ======================================================
# Logo
# ======================================================
# macOSロゴ
logo_darwin() {
    echo -e "\e[34m"
    echo "                ..J.               "
    echo "               dMMF                "
    echo "          ....,M#:...              "
    echo "        .MMMMMMMMNN#MN             "
    echo "       .MMMMMMMMMNNM@              "
    echo "       JMMMMMMMMNNNM[              "
    echo "       (MMMMMMMMNNN#N,             "
    echo "        MMMMMMNNNNN##M]            "
    echo "         WMMMMMNMNNN##             "
    echo "          (YMMY'WMMY=              "
    echo "  _____                         _ ";
    echo " (____ \                       (_) ";
    echo "  _   \ \   ____   ____  _ _ _  _  ____ ";
    echo " | |   | | / _  | / ___)| | | || ||  _ \ ";
    echo " | |__/ / ( ( | || |    | | | || || | | | ";
    echo " |_____/   \_||_||_|     \____||_||_| |_| ";
    echo -e "\e[m"
}

# debianロゴ
logo_debian() {
    echo -e "\e[34m"
    echo "                  ..gMNgga             "
    echo "           .(MMMM9''''MMMN,            "
    echo "          .MM#^          TMMN,         "
    echo "         JMD              ,M#5         "
    echo "       .JM$      .Y=  ?!   JM[         "
    echo "        MF      .%      .  .MF         "
    echo "        M%      d,     ..  .#_         "
    echo "        M[      ,N.  ~'   .@'          "
    echo "        Mb      .?dN....J@^            "
    echo "        .NN,        ?!                 "
    echo "         (NN                           "
    echo "          ,HN.                         "
    echo "            ?Hm.                       "
    echo "               79a.                    "
    echo "  _____           _      _ ";
    echo " (____ \         | |    (_) ";
    echo "  _   \ \   ____ | | _   _   ____  ____ ";
    echo " | |   | | / _  )| || \ | | / _  ||  _ \ ";
    echo " | |__/ / ( (/ / | |_) )| |( ( | || | | | ";
    echo " |_____/   \____)|____/ |_| \_||_||_| |_| ";
    echo -e "\e[m"
}

# dockerロゴ
logo_docker() {
    echo -e "\e[36m"
    echo ""
    echo "                       .."
    echo "                      (NNNN!"
    echo "                      (NMNM_"
    echo "           (J..J-..JJ,.JJ..."
    echo "           -NNMM<MNNMF(NNNN_        .gx-"
    echo "           (MMMM!MMMM5(MMMM!        dNNNx         "
    echo "      MMNM@-MNNM<MNMNF(MNNN_NNNMF  .MNNNN&(-. . "
    echo "      MNNN@(NMNN:MNNNF(NNMN<MNNNF  .NNMNNNNNNNN;  "
    echo "    .-???<!.?<<? <<??:(??<< ??<<!.-.(NNMNNNNNM9."
    echo "  .NNMNNMNMNNMNNNNNNMNNNNNNNNNMNNNNMNNMNMMH =_    "
    echo "  ,NMNMNNMNMNNMNMNMNNNNMNNMNNNNNMNNMNNN@  .     "
    echo "  ,NNNNMNNNNNMNNNMNNMNNMNMNNMMNNMNNMNN@ .         "
    echo "   qMNMNMNMNNMNMNNMNNMNNNNNNMNNMNNMNMD.           "
    echo "    WNNMNNMNNNMNNNMNNNMNMMNNNNMNNMN#!"
    echo "     TNNMNNMNMNNMNNMNNNMNNMNMNNNM@!"
    echo "      .TNMNNMNNMNNMNMNNNNNNMNMY="
    echo "         ? MMNMNNMNNNMMMMW = "
    echo "                 ~~  "
    echo ""
    echo -e "\e[m"
}

# docker dev用コンテナ起動ロゴ
logo_dev_container() {
    echo -e "\e[32m"
    echo "      _                                                    _ ";
    echo "     | |                                      _           (_) ";
    echo "   _ | |  ____  _   _     ____   ___   ____  | |_    ____  _  ____    ____   ____ ";
    echo "  / || | / _  )| | | |   / ___) / _ \ |  _ \ |  _)  / _  || ||  _ \  / _  ) / ___) ";
    echo " ( (_| |( (/ /  \ V /   ( (___ | |_| || | | || |__ ( ( | || || | | |( (/ / | | ";
    echo "  \____| \____)  \_/     \____) \___/ |_| |_| \___) \_||_||_||_| |_| \____)|_| ";
    echo -e "\e[m"
}
logo_for_sandbox() {
    echo -e "\e[32m"
    echo "   ___                                          _  _ ";
    echo "  / __)                                        | || | ";
    echo " | |__   ___    ____     ___   ____  ____    _ | || | _    ___   _   _ ";
    echo " |  __) / _ \  / ___)   /___) / _  ||  _ \  / || || || \  / _ \ ( \ / ) ";
    echo " | |   | |_| || |      |___ |( ( | || | | |( (_| || |_) )| |_| | ) X ( ";
    echo " |_|    \___/ |_|      (___/  \_||_||_| |_| \____||____/  \___/ (_/ \_) ";
    echo -e "\e[m"
}

# ======================================================
# Util
# ======================================================
echo_info() {
    echo -e "\e[32m[\e[34mINFO\e[32m] \e[34m$1\e[m"
}

# ========================================================
# ========================================================
# ||          Dev Container for SandBox                 ||
# ========================================================
# ========================================================

# 開発用のsandboxコンテナを起動する
# 現在フォルダで、なければdevbox-XXXフォルダを作成し
# dotfile/conf/devboxの設定の最新を反映して、コンテナ起動する
devbox() {
    if "$IS_DOCKER"; then
        echo_info "Already in Dev Container Box"
        return
    fi
    logo_docker
    logo_dev_container
    logo_for_sandbox

    # エンジンが動いてないなら起動
    APP_LIST=$(osascript -e 'tell application "System Events" to get name of (processes where background only is false)')
    if [[ ! $APP_LIST =~ "OrbStack" ]]; then
        echo_info "START OrbStack"
        open -g /Applications/OrbStack.app
        sleep 5
    fi

    # このパスに設定を置くと、反映されます
    DEVBOX_DOTFILES_PATH=~/git/dotfiles/conf/devbox
    DOCKERFILE=${DEVBOX_DOTFILES_PATH}/Dockerfile
    COMPOSE_FILE=${DEVBOX_DOTFILES_PATH}/docker-compose.yml
    IGNORE_FILE=${DEVBOX_DOTFILES_PATH}/devbox_gitignore.txt

    # .devbox-XXXがない場合は作成し、設定をDL
    if ! ls -d .devbox*/ > /dev/null 2>&1; then
        # 手動でイメージを削除すると、ここでの重複回避の対象に引けないため
        # 再度ビルドしたときなどに重複する恐れがある
        # 重複した場合はあとガチで、前の同名コンテナは停止するだけ。
        # 手動でけさなきゃいい！
        echo_info "[INITIATION] CREATE DIR \e[32m.devbox-XXX"
        echo_info "[INITIATION] Please \e[31mDO NOT DELETE \e[34mdocker image startsWith \e[32mdevbox-"

        # 現在の位置に.devbox-XXXを作成
        # docker-composeは自動で「フォルダ名-サービス名」でコンテナ命名する
        # .devbox-XXX/docker-compose.ymlならdevbox-XXX-sandbox
        CONTAINERS=$(docker images --format='{{.Repository}}')
        echo_info "[INITIATION] CONTAINERS: \e[37m$CONTAINERS"
        S=".devbox-$RANDOM"
        while [[ $CONTAINERS =~ $S ]]; do
            S=".devbox-$RANDOM"
        done
        echo_info "[INITIATION] create: \e[32m$S"
        mkdir $S

        # コンテナ設定を取得
        echo_info " >> install Dockerfile docker-compose.yml from dotfiles"
        cp $DOCKERFILE $S
        cp $COMPOSE_FILE $S

        # 作業用volumeを作成
        echo_info " >> create work volume"
        mkdir -p $S/vol

        # gitignoreを追記
        echo_info " >> add .gitignore"
        cat $IGNORE_FILE >> .gitignore

        echo_info "[INITIATION] initiation completed"
        echo
    fi

    # コンテナ設定のチェックサムを取得
    echo_info "checking checksum from dotfiles"
    DOCKERFILE_MD5=$(md5 $DOCKERFILE | cut -d "=" -f 2)
    DOCKER_COMPOSE_MD5=$(md5 $COMPOSE_FILE | cut -d "=" -f 2)

    # コンテナ設定を確認
    S=$(ls -d .devbox*/)
    cd $S

    # 現在のコンテナ設定のチェックサムを取得
    CURRENT_DOCKERFILE_MD5=$(md5 Dockerfile | cut -d "=" -f 2)
    CURRENT_DOCKER_COMPOSE_MD5=$(md5 docker-compose.yml | cut -d "=" -f 2)

    echo "dockerfile"
    echo $DOCKERFILE_MD5
    echo $CURRENT_DOCKERFILE_MD5
    echo "docker-compose"
    echo $DOCKER_COMPOSE_MD5
    echo $CURRENT_DOCKER_COMPOSE_MD5

    # 新規作成でない場合で、元ファイルに更新があった場合に反映するため再ビルド
    if [ "$1" = "re"  ] || [ $DOCKERFILE_MD5 != $CURRENT_DOCKERFILE_MD5 ] || [ $DOCKER_COMPOSE_MD5 != $CURRENT_DOCKER_COMPOSE_MD5 ]; then
        echo_info "[!!] Update was detected"

        # 最新にする
        cp $DOCKERFILE .
        cp $COMPOSE_FILE .
        echo_info "Build Docker image"

        # オプション指定の場合はキャッシュを見ない
        if [ "$1" = "re"  ]; then
            docker-compose build --no-cache
        else
            docker-compose build
        fi
    fi

    # クリップボード共有用
    \rm -rf shared-register && mkdir shared-register && cd shared-register
    echo $(pbpaste) > clip
    echo $(ls -l clip) > tmp
    cd ..
    watch_shared_clipboard() {
        while [ 1 ]; do
            # フォルダが消えたらループ終了
            if [ ! -d shared-register ]; then
                return
            fi
            LATEST=$(cat shared-register/tmp)
            CURRENT=$(cd shared-register && ls -l clip)
            if [[ "$LATEST" != "$CURRENT" ]]; then
                pbcopy < shared-register/clip
                echo $CURRENT > shared-register/tmp
            fi
            sleep 1
        done
    }
    watch_shared_clipboard & # バックグラウンドで実行

    # 起動
    echo_info "Start Dev Container for Sandbox"
    docker-compose up -d

    # ログイン
    echo_info "Login"
    docker-compose exec -it -w /work sandbox zsh
    # コンテナの.zshrcにlogo_debianを追加しておくと良いです

    # 抜けたときの処理
    \rm -rf shared-register
    cd ..
    echo_info "Welcome back to HOST PC"
    # いまホストかコンテナか分からなくなるのでロゴ出しとくと良いです
    logo_darwin
    exec $SHELL -l
}


