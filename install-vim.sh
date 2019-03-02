VIM_PATH=$HOME/.vim
VIM_PACK_PATH=$VIM_PATH/pack/dist

print_title VIM

brew_install vim
logged_exec mkdir -p "$VIM_PACK_PATH"
git_clone "https://github.com/vim-airline/vim-airline.git" "$VIM_PACK_PATH/start/vim-airline"
git_clone "https://github.com/vim-airline/vim-airline-themes.git" "$VIM_PACK_PATH/start/vim-airline-themes"
git_clone "https://github.com/rakr/vim-one.git" "$VIM_PACK_PATH/start/one"
link_file "$(pwd)/files/.vimrc" "$HOME/.vimrc"
