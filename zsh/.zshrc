if [[ -n "$KITTY_INSTALLATION_DIR" ]]; then
  export KITTY_SHELL_INTEGRATION="enabled"
  autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
  kitty-integration
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/bbulls/.zshrc'



# Get ls and grep to work in color
alias ls="ls --color=auto"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


# ignore duplicate commands and empty lines in history
setopt HIST_IGNORE_DUPS

# java compile and run
jcar() {
trap "rm $1.class" SIGINT SIGTERM
javac $1.java
java $1
rm $1.class
}

# create a new virtual environment, activate it, and create .envrc automatically
venv() {
	local venv_name
	local dir_name=$(basename "$PWD")
	
	# if there are no arguments or the last argument starts with a dash, use dir_name
	if [[ $# -eq 0 ]] || [[ "${!#}" == -* ]]; then
		venv_name="$dir_name"
	else
		venv_name="${!#}"
		set -- "${@:1:$#-1}"
	fi
	
	
	# check if .envrc already exists
	if [ -f .envrc ]; then
		echo "ERROR: .envrc already exists" >&2
		return 1
	fi
	
	# Create venv
	if ! uv venv --seed --prompt "$@" "$venv_name"; then
		echo "Error: Failed to create venv" >&2
		return 1
	fi
	
	# Create .envrc
	echo "layout python" > .envrc
	
	# Append project name and directory to projects file
	echo "${venv_name} = ${PWD}" >> ~/.projects
	
	# Allow direnv to immediately activate the virtual environment
	direnv allow
}

workon() {
	local project_name="$1"
	local projects_file="$HOME/.projects"
	local project_dir
	
	#check for projects config file
	if [[ ! -f "$projects_file" ]]; then
		echo "Error: $projects_file not found" >&2
		return 1
	fi
	
	#Get the project directory for the given project name
	project_dir=$(grep -E "^$project_name\s*=" "$projects_file" | sed 's/^[^=]*=\s*//')
	
	# Ensure a project directory was found
	if [[ -z "$project_dir" ]]; then
		echo "Error: Project '$project_name' not found in $projects_file" >&2
		return 1
	fi
	
	# Ensure a project directory exists
	if [[ ! -d "$project_dir" ]]; then
		echo "Error: Directory $project_dir does not exist" >&2
		return 1
	fi
	
	# change directories
	cd "$project_dir"
}


autoload -Uz compinit
compinit
# End of lines added by compinstall

eval "$(starship init zsh)"
export STARSHIP_CONFIG=$HOME/.config/starship.toml

export NVM_DIR="/home/bbulls/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" 

source $HOME/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(direnv hook zsh)"

