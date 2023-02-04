if status is-interactive
    # Commands to run in interactive sessions can go here
end

function init
	fish_vi_key_bindings
	set -gx GOPATH $HOME/Workspaces/go; set -gx GOROOT $HOME/.go; set -gx PATH $GOPATH/bin $PATH; # g-install: do NOT edit, see https://github.com/stefanmaric/g
	alias govm=g
	if type -q setzkbmap
		alias swapctrl='setxkbmap -option "ctrl:nocaps"'
		swapctrl
	end
	fenv source $HOME/.profile
end

function fish_greeting
	neofetch
	fortune -e firefly | cowsay -f koala -W 80
end 


init
