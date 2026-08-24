 # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="$PATH:/usr/local/bin"

# for git friendly, see: https://github.com/git-friendly/git-friendly
export PATH=~/dev/git-friendly:$PATH

# for python3
export PATH="$HOME/.pyenv/shims:$PATH"

# homebrew
export PATH="$HOME/.homebrew/bin:$PATH"
# end of homebrew

# NVM (sourced after homebrew so its bin dir takes priority on PATH)
export NVM_DIR="$HOME/.nvm"
[ -s "$HOME/.homebrew/opt/nvm/nvm.sh" ] && \. "$HOME/.homebrew/opt/nvm/nvm.sh"
[ -s "$HOME/.homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOME/.homebrew/opt/nvm/etc/bash_completion.d/nvm"
# end of NVM

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/baptistejouin/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
# Zinit end

# Add in Powerlevel10k 
zinit ice depth=1; zinit light romkatv/powerlevel10k  

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# History
HISTSIZE=200
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
# setopt cdablevars # > an argument to the cd builtin command that is not a directory is assumed to be the name of a variable whose value is the directory to change to.# end of history

# Word boundaries for word-jump (Cmd+Left/Right, Alt+Left/Right, etc.)
# Default WORDCHARS includes - and . which makes "search-service" one word.
WORDCHARS=''

#Completions settings
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 

# Rebind clear-screen from Ctrl+L to Ctrl+; (Ctrl+L stays free for Ghostty split navigation)
bindkey -r '^L'
bindkey '\eC' clear-screen

# Aliases
alias ls='ls --color -la'
alias vi='nvim'
alias vim='nvim'
alias ':q'='exit'
alias reload='source ~/.zshrc'
alias h='hx .'

# custom utils
alias config='$EDITOR ~/.zshrc'
alias helix-config='$EDITOR ~/.config/helix/config.toml'
alias aerospace-config='$EDITOR ~/.aerospace.toml'
alias zellij-config='$EDITOR ~/.config/zellij/config.kdl'
alias ghostty-config='$EDITOR "~/Library/Application Support/com.mitchellh.ghostty/config.ghostty"'

alias c='claude'
alias cr='claude --resume'
alias z='zellij'
alias za='zellij attach'

alias noop='cd ~/noop'
alias t='cd /tmp'
alias w'cd ~/workflow'

# variables
export EDITOR=hx

# cargo bin last, so a locally-built binary (e.g. git-master hx) outranks the homebrew one
export PATH="$HOME/.cargo/bin:$PATH"


