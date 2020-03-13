# Aliases
alias ls='ls -G'
alias lah='ls -lah'

# Exports
export TERM=xterm-256color
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_241.jdk/Contents/Home

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/k0v00z3/.sdkman"
[[ -s "/Users/k0v00z3/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/k0v00z3/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
