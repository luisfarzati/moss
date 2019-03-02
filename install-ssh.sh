print_key_not_found() {
   print_section sh "$(in_white "$1") key not found"
}

print_key_exists() {
   print_section sh "$(in_white "$1") key already exists $(in_green ✔)"
}

print_title SSH

SSH_RSA_KEY_PATH="$HOME/.ssh/id_rsa"
if [ ! -f "$SSH_RSA_KEY_PATH" ]; then
   print_key_not_found id_rsa
   logged_exec ssh-keygen -t rsa -b 4096 -a 100 -o -f $SSH_RSA_KEY_PATH
   logged_exec ssh-add -K $SSH_RSA_KEY_PATH
else
   print_key_exists id_rsa
fi

SSH_ED25519_KEY_PATH="$HOME/.ssh/id_ed25519"
if [ ! -f "$SSH_ED25519_KEY_PATH" ]; then
   print_key_not_found id_ed25519
   logged_exec ssh-keygen -t ed25519 -a 100 -o -f $SSH_ED25519_KEY_PATH
   logged_exec ssh-add -K $SSH_ED25519_KEY_PATH
else
   print_key_exists id_ed25519
fi

PUBLIC_KEY=$(cat $SSH_ED25519_KEY_PATH.pub | awk '{print $1 " " $2}')
GITHUB_URL="https://github.com/luisfarzati"
if ! curl -s $GITHUB_URL.keys | grep -q "$PUBLIC_KEY"; then
   print_section github "$(in_white id_ed25519) key not configured on GitHub $(in_red ✖)"
   print_section github "- open $(in_cyan https://github.com/settings/ssh/new)"
   print_section github "  and add: $(in_white2 "$PUBLIC_KEY")"
else
   print_section github "$(in_white id_ed25519) key already configured on GitHub $(in_green ✔)"
fi
