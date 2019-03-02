" Automatic indentation
filetype plugin indent on

" Don't need vi compatibility
set nocompatible

" Set line numbers
set number

" Set to auto read when a file is changed from the outside
set autoread

"Always show current position
set ruler

" 4 whitespaces for tabs visual presentation
set tabstop=4

" shift lines by 4 spaces
set shiftwidth=4

" set tabs for a shifttabs logic
set smarttab

" expand tabs into spaces
set expandtab

" indent when moving to the next line while writing code
set autoindent

" shows line under the cursor's line
set cursorline

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Enable syntax highlighting
syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"Gui options
" set guioptions-=m  "remove menu bar
" set guioptions-=T  "remove toolbar
" set guioptions-=r  "remove right-hand scroll bar
" set guioptions-=L  "remove left-hand scroll bar

set guifont="Fira Mono for Powerline Regular":h10:cANSI
set guicursor=

" Use powerline fonts
let g:airline_powerline_fonts=1

" Set Airline theme
let g:airline_theme='one'

" Set theme
colorscheme one

" Set background
set background=dark
