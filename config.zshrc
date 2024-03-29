# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="random" # (...please let it be pie... please be some pie..)
#ZSH_THEME=("crcandy jonathan") # (...please let it be pie... please be some pie..)
# ZSH_THEME_RANDOM_BLACKLIST=( "cloud" )
ZSH_THEME_RANDOM_IGNORED=("emotty cloud,sammy,fletcherm, edvardm, humza, adben,blinks, evan, agnoster, emotty, humza")

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
ZSH_THEME_RANDOM_CANDIDATES=( "jonathan"  "fox" "crcandy")
# "agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
 zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git autojump zsh-autosuggestions)
plugins=(git z sudo zsh-autosuggestions zsh-syntax-highlighting )


# install autosuggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions



unsetopt INC_APPEND_HISTORY
unsetopt SHARE_HISTORY

setopt nonomatch
unsetopt nomatch

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
   #export EDITOR='mvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
 alias zshconfig="mate ~/.zshrc"
 alias ohmyzsh="mate ~/.oh-my-zsh"

#alias cat=batcat
alias ln='ln -i'
alias cp='cp -i'

export HIST_STAMPS="yyyy-mm-dd"

### configuration for OS
# 识别linux为ubantu还是redhat
if [ -f /etc/os-release ]; then
	source /etc/os-release
fi


if [ -f /etc/redhat-release ]; then
#  echo "redhat_enable_cron"   kill_redhat_firewall
elif [[ $ID =~ "Ubuntu" || $PRETTY_NAME =~ "Ubuntu" ]]; then
  export RCUTILS_CONSOLE_OUTPUT_FORMAT="[{severity} {time}] [{name}]: {message} ({function_name}() at {file_name}:{line_number})"
  if [ $VERSION_ID =~ "20.04" ]; then
    # export ROS_DISTRO=galactic
    # export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
    # export DEFAULT_RMW_IMPLEMENTATION=rmw_fastrtps_cpp

    export ROS_DISTRO=humble
    #export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
    #export DEFAULT_RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
    export KS_EXECUTOR_CONF_PATH='/home/kuoted/01_work/04_crayon-masp/dev/src/stdROS/ks_executor'
    export KS_EXECUTOR_CONF_PATH='/home/kuoted/01_work/04_crayon-masp/dev/src/stdROS/ks_extention/ks-reference-system/'
  elif [ $VERSION_ID =~ "22.04" ]; then
    #export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
    export PATH="/usr/local/cuda/bin:$PATH"
    export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
    xhost +
    #export ROS_DISTRO=humble
  fi
  export SCHEDULER_RT_PATH=$HOME/01_work/04_crayon-masp/bugfix/src/ros2/scheduler_rt
#  echo "ubuntu_enable_cron"   kill_ubuntu_firewall
elif [[ $lsb =~ "Debian" || $PRETTY_NAME =~ "Debian" ]]; then
  # echo "debian_enable_cron"   kill_unknown_firewall
elif [[ $lsb =~ "SUSE" || $PRETTY_NAME =~ "SUSE" ]]; then
  # echo "suse_enable_cron"     kill_unknown_firewall
elif [[ $lsb =~ "NeoKylin" || $PRETTY_NAME =~ "NeoKylin" ]]; then
  # echo "中标麒麟：redhat_enable_cron"   kill_redhat_firewall
elif [[ $lsb =~ "Kylin" || $PRETTY_NAME =~ "Kylin" ]]; then
  # echo "银河麒麟：ubuntu_enable_cron"   kill_ubuntu_firewall
else
  # echo "Warn: Bypass system check"
fi
if [ -d /Users/kuoted/Library/Python/3.9/bin/ ]; then
  export PATH=/Users/kuoted/Library/Python/3.9/bin:$PATH
fi


# environment for autoware
# Created by `pipx` on 2023-05-04 06:37:24
#source /opt/ros/humble/setup.zsh
#export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"

### debug for ROS2

#source /home/kuoted/01_work/23_ros2/galactic2/04_GEEP50_0002_AppFw/install/setup.zsh
#export PATH=/home/kuoted/tools/depot_tools:/home/kuoted/.local/bin:/home/kuoted/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin


eval export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export ROS_DISABLE_LOANED_MESSAGES=0
