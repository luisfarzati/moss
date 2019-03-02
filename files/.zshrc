# Settings
export PATH=$PATH:node_modules/.bin
export CLICOLOR=1

# Load aliases
source ~/.aliases

# Configure theme
if [ -f "$HOME/.zsh_theme" ]; then
   source ~/.zsh_theme
   autoload -U promptinit; promptinit
   prompt spaceship
fi

# Load nodenv
eval "$(nodenv init -)"

# Load gpg-agent
if [ -d "$HOME/.gnupg" ]; then
   if [ -n "$(pgrep gpg-agent)" ]; then
      export GPG_TTY=$(tty)
      export GPG_AGENT_INFO=~/.gnupg/S.gpg-agent:1489:1
   else
      eval $(gpg-agent --daemon)
   fi
fi

# Enable completion
autoload -Uz compinit && compinit -i
