GIST_URL="https://gist.githubusercontent.com/luisfarzati/2d5f2b8f542c4e9cfa172d42da07c21d/raw"

print_title ITERM

cask_install iterm2
configure_defaults com.googlecode.iterm2.plist PrefsCustomFolder $GIST_URL
