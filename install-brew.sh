INSTALL_URL="https://raw.githubusercontent.com/Homebrew/install/master/install"

print_title HOMEBREW

if ! brew --version &>/dev/null; then
   print_not_installed brew
   logged_exec curl -fsSL $INSTALL_URL -o /tmp/homebrew-install.rb
   logged_exec /usr/bin/ruby /tmp/homebrew-install.rb
   logged_exec rm /tmp/homebrew-install.rb
else
   print_already_installed brew
fi
