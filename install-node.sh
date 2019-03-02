title NODE

brew_install nodenv
eval "$(nodenv init -)"

print_section sh "searching newest LTS release"
LTS_VERSION=$(
    curl -s http://nodejs.org/dist/index.json | jq -r "map(select(.lts)) | first | .version[1:]"
)
if [ -z "$LTS_VERSION" ]; then
   print_section sh "could not find a version -- you'll need to install one manually $(in_red ✖)"
   print_section sh "e.g. $(in_cyan "nodenv install 10.15.0")"
elif ! nodenv install --list | grep -q "$LTS_VERSION"; then
   print_section nodenv "$(in_white "$LTS_VERSION") is not available in nodenv, trying a previous one"
   LTS_VERSION=$(nodenv install --list | grep $(echo "$LTS_VERSION" | awk -F. '{print $1"."$2"."}') | sort -r | head -1 | awk '{print $1}')
fi

if ! nodenv versions | grep "$LTS_VERSION" &>/dev/null; then
   print_not_installed nodenv "$LTS_VERSION"
   logged_exec nodenv install -s "$LTS_VERSION"
   logged_exec nodenv global "$LTS_VERSION"
   logged_exec node -v
else
   print_already_installed nodenv "$LTS_VERSION"
fi

link_file "$(pwd)/files/.npmrc" "$HOME/.npmrc"
