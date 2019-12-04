alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls="ls -FG"
alias ll="ls -lFG"
alias la="ls -laFG"

#NOTICE: call gvm setup script from here

# golang
function reset-gopath {
	export GOPATH=$HOME/go
}
function gvm-use {
	gvm use $1
	reset-gopath
}
reset-gopath
export PATH=$PATH:$GOPATH/bin

# homebrew
alias vi=/usr/local/bin/vim
alias vim=/usr/local/bin/vim
#export HOMEBREW_GITHUB_API_TOKEN

# gcloud SDK
alias kubectl-current="kubectl config current-context"
alias kubectl-image="kubectl get pods -o 'custom-columns=NAME:metadata.name,IMAGE-ID:status.containerStatuses[0].imageID'"
