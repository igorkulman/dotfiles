# zsnap
[[ -f ~/.zsh/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 https://github.com/marlonrichert/zsh-snap.git ~/.zsh/zsh-snap

source ~/.zsh/zsh-snap/znap.zsh

# pure prompt
znap prompt sindresorhus/pure

# Zsh plugins
znap source zsh-users/zsh-syntax-highlighting
znap source zsh-users/zsh-autosuggestions

# Zsh settings
zle_bracketed_paste=()
zle_highlight+=(paste:none)

unsetopt prompt_cr prompt_sp

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Zsh colors
zstyle ':prompt:pure:prompt:success' color green
zstyle ':prompt:pure:prompt:error' color red
zstyle ':prompt:pure:path' color cyan

# Fixing home / end keys
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# Aliases
alias bup="brew update && brew upgrade && brew cleanup"
alias cat="bat -p"
alias hs="hugo server --buildFuture --disableFastRender"
alias mc="/usr/local/bin/mc --nosubshell"
alias ls='ls -G'

export PATH=~/go/bin:$PATH
go env -w GO111MODULE=auto
# Secrets
if [ -f ~/.secrets ]; then
    source  ~/.secrets
fi

znap eval rbenv-init 'rbenv init -'
znap eval iterm2 'curl -fsSL https://iterm2.com/shell_integration/zsh'