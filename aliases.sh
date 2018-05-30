# No whitespace between strings becomes concatenation. Must use single quote for awk
alias col1="awk ""'"'{print $1}'"'"
alias col2="awk ""'"'{print $2}'"'"
alias col3="awk ""'"'{print $3}'"'"
alias col4="awk ""'"'{print $4}'"'"
alias col5="awk ""'"'{print $5}'"'"
alias col6="awk ""'"'{print $6}'"'"
alias col7="awk ""'"'{print $7}'"'"
alias col8="awk ""'"'{print $8}'"'"
alias col9="awk ""'"'{print $9}'"'"
alias col10="awk ""'"'{print $10}'"'"

# Coloring output
alias ls='ls -G'

# Alias for getting current branch more quickly
alias gb="git branch | grep \* | sed s/*\ //g"
