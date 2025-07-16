source '/usr/share/zsh-antidote/antidote.zsh'                                                │set -gx FOUNDRY_HOME "/home/rothcold/.foundry/bin"
antidote load

autoload -Uz promptinit && promptinit && prompt pure

source /usr/share/doc/pkgfile/command-not-found.zsh

export TERMINFO=/usr/lib/terminfo

# GO Configs
export GOPATH=$HOME/Workspaces/go
export GOROOT=$HOME/.go
export PATH=$GOPATH/bin:$PATH; 
alias govm=g

# FNM Configs
export PATH="/run/user/1000/fnm_multishells/401213_1747104661890/bin":$PATH
export FNM_MULTISHELL_PATH="/run/user/1000/fnm_multishells/401213_1747104661890"
export FNM_VERSION_FILE_STRATEGY="local"
export FNM_DIR="/home/rothcold/.local/share/fnm"
export FNM_LOGLEVEL="info"
export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"
export FNM_COREPACK_ENABLED="false"
export FNM_RESOLVE_ENGINES="true"
export FNM_ARCH="x64"
rehash

# Foundry
export PATH=$HOME/.config/.foundry/bin:$PATH; 

source $HOME/.profile

fastfetch
fortune -e song100-hant tang300-hant

