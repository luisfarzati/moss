GNUPG_PATH="$HOME/.gnupg"
FILES_PATH="$(pwd)/files"

print_title GPG

brew_install gnupg
brew_install pinentry-mac
link_file "$FILES_PATH/gpg.conf" "$GNUPG_PATH/gpg.conf"
link_file "$FILES_PATH/gpg-agent.conf" "$GNUPG_PATH/gpg-agent.conf"
