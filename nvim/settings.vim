" Author            : Matthew Rockwell
" Inspired by       : the VIM Community
" Initially created : 5/14/1998
"
"-------------------------------------------------------------------------------
" options.vim
" Set up the nvim environment
"
  syntax on
  syntax enable
  filetype on
  language en_US.UTF-8
  set encoding=utf-8

  set backupdir=.backup/,~/.backup/,/tmp//
  set directory=.swp/,~/.swp/,/tmp//
  set undodir=.undo/,~/.undo/,/tmp//

  " set nobackup
  " set noswapfile
  " set noundofile

  let mapleader      = "\<space>"
  let maplocalleader = "\<space>"

  set nocompatible
  filetype plugin on

  set title
  let titlestring="%{substitute(expand('%:p'), $HOME, '$HOME', '')}"

"  >> | Time Settings
  set timeout
  set timeoutlen=750                                        " Time out on mappings
  set ttimeoutlen=250                                       " Time out on key codes
  set updatetime=1000                                       " Idle time to write swap

"  >> | Search
  set incsearch                                             " incremental searching
  set showmatch                                             " show pairs match
  set showcmd                                               " show partial command in status line
  set modeline                                              " enable modeline
  set showmode                                              " show current mode
  set hlsearch                                              " highlight search results
  set smartcase                                             " smart case ignore
  set ignorecase
  set matchtime=1                                           " Tenths of a second to show the matching paren
  set cpoptions-=m                                          " showmatch will wait 0.5s or until a char is typed

"  >> | History
  set history=1000
  set undofile
  set undoreload=1000
  set undolevels=1000                                       " How many undos
  set undoreload=3000                                      " number of lines to save for undo

"  >> | Edit: Wrap, Tabs, Cursor, Copy/Paste, Spacing, Margins
  set nojoinspaces                                          " don't J two spaces... replace with one
  set formatoptions+=o                                      " Continue comment marker in new lines.
  set expandtab                                             " spaces instead of tabs
  set hidden                                                " hide the inactive buffers
  set bufhidden=delete
  set tabstop=2                                             " a tab = two spaces
  set shiftwidth=2                                          " number of spaces for auto-indent
  set softtabstop=2                                         " a soft-tab of four spaces
  set autoindent                                            " set on the auto-indent
  set autoread                                              " update a open file edited outside of Vim
  set autochdir                                             " auto change pwd to that of the open file
  set cursorline                                            " set higlight for cursor line and columm
  set nocursorcolumn
  set colorcolumn=121
  set noshowmode

  "set number
  " set the starting default"
  set nonumber
  set noerrorbells                                          " turn off the beeps

  set ruler
  set nowrap
  set foldcolumn=1
  set textwidth=120
  set foldlevel=0
  hi  Folded term=NONE cterm=NONE gui=NONE

  set backspace=indent,eol,start                            " defines the backspace key behavior
  set virtualedit=all                                       " to edit where there is no actual character
  set more                                                  " to show pages using `more` in command outpouts

  set splitbelow
  set splitright

" Work with the OS clipboard
  set clipboard^=unnamed,unnamedplus

" Show hidden chars - I will use for a toggle(1/11)
  " set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶

" Space above and besides the cursor from screen edges
  set scrolloff=3
  set sidescrolloff=5
  set nostartofline                                         " Do not jump to first character with page commands.

"  >> | Wildmenu / Autocomplete
  set wildmenu                                              " Command line autocompletion
  set wildmode=full                                         " Shows all the options
  set wildignore+=*.sw?                                     " Vim swap files
  set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~               " Backup files

"  >> | Spelling
 set spellfile=~/.local/share/nvim/spell/en.utf-8.add
 set spell spelllang=en_us
 set complete+=kspell
 setlocal  spell!

" netrw config
 " let g:netre_banner=0
 " let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
 " let g:netrw_liststyle = 3
 " let g:netrw_browse_split=0
 " let g:netrw_winsize = 22
 " let g:netrw_fastbrowse =2
 " autocmd FileType netrw set nolist

" What not to save in sessions:
  set sessionoptions-=options
  set sessionoptions-=globals
  set sessionoptions-=folds
  set sessionoptions-=help
  set sessionoptions-=buffers
"
"---------------------------------------------------------------------------------------------------------------------
