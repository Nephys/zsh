# Make sure this file has a symlink to ~/.zshrc
# ln -sf ${HOME}/.zshrc ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.zshrc


# Attach to the previous tmux session or create a new one
if [ -z "$TMUX" ] && ! [ -n "$SSH_CLIENT" ] && ! [ -n "$SSH_TTY" ]; then
    tmux attach || exec tmux new-session
fi

# Run on startup
tfetch

# Oh-My-Posh
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/config.toml)"
# Zoxide
eval "$(zoxide init --cmd cd zsh)"


# Plugins
source ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTDUP=erase
# End of lines configured by zsh-newuser-install


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
setopt APPENDHISTORY
setopt SHAREHISTORY

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
alias update-dots='__cd=$(pwd) && cd ~/.dotfiles && git pull --recurse-submodules origin main && chmod +x install.sh && ./install.sh && cd $__cd && unset __cd'
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
alias apt-get='echo nuh uh'
alias apt='echo nuh uh'
