# Programs
alias e="emacs"
alias py="ipython"

# Navigation
alias cc="cd ~/code/configs/"

# Utilities
alias clean='find . \( -name "*.pyc" -o -name "*~" -o -name "#*#" -o -name "\.#*" \) -delete; '

# Pinterest
alias dev="ssh -A tracy@dev-tracy"

if [ -f pinterest_bash_aliases ]; then
    source pinterest_bash_aliases
fi