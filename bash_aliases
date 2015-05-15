alias py="ipython"

alias clean='find . \( -name "*.pyc" -o -name "*~" -o -name "#*#" -o -name "\.#*" \) -delete; '

if [ -f pinterest_bash_aliases ]; then
. pinterest_bash_aliases
fi