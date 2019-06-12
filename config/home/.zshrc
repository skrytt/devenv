# If you come from bash you might have to change your $PATH.
export PATH=$PATH:/home/mkemp/.cargo/bin
export GOPATH=/home/mkemp/git-local-repos/go

# Path to your oh-my-zsh installation.
export ZSH="/home/mkemp/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
DEFAULT_USER=mkemp
POWERLEVEL9K_DIR_HOME_BACKGROUND='000'
POWERLEVEL9K_DIR_HOME_FOREGROUND='011'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='000'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='011'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='000'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='011'
POWERLEVEL9K_DIR_ETC_BACKGROUND='000'
POWERLEVEL9K_DIR_ETC_FOREGROUND='011'

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)
POWERLEVEL9K_STATUS_BACKGROUND='000'
POWERLEVEL9K_STATUS_FOREGROUND='011'
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND='000'
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND='011'
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='000'
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='011'
POWERLEVEL9K_TIME_BACKGROUND='000'
POWERLEVEL9K_TIME_FOREGROUND='011'

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

export LANG=en_GB.utf8
export LC_CTYPE="$LANG"

# Preferred editor for local and remote sessions
export EDITOR='vim'

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls="exa --colour=always"
alias ll="exa -alh --git --git-ignore --colour=always"
alias lt="exa -alh --git --git-ignore --tree --colour=always"

source ~/.zplug/init.zsh
zplug load

