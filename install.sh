echo $SUDO_USER
ME=$SUDO_USER

TBash="/home/$ME/.bashrc"
SBash="/home/$ME/dotfiles/.bashrc"

TGConfig="/home/$ME/.gitconfig"
SGConfig="/home/$ME/dotfiles/.gitconfig"

sshdir="/home/$ME/.ssh"

Tauthkeys="/home/$ME/.ssh/authorized_keys"
Sauthkeys="/home/$ME/dotfiles/authorized_keys"

TVRC="/home/$ME/.vimrc"
SVRC="/home/$ME/dotfiles/.vimrc"

## Checking if in root
if [[ "$(id -u)" -eq 0 ]]; then
	echo "It be in root!"
	
	## Verifying apt installer
	echo $(which apt)
	if [[ -n "$(which apt)" ]]; 
	then
		echo "apt do be installed there."
		
		## Installing defaults
		apt install -y \
			nmap \
			dnsutils \
			libgl1-mesa-glx \
			libegl1-mesa \
			libxrandr2 \
			libxrandr2 \
			libxss1 \
			libxcursor1 \
			libxcomposite1 \
			libasound2 \
			libxi6 \
			libxtst6
		if [[ -e $(ls Anaconda3*.sh 2> /dev/null | head -1) ]]; then
			echo "Installer found, running it"
		        bash Anaconda3-2024.02-1-Linux-x86_64.sh -b -p /home/$ME/anaconda3
			echo "PATH=$PATH:/home/kduncan/anaconda3/bin" >> /home/$ME/.profile
	        else
	 		echo "Downloading anaconda installer"		
			curl -O https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh
			bash Anaconda3-2024.02-1-Linux-x86_64.sh -b -p /home/$ME/anaconda3
			echo "PATH=$PATH:/home/kduncan/anaconda3/bin" >> /home/$ME/.profile
		fi

	else
		echo "apt aint installed there bro..."
	fi

else
	echo "script aint in root ;T;" 1>&2
	exit 1
fi


## Creating/linking .bashrc
if [ ! -f "$TBash" ]; then
	echo "Creating .bashrc file"
	ln -s "$SBash" "$TBash"
	echo ".bashrc created"
else
	if [ ! -h "$TBash" ]; then
		rm "$TBASH" 
		ln -s "$SBASH" "$TBASH"
	fi
fi


## Creating/linking .gitconfig
if [ ! -f "$TGConfig" ]; then
	echo "Creating .gitconfig file"
	ln -s "$SGConfig" "$TGConfig"
	echo "Created .gitconfig"
else
	if [ ! -h "TGConfig" ]; then
		rm "$TGConifg"
		ln -s "$SGConfig" "$TGConfig"
	fi
fi


## Creating .ssh
if [ ! -d "$sshdir" ]; then
	echo "Creating .ssh folder"
	mkdir -p "$sshdir"
	chmod 700 "$sshdir"
	echo ".ssh created"
else
	echo ".ssh exists"
fi


## Creating/linking authkeys
if [ ! -f "$Tauthkeys" ]; then
	echo "Creating authorized_keys file"
	ln -s "$Sauthkeys" "$Tauthkeys"
	echo "authorized_keys created"
else
	if [ ! -h "$Tauthkeys" ]; then
		rm "$Tauthkeys"
		ln -s "$Sauthkeys" "$Tauthkeys"
	fi
fi 

## Install Vundle
echo "Getting Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git /home/$ME/.vim/bundle/Vundle.vim

## Creating/linking .vimrc
if [ ! -f "$TVRC" ]; then
	echo "Creating .vimrc file"
	ln -s "$SVRC" "$TVRC"
	echo ".vimrc created"
else
	if [ ! -h "$TVRC" ]; then
		rm "$TVRC"
		ln -s "$SVRC" "$TVRC"
	fi
fi

## Install vim plugins +
vim +'PluginInstall --sync' +qall
