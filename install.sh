if [[ "$(id -u)" -eq 0 ]]; then
	echo "It be in root!"

	echo $(which apt)
	if [[ -n "$(which apt)" ]]; 
	then
		echo "apt do be installed there."
	else
		echo "apt aint installed there bro..."
	fi

else
	echo "script aint in root ;T;" 1>&2
	exit 1
fi
