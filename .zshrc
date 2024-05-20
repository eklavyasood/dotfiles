echo
echo
neofetch
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zinit and plugin storage directory
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# check whether zinit is installed
if [[ ! -d "$ZINIT_HOME" ]] ;then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# source zinit
source "${ZINIT_HOME}/zinit.zsh"

# powerlevel prompt
zinit ice depth=1; zinit light romkatv/powerlevel10k

# zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# load completions
autoload -U compinit && compinit

zinit cdreplay -q

bindkey '^f' autosuggest-accept

# history back-forward
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'exa $realpath'

# aliases
alias orphans="sudo pacman -Rs $(pacman -Qdt | awk '{print $1}')"
alias nf='neofetch'
alias pf='pfetch'
alias ls='exa -alh'
alias shutdown='systemctl poweroff'
alias v='nvim'
alias wifi='nmtui'
alias winclass="xprop | grep 'CLASS'"
alias repo="cd ~/Documents/git-repos/"
alias wiki="wiki-tui"
alias ani="ani-cli"
alias cpp="g++"

# # -----------------------------------------------------
# # GIT
# # -----------------------------------------------------

# alias gs="git status"
# alias ga="git add"
# alias gc="git commit -m"
# alias gp="git push"
# alias gpl="git pull"
# alias gst="git stash"
# alias gsp="git stash; git pull"
# alias gsw="git switch"
# alias gcheck="git checkout"

# # -----------------------------------------------------
# # SCRIPTS
# # -----------------------------------------------------

alias ascii='~/dotfiles/scripts/figlet.sh'

# # -----------------------------------------------------
# # FUZZY FINDER
# # -----------------------------------------------------

alias vif='nvim $(fzf)'

# # -----------------------------------------------------
# # Zoxide
# # -----------------------------------------------------

# alias cd='z'

# # -----------------------------------------------------
# # Tmux
# # -----------------------------------------------------

alias t='tmux'

# shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
