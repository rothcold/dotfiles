if status is-interactive
    # Commands to run in interactive sessions can go here
end

function init
	fish_vi_key_bindings
	set -gx GOPATH $HOME/Workspaces/go; set -gx GOROOT $HOME/.go; set -gx PATH $GOPATH/bin $PATH; # g-install: do NOT edit, see https://github.com/stefanmaric/g
	alias govm=g
	alias ssh='TERM=xterm-256color ssh'
	alias swapctrl='setxkbmap -option "ctrl:nocaps"'
end

function fish_greeting
	neofetch
	fortune -e tang300 song100 | cowsay -f koala -W 80
end 


init
