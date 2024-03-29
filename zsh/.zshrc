# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  #source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.cluster
#export PATH=$HOME"/.cargo/bin":$PATH
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
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
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
#
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

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
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias open='sh -c '\''xdg-open "$@" &'\'' _'
alias files='sh -c '\''thunar "$@" &'\'' _'
alias copydoi='sh -c '\''doi2bib "$@" | xclip -selection clipboard'\'' _'
 #git
alias add="git add"
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status -s'  # 'status' is protected name so using 'stat' instead
alias tag='git tag'
alias newtag='git tag -a'
alias merge="git merge"
alias diff="git diff"
alias python="python3"
alias ls="exa --icons -l --no-filesize --no-permissions --no-user --time-style='long-iso' --sort extension" 
alias switch="git switch"
alias e="exit"
alias mio="wine /usr/bin/Mio.exe &"
alias mugi="wine /usr/bin/Tsumugi.exe &"
alias yui="wine /usr/bin/Yui.exe &"
alias azusa="wine /usr/bin/Azusa.exe &"
alias table="wine /usr/bin/Table.exe &"
alias ritsu="wine /usr/bin/Ritsu.exe &"
#source ~/powerlevel10k/powerlevel10k.zsh-theme
alias copy="xclip -selection clipboard < "
alias enter_el_insurgente="bash ~/.cluster/enter_el_insurgente"
alias enter_el_insurgente_local="bash ~/.cluster/enter_el_insurgente_local"
alias mount_el_insurgente="bash ~/.cluster/mount_el_insurgente"
alias mount_el_insurgente_local="bash ~/.cluster/mount_el_insurgente_local"
alias unmount_el_insurgente="bash ~/.cluster/unmount_el_insurgente"
alias cetes="./.cetes/cetes.py"
alias doi="doi2bib"
alias v="nvim"
alias tags="ctags -R ."
#alias neofetch="neofetch | lolcat"
alias cat='sh -c '\''bat "$@" --theme Dracula'\'' _'
alias check="vulture"
alias icat="kitty +kitten icat"
alias newbranch="bash ~/.gitscripts/newbranch"
alias deletebranch="bash ~/.gitscripts/deletebranch"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
alias tensorflow="source ~/.venv/tensorflow/bin/activate"
alias pytorch="source ~/.venv/pytorch/bin/activate"
alias screenkey="screenkey -s small --opacity 0.1 -t 0.25"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
