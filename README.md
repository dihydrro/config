# Dihydrro conifg

## Requirments

Install with your packet manager:

    git
    tmux
    nvim

## Install my config

Download the configuration directory:

    git clone --recursive https://github.com/dihydrro/config $HOME/.dihy_config

Echo this line into your shell config file:

    echo "source $HOME/.dihy_config/.myzshrc" >> $HOME/.zshrc

#### Use my vim config

Copy the vim plugin directory into your home:

    cp -rf $HOME/.dihy_config/.vim $HOME/.vim

Echo this line into your vim config file:

    echo ":source $HOME/.dihy_config/.vimrc" >> $HOME/.vimrc

#### Use tmux config

Echo this line into your tmux config file:

    echo "source-file $HOME/.dihy_config/.tmux.conf" >> $HOME/.tmux.conf

#### tslint config

###### Requirements

    node
    npm
    tslint
    typescript

If your editor use the tslint linter, you can copy this file into your root working space

    cp $HOME/.dihy_config/tslint.json $HOME/myproject/tslint.json
