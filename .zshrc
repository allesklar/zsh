# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# TODO remove oh-my-zsh and install needed plugins manually in zshrc dot repository
# Path to your oh-my-zsh installation.
case "$OSTYPE" in
  darwin*)
    # MacOS
    export ZSH="/Users/swamiatma/.oh-my-zsh"
  ;;
  linux*)
    export ZSH="/home/deploy/.oh-my-zsh"
  ;;
esac

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  # bundler
  # brew
  # capistrano
  fzf
  # git
  # osx
  # rbenv
  # ruby
  vi-mode
  # must be in last position
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`. <<<<<<
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias c='clear'
alias ls='ls -oaGFh'
# neovim, baby!
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

export EDITOR="nvim"
export BUNDLER_EDITOR="nvim"
eval "$(rbenv init -)"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

# Add zsh scripts to path
case "$OSTYPE" in
  darwin*)
    # MacOS
    export PATH="$HOME/Documents/coding/zsh/scripts:$PATH"
  ;;
esac

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# I might not need it but enabled it to be on safe side
export LANG=en_US.UTF-8

# Compilation flags
# When to use this line???????? I will enable it for now
case "$OSTYPE" in
  darwin*)
    # MacOS
    export ARCHFLAGS="-arch x86_64"
  ;;
esac

precmd() { print "" } # blank line before prompt
PROMPT="%(?.%F{106}√.%F{160}?%?) %F{240}%m: %B%F{37}%~ %F{210}-> %b%f"

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Do not show deprecated warnings in ruby/rails
# This line might create problems with older Ruby versions
# export RUBYOPT='-W:no-deprecated -W:no-experimental'
