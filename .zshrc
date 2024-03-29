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
bindkey  "^[[1;9D" beginning-of-line
bindkey  "^[[1;9C" end-of-line

# Aliases
alias bup="brew update && brew upgrade && brew cleanup"
alias cat="bat -p"
alias hs="hugo server --buildFuture --disableFastRender"
alias ls="eza"
alias ll="eza -alh"
alias tree="eza --tree"
alias mc="mc --nosubshell"

if [ -d "/opt/homebrew" ]; then    
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Secrets
if [ -f ~/.secrets ]; then
    source  ~/.secrets
fi

znap eval rbenv-init 'rbenv init -'
znap eval iterm2 'curl -fsSL https://iterm2.com/shell_integration/zsh'

# fastlane
[[ -f ~/.fastlane/completions/completion.sh ]] ||
    fastlane enable_auto_complete

source  ~/.fastlane/completions/completion.sh

# fzf
[[ -f ~/.fzf.zsh ]] ||
    yes | $(brew --prefix)/opt/fzf/install

source ~/.fzf.zsh
