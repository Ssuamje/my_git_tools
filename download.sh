GIT="Ssuamje/my_git_tools.git"
GIT_HTTPS=https://github.com
REPO="my_git_tools"
FILE="fast_commit_push.sh"
FILE_HIDDEN=".fast_commit_push.sh"
MY_ALIAS="gfc"

if [ $(git clone git@github.com:$GIT | grep fatal) ]; then
	git clone $GIT_HTTPS/$GIT
fi

#make file hidden
mv $REPO/$FILE $HOME
cd $HOME
mv $FILE $FILE_HIDDEN
cd -
rm -rf $REPO

SRC="$HOME/.zshrc"

if [ "$(uname)" != "Darwin" ]; then
	SRC="$HOME/.bashrc"
	if [[ -f "$HOME/.zshrc" ]]; then
		SRC="$HOME/.zshrc"
	fi
fi

if [ $(cat $SRC | grep "$FILE" | wc -l) -eq 0 ]
then
	echo -e "\nalias $MY_ALIAS=\"bash $HOME/$FILE_HIDDEN\"" >> "$SRC"
fi

exec "$SHELL"