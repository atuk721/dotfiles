# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"

# For history
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

# Use Neovim
alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"

# For fzf
export FZF_DEFAULT_OPTS='--height 40% --reverse --border --multi'
export FZF_DEFAULT_COMMAND='rg -l .'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_LEGACY_KEYBINDINGS=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# For nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set path
# export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/go/bin:/opt/apache-maven-3.6.0/bin:`yarn global bin`:$PATH"
export PATH="$HOME/.local/bin:/usr/local/go/bin:$HOME/.cargo/bin:$HOME/go/bin:/opt/apache-maven-3.6.0/bin:$PATH"

# For racer
#set -x RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src

# For direnv
eval "$(direnv hook zsh)"

# Work

alias mysqlp='MYSQL_PWD=$PROD_DB_PASS mysql --ssl-mode DISABLED -A -h 127.0.0.1 -u $PROD_DB_USER -D $PROD_DB_DATABASE'
alias mysqlt='MYSQL_PWD=$TEST_DB_PASS mysql --ssl-mode DISABLED -A -h 127.0.0.1 -u $TEST_DB_USER -D $TEST_DB_DATABASE'

# For z.sh
. ~/.local/lib/z.sh

# Start tmux
if [[ ! -n $TMUX ]]; then
  tmux
fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/mc mc
