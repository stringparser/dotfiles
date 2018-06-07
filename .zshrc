# env
export ZSH=$HOME/.oh-my-ZSH
export LANG=en_US.utf-8
export LC_ALL=en_US.utf-8
export MANPATH="/usr/local/man:$MANPATH"
export UPDATE_ZSH_DAYS=30

# zsh config
ZSH_THEME="dracula"

# plugins
plugins=(git nvm osx)

# augment PATH
PATH="/usr/local/bin:/usr/local/sbin:$HOME/Library/Python/3.6/bin:$PATH"

# includes
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# cusotmize prompt
RPROMPT='$(whoami) %{$fg_bold[green]%}node-$(node -v)%{$reset_color%}'

# aliases
alias dot='/usr/bin/git --git-dir=$HOME/code/dotfiles --work-tree=$HOME'
alias gls='git ls-tree --full-tree $(git rev-parse --abbrev-ref HEAD)'
alias grune='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias drune='docker rm $(docker ps -aq)'
alias openUrlIOS='xcrun simctl openurl booted'
alias openUrlAndroid='adb shell am start -a android.intent.action.VIEW -d'
alias typeTextAndroid='adb shell input text'
# alias gulp='node $(find . -name "gulpfile.js" -not -path "./node_modules/*" | head -n1)'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bind to autocompletes
complete -F dot _git

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/jacami/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/jacami/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/jacami/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/jacami/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh