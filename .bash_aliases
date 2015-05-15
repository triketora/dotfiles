alias clean='find . \( -name "*.pyc" -o -name "*.*~" -o -name "#*.*#" -o -name "\.#*" \) -delete; '

export PINBOARD="$HOME/code/pinboard"                         
export PATIO="$HOME/code/patio"                               
alias p="cd $PINBOARD"                                   
alias pa="cd $PATIO"                                     

alias am="cd $PINBOARD/webapp/app/analytics/modules/"      
alias cm="cd $PINBOARD/webapp/app/common/modules/"       
alias dm="cd $PINBOARD/webapp/app/desktop/modules/"      
alias mm="cd $PINBOARD/webapp/app/mobile/modules/"       
alias sm="cd $PINBOARD/webapp/app/sterling/modules/"     

# Grep wrappers.
alias pygrep='$HOME/bin/pygrep'
alias jsgrep='$HOME/bin/jsgrep'
alias htmlgrep='$HOME/bin/htmlgrep'
alias scssgrep='$HOME/bin/scssgrep'
alias txtgrep='$HOME/bin/txtgrep'
alias allgrep='$HOME/bin/allgrep'