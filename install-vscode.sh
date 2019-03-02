SETTINGS_FILE="$HOME/Library/Application Support/Code/User/settings.json"

install_extension() {
   local extensions=$(code --list-extensions)
   if ! echo $extensions | grep -q "$1"; then
      print_not_installed "$1"
      logged_exec code --install-extension "$1"
   else
      print_already_installed "$1"
   fi
}

print_title VSCODE

cask_install visual-studio-code
install_extension zhuangtongfa.Material-theme
install_extension eamodio.gitlens
install_extension EditorConfig.EditorConfig
install_extension esbenp.prettier-vscode
install_extension dbaeumer.vscode-eslint
install_extension ms-vsliveshare.vsliveshare
install_extension PeterJausovec.vscode-docker
install_extension ms-vsliveshare.vsliveshare
link_file "$(pwd)/files/settings.json" "$SETTINGS_FILE"
