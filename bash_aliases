alias py="ipython"

alias clean='find . \( -name "*.pyc" -o -name "*~" -o -name "#*#" -o -name "\.#*" \) -delete; '

alias dev="ssh -A tracy@dev-tracy"

if [ -f pinterest_bash_aliases ]; then
    source pinterest_bash_aliases
fi