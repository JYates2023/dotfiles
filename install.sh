echo $SUDO_USER
ME=$SUDO_USER

if [[ "$(id -u)" -eq 0 ]]; then
	echo "It be in root!"

	echo $(which apt)
	if [[ -n "$(which apt)" ]]; 
	then
		echo "apt do be installed there."

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
