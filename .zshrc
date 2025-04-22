# homebrew on apple silicon
export PATH=/opt/homebrew/bin:$PATH

autoload -Uz vcs_info

# Git branch formatting (no parentheses)
zstyle ':vcs_info:git:*' formats '%b'
zstyle ':vcs_info:*' enable git

# Flag to track if we've already printed the first prompt
__prompt_initialized=false

# Prompt command
precmd() {
  vcs_info
  local git_info=""
  [[ -n "$vcs_info_msg_0_" ]] && git_info=" %F{242}${vcs_info_msg_0_}%f"

  if $__prompt_initialized; then
    print ""
  else
    __prompt_initialized=true
  fi

  PROMPT="%F{blue}%~%f${git_info}
%F{green}❯%f "
}

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt inc_append_history

autoload -U compinit && compinit

# color
alias ls='ls --color=auto -hv'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias bup="brew update && brew upgrade && brew cleanup"
alias cat="bat -p"
alias hs="hugo server --buildFuture --disableFastRender"
alias mc="mc --nosubshell"

# fixing home / end keys
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey  "^[[1;9D" beginning-of-line
bindkey  "^[[1;9C" end-of-line

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# case insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Tab completion colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Secrets
if [ -f ~/.secrets ]; then
    source  ~/.secrets
fi

# fzf
[[ -f $HOME/.fzf.zsh ]] && source $HOME/.fzf.zsh

# rbenv
if command -v rbenv &>/dev/null; then
  eval "$(rbenv init - zsh)"
fi

# syntaxt higlighting
if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# auto suggestions
if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"