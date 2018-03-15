# Dihydrro conifg

## Download

#### Requirement

  * git

#### Execute

    `git clone --recursive https://github.com/dihydrro/config $HOME/.dihy_config`

## Window Manager

#### Requirements

  * xorg
  * xinit
  * xautolock
  * xterm
  * i3-wm
  * i3lock

#### Execute

    `cp $HOME/.dihy_config/.xinitrc $HOME/.dihy_config/.Xresources $HOME/`

    `cp -rf $HOME/.dihy_config/.i3 $HOME/.i3`

  Put this lines into your shell rc (eg: .zshrc, .bashrc, ...)

    ```
    if [[ $ENABLE_SERVER_X && ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
      exec startx -- vt1 &> /dev/null
    fi
    ```

## Shell

### Zsh

#### Requirements

  * zsh
  * xclip (to use pbp and pbc to [in|out]put from|to clipboard)
  * tmux (if you want to use the terminal multiplexer)

#### Execute

    `echo "source $HOME/.dihy_config/.zshrc" >> $HOME/.zshrc`

    `echo "source-file $HOME/.dihy_config/.tmux.conf" >> $HOME/.tmux.conf`

WARN: if you don't want to use tmux don't use last command and go into `$HOME/.dihy_config/.zshrc`
look for `tmux conf` and comment the lines behind.

## Editor

### Vim

#### Requirements

  * vim

##### Special requirements for javascript|typescript linter

  * node
  * npm

#### Execute

    `cp -rf $HOME/.dihy_config/.vim $HOME/.vim`

    `echo ":source $HOME/.dihy_config/.vimrc" >> $HOME/.vimrc`

if you want to bind the unnamedplus register into your clipboard you need a vim version with +clipboard.

    `vim --version | grep clipboard`

to see if available, an easy way of getting it if it's not is to install `gvim`

if you wan't to use the js|ts linter you need to install this:

    `npm install [--global|--save|--save-dev] tslint typescript`

### Others

you still can use the tslint.json file if your editor is configured to use the tslint linter.
