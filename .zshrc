# myzshrc
DIHY_PATH="$HOME/.dihy_config"

export HISTFILE=$HOME/.zsh_history
export SAVEHIST=1000
export HISTSIZE=100

setopt RM_STAR_WAIT

# completion
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

bindkey -e
bindkey '^[[3~' delete-char

# history
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "$key[Up]" ]] && bindkey -- "$key[Up]" up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "key[Down]" down-line-or-beginning-search


## open myzshrc
alias config="vim $DIHY_PATH/.zshrc"
## update myzshrc change
alias src="source $DIHY_PATH/.zshrc"


# my ls config
export PATH="$PATH:$DIHY_PATH/ft_bin/:/usr/local/go/bin"
## my ls aliases
if [ `uname` = "Linux" ]; then
	alias fls="ft_ls_linux -G"
else
	alias fls="ft_ls_darwin -G"
fi

alias fla="fls -a"
alias fl="fls -la"
alias fll="fls -l"


# git aliases
alias gcln="git clone --recursive"
alias gst="git status"
alias gdd="git add"
alias grm="git rm"
alias gcm="git commit"
alias gpsh="git push"
alias gpll="git pull"
alias gmrg="git merge"
alias gmrga="git merge --abort"
alias gt="git checkout"
alias gdff="git diff"
alias grbs="git rebase"
alias grbsc="git rebase --continue"
alias grbsa="git rebase --abort"
alias grbss="git rebase --skip"
alias glg="git log"
alias gl="git log --oneline --abbrev-commit --all --graph --decorate --color"
alias gft="git fetch"
alias gbr="git branch"
alias gsmuir="git submodule update --init --recursive"


# clipboard alias
alias pbc="xclip -selection clipboard"
alias pbp="xclip -selection clipboard -o"


# 42 norme alias
alias norme="norminette **/*.[ch] | grep -v 'Norme' -B1"


# docker alias
alias dcmp="docker-compose"


#alias i3lock
alias i3l="i3lock -c eb4242 -e -f"


# prompt config
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
setopt prompt_subst

function prompt_dihydrro_precmd {
  vcs_info
}

function prompt_dihydrro_setup {
  setopt LOCAL_OPTIONS
  unsetopt XTRACE KSH_ARRAYS
  prompt_opts=(cr percent sp subst)

  # Load required functions.
  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info

  # Add hook for calling vcs_info before each command.
  add-zsh-hook precmd prompt_dihydrro_precmd

  # Set vcs_info parameters.
  zstyle ':vcs_info:*' enable bzr git hg svn
  zstyle ':vcs_info:*' check-for-changes true
  zstyle ':vcs_info:*' formats ' - %F{green}[%b%F{green}]%f'

  # Define prompts.
  PROMPT='%F{red}%n@%m%f %F{yellow}%~%f${vcs_info_msg_0_} %# '
  RPROMPT='%F{red}%T%f %F{yellow}-%f %F{green}(%?)%f'
}

prompt_dihydrro_setup "$@"


# extract function
## extract *filename*
## will use the right extract command depend on the file extension
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xjf $1     ;;
			*.tar.gz)    tar xzf $1     ;;
			*.bz2)       bunzip2 $1     ;;
			*.rar)       unrar e $1     ;;
			*.gz)        gunzip $1      ;;
			*.tar)       tar xf $1      ;;
			*.tbz2)      tar xjf $1     ;;
			*.tgz)       tar xzf $1     ;;
			*.zip)       unzip $1       ;;
			*.Z)         uncompress $1  ;;
			*.7z)        7z x $1        ;;
			*)	echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}


# tmux conf
alias tmux="TERM=screen-256color tmux"
[ -z "$TMUX"  ] && exec tmux -2
