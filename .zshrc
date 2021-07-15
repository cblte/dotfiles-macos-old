#
#   ██████╗██████╗    Carsten Brueggenolte
#  ██╔════╝██╔══██╗   https://zn80.net
#  ██║     ██████╔╝   https://github.com/cblte
#  ██║     ██╔══██╗
#  ╚██████╗██████╔╝
#   ╚═════╝╚═════╝
#
# My .zshrc config. Not much to see here.
#
# This config has been update to work
# with my macOS Big Sur installation
#
# Please see README.md for instructions on how to
# install the used plugins
# -------------------------------------------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Do not sent out analytics to brew, sorry!
export HOMEBREW_NO_ANALYTICS=1
# And load brew shell environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# ----- Export
export TERM="xterm-256color"                      # getting proper colors
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"

# ----- ZSH Plugins
# Install them with homebrew
# brew install zsh-syntax-highlighting zsh-autosuggestions homebrew/cask-fonts/font-menlo-for-powerline
#
# enable auto-suggestions based on the history
if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # change suggestion color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi
# enable syntax-highlighting
if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# ----- Path Section
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi

# ----- Options section
setopt autocd                                                   # if only directory path is entered, cd there.
setopt correct                                                  # Auto correct mistakes
setopt nobeep                                                   # No beep
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
# setopt rcexpandparam                                            # Array expension with parameters
# setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt inc_append_history                                       # Save commands are added to the history immediately, otherwise only when shell exits.
# setopt nonomatch                                                # Hide error message if there is no match for the pattern
setopt notify                                                   # Report the status of background jobs immediately

WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word

# ----- History Configuration
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

# ----- Alias Section
alias vim="nvim"
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB

## Get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## Get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

## Listing things
alias ls='ls -alG' # my preferred listing
alias la='ls -aG'  # all files and dirs
alias ll='ls -lG'  # long format
alias lt='ls -aTG' # tree listing

## Changing "ls" to "exa" if available
if [[ -e /opt/homebrew/bin/exa ]]; then
  alias ls='exa -al --color=always --group-directories-first' # my preferred listing
  alias la='exa -a --color=always --group-directories-first'  # all files and dirs
  alias ll='exa -l --color=always --group-directories-first'  # long format
  alias lt='exa -aT --color=always --group-directories-first' # tree listing
fi

## youtube-dl aliases
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

## dotfiles alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

## All things git Stuff
alias gitu='git add . && git commit && git push'

alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status'  # 'status' is protected name so using 'stat' instead
alias tag='git tag'
alias newtag='git tag -a'

## the NULL pointer of envs.sh
0file() { curl -F"file=@$1" https://envs.sh ; }
0pb() { curl -F"file=@-;" https://envs.sh ; }
0url() { curl -F"url=$1" https://envs.sh ; }
0short() { curl -F"shorten=$1" https://envs.sh ; }


# ----- Prompt section
## install spaceship and starship through brew first!
## only uncommment one. Either starship or spaceship!

## Source the awesome starship.rs prompt
# eval "$(starship init zsh)"

## Source the awesome https://spaceship-prompt.sh/ prompt
#ZSH_THEME="spaceship"
#autoload -U promptinit; promptinit
#prompt spaceship

source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
