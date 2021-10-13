#!/usr/bin/env sh

## 20211004

# [zshのhistoryを便利に使うためのTips - Qiita](https://qiita.com/syui/items/c1a1567b2b76051f50c4)
export HISTSIZE=10000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt hist_ignore_all_dups
setopt hist_verify
setopt hist_reduce_blanks
setopt share_history

# shellcheck disable=SC1090
# export GOPATH=$(go env GOPATH)
# export GOBIN=$(go env GOPATH)/bin
export PATH="$HOME/.anyenv/bin:$HOME/bin:$HOME/go/bin:$PATH"

[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh

# * [CUIで見やすい git コミットグラフ: git-foresta 作った - Qiita](https://qiita.com/takaakikasai/items/fc684d95c9841069889b)
alias gf='git foresta'
alias gfh='git foresta | head'
alias relogin='exec $SHELL -l'

# [【zsh】絶対やるべき！ターミナルでgitのブランチ名を表示&補完【git-prompt / git-completion】 - Qiita](https://qiita.com/mikan3rd/items/d41a8ca26523f950ea9d)
# git-promptの読み込み
. ~/.zsh/git-prompt.sh
# git-completionの読み込み
## 404!? https://github.com/koalaman/shellcheck/wiki/SC3030
# shellcheck disable=SC3030
fpath=(~/.zsh "$fpath")
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit
# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
# プロンプトの表示設定(好きなようにカスタマイズ可)
setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
\$ '

# 20211006
# [goenv/INSTALL.md at master · syndbg/goenv](https://github.com/syndbg/goenv/blob/master/INSTALL.md)
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

## 20211007

export PAGER=less
