configure_git() {
   local CONFIG_KEY=$1
   local CONFIG_VALUE=$2
   local ACTION=${3:-""}
   local DEFAULT_VALUE=${4:-""}
   local __return=$2

   printf_section git "global config $(in_white "$CONFIG_KEY") "
   if [ "$ACTION" == "ask" ]; then
      CONFIG_VALUE=$(ask_for "" "$DEFAULT_VALUE")
   else
      echo
   fi

   local CONFIG_ACTUAL_VALUE=$(git config --global $CONFIG_KEY)
   if [ "$CONFIG_ACTUAL_VALUE" != "" ] && [ "$CONFIG_ACTUAL_VALUE" != "$CONFIG_VALUE" ]; then
      print_section git "$(in_white current): $(in_white2 "$CONFIG_ACTUAL_VALUE")"
      print_section git "    $(in_white new): $(in_yellow "$CONFIG_VALUE")"
      local overwrite=$(prompt_overwrite)
      if [ $overwrite == "N" ]; then
         eval $__return="'$CONFIG_ACTUAL_VALUE'"
         return
      fi
   fi
   git config --global $CONFIG_KEY "$CONFIG_VALUE"
   if [ "$ACTION" == "ask" ]; then
      eval $__return="'$CONFIG_VALUE'"
   fi
}

print_title GIT

export USER_FULL_NAME=""
export USER_EMAIL=""

brew_upgrade git
configure_git user.name USER_FULL_NAME ask "$(id -F)"
configure_git user.email USER_EMAIL ask "$(id -F | awk '{print tolower(substr ($1, 0, 1)) tolower($2) "@gmail.com"}')"

SECRET_KEYS=$(gpg --with-colons --list-secret-keys)
if echo "$SECRET_KEYS" | grep -q "$USER_FULL_NAME <$USER_EMAIL>" -B2; then
   SIGNINGKEY=$(echo "$SECRET_KEYS" | grep "$USER_FULL_NAME <$USER_EMAIL>" -B2 | awk -F: '$1 == "fpr" {print $10}')
   if [ "$SIGNINGKEY" != "" ]; then
      print_section gpg "$(in_white "$SIGNINGKEY") key found"
      configure_git user.signingkey "$SIGNINGKEY"
      configure_git commit.gpgsign "true"
   else
      print_section gpg "no signing key found for $USER_FULL_NAME <$USER_EMAIL>"
      configure_git commit.gpgsign "false"
   fi
else
   print_section gpg "no keys found"
   configure_git commit.gpgsign "false"
fi