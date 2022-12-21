if [ -z "$(git -C ~/GIT/personal status --porcelain)" ]; then
    # Working directory clean
    echo -n
else
    git -C ~/GIT/personal status --porcelain
    echo
    while true; do
	read -p "C to commit, ENTER to log out: " answer
	case $answer in
	    [C] ) (cd ~/GIT/personal && commit && sync); break;;
	    "" ) break;;
	    * ) ;;
	esac
    done
fi
