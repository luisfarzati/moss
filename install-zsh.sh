SPACESHIP_URL="https://raw.githubusercontent.com/denysdovhan/spaceship-prompt/master/scripts/install.sh"
FILES_PATH="$(pwd)/files"
SPACESHIP_PATH="$HOME/.spaceship-prompt"

print_title ZSH

brew_install zsh
link_file "$FILES_PATH/.zshrc" "$HOME/.zshrc"
link_file "$FILES_PATH/.aliases" "$HOME/.aliases"
link_file "$FILES_PATH/.zsh_theme" "$HOME/.zsh_theme"

if [ ! -d "$SPACESHIP_PATH" ]; then
   print_not_installed spaceship-prompt
   logged_exec mkdir -p "$SPACESHIP_PATH"
   logged_exec curl -s $SPACESHIP_URL -o /tmp/spaceship-prompt-install.sh
   PREV_DIR=$PWD
   cd "$SPACESHIP_PATH"
   logged_exec zsh /tmp/spaceship-prompt-install.sh
   cd $PREV_DIR
   logged_exec rm /tmp/spaceship-prompt-install.sh
else
   print_already_installed spaceship-prompt
fi
