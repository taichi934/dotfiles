#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# 日本語を使用
export LANG=ja_JP.UTF-8

# パスを追加したい場合
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export PATH="$PATH:/usr/local/bin/pipenv"
export PATH=$PATH:/usr/local/bin #homebrewのg++にするため

# vim のキーバインド
bindkey -v

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs..

# alias +++++++++++++++++++++++++++++++++++++++++++++++++++++++
#alias ls='colorls --group-directories-first --almost-all'
#alias ls -la='colorls --group-directories-first --almost-all --long' # detailed list view.
alias ...='cd ../..'
alias ....='cd ../../..'


# hyper: hyper-tab-icons
precmd() {
   pwd=$(pwd)
   cwd=${pwd##*/}
   print -Pn "\e]0;$cwd\a"
}

preexec() {
   printf "\033]0;%s\a" "${1%% *} | $cwd"
}

#prompt ++++++++++++++++++++++++++++++++++++++++++++++++++
# プロンプトを2行で表示、時刻を表示
#PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color}@${fg[blue]}%m${reset_color}(%*%) %~%# "

#補完 ++++++++++++++++++++++++++++++++++
# 自動補完を有効にする
# コマンドの引数やパス名を途中まで入力して <Tab> を押すといい感じに補完してくれる
# 例： `cd path/to/<Tab>`, `ls -<Tab>`
autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完で大文字にもマッチ
# 補完候補の色付け
autoload -Uz colors
colors
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' list-colors "${LS_COLORS}"

setopt correct_all # autocorrect commands
#+++++++++++++++++++++++++++++++++++++++++++

#  $ tree でディレクトリ構成表示++++++++++++++++++++++++++++++++
# alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g'"

#git++++++++++++++++++++++++++++++++++++++++++++++++++++++++


#=========================

# cd した先のディレクトリをディレクトリスタックに追加する
# ディレクトリスタックとは今までに行ったディレクトリの履歴のこと
# `cd +<Tab>` でディレクトリの履歴が表示され、そこに移動できる
setopt auto_pushd
# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

# コマンドミスを修正
setopt correct

# cd without typing cd
setopt auto_cd

# ヒストリーに重複を表示しない
setopt histignorealldups

#zsh-completion
fpath=(/usr/local/share/zsh-completions $fpath)
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

#plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-completions)

#zsh syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#zsh auto suggestion
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
export PATH="/usr/local/opt/flex/bin:$PATH"
export HOMEBREW_GITHUB_API_TOKEN=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
