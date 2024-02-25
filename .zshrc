# Make sure this file has a symlink to ~/.zshrc
# ln -sf ${HOME}/.zshrc ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.zshrc


# Attach to the previous tmux session or create a new one
if [ -z "$TMUX" ] && ! [ -n "$SSH_CLIENT" ] && ! [ -n "$SSH_TTY" ]; then
    tmux attach || exec tmux new-session
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle :compinstall filename '/home/nephys/.zshrc'
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
# End of lines configured by zsh-newuser-install
source ~/.config/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/zsh/plugins/powerlevel10k/p10k.zsh ]] || source ~/.config/zsh/plugins/powerlevel10k/p10k.zsh

# Options
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Keybinds
bindkey ' '		    magic-space				            # history expansion on space
bindkey '^H'    	backward-kill-word			        # ctrl + backspace
bindkey '^[[3;5~'	backward-kill-word			        # ctrl + del
bindkey '^[[1;5C'	forward-word				        # ctrl + ->
bindkey '^[[1;5D'	backward-word				        # ctrl + <-
bindkey '^[[5~'		beginning-of-buffer-or-history		# page up
bindkey '^[[6~'		end-of-buffer-or-history		    # page down
bindkey '^[[1~' 	beginning-of-line			        # home
bindkey '^[[4~'	    end-of-line				            # end

# Z Style
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:complete:*' gain-privileges 1

# Aliasses
alias please='sudo'
alias cls='clear'
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -A --color=auto'
alias lla='ls -lA --color=auto'
alias l='ls -CF'
alias grep='grep --color=auto'
alias vim='nvim'
alias v='nvim'
alias vi='nvim'
alias nv='nvim'
alias nano='nvim'
alias furryfox='firefox'
