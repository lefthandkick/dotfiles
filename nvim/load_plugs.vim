" Author            : Matthew Rockwell
" Inspired by       : the VIM Community
" Initially created : 5/14/1998
"
"******************************************************************************
filetype off
call plug#begin('~/.local/share/nvim/plug_ins')
"******************************************************************************

"  Utilities & Dependencies util_dep_.vim
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  " ~/.config/nvim/config.d/utils_dep_.vim
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-dispatch'
  " Plug 'tpope/vim-projectionist'
  Plug 'lacygoill/vim-freekeys'
  Plug 'lifepillar/vim-cheat40'
  Plug 'chrisbra/Colorizer'
  Plug 'mhinz/vim-startify'
  Plug 'kassio/neoterm'
  Plug 'osyo-manga/vim-over'

"  Visual / UI
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  " ~/.config/nvim/config.d/visual_ui_.vim
  Plug 'vim-airline/vim-airline-themes'
  Plug 'vim-airline/vim-airline'
  Plug 'lifepillar/vim-solarized8'
  Plug 'Yggdroot/indentLine'
  Plug 'mhinz/vim-halo'
  " Plug 'gcmt/taboo.vim'
  " Plug 'wesQ3/vim-windowswap'

"  Editing Tools (All Languages)
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  " ~/.config/nvim/config.d/edit_tools_.vim
  Plug 'ervandew/supertab'
  Plug 'majutsushi/tagbar'
  Plug 'matze/vim-move'
  Plug 'easymotion/vim-easymotion'
  Plug 'rhysd/clever-f.vim'
  Plug 'elzr/vim-json'
  Plug 'chrisbra/csv.vim'

  " Plug 'ludovicchabant/vim-gutentags'

"  Directory and Buffers
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  " ~/.config/nvim/config.d/dir_tools_.vim
  Plug 'moll/vim-bbye'
  Plug 'mhinz/vim-sayonara'
  Plug 'vim-scripts/YankRing.vim'
  Plug 'simnalamburt/vim-mundo'

  " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  " Plug 'junegunn/fzf.vim'
  " Plug 'pbogut/fzf-mru.vim'

  Plug 'kmnk/denite-dirmark'
  Plug 'Shougo/neomru.vim'
  Plug 'Shougo/defx.nvim',   { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

"  Language Completion and tools
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  " ~/.config/nvim/config.d/lang_tools_.vim
  Plug 'sheerun/vim-polyglot'
  Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
  Plug 'Shougo/neco-vim'           " vimL competion used by coc-neco
  Plug 'neoclide/coc-neco'         " vimL competion

" Git
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  " ~/.config/nvim/config.d/git_tools_.vim
  Plug 'tpope/vim-fugitive'


" Debuggers
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  " ~/.config/nvim/config.d/debug_tools_.vim

  " Debuggers
  " Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  " Plug 'idanarye/vim-vebugger'
"  Writing tools

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  " ~/.config/nvim/config.d/writting_tools_.vim
  Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
  Plug 'reedes/vim-pencil'
  Plug 'reedes/vim-lexical'
  Plug 'phongvcao/vim-stardict'
  Plug 'ron89/thesaurus_query.vim'
  Plug 'rhysd/vim-grammarous'

"  Markdown Tools
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  " ~/.config/nvim/config.d/markdown_tools_.vim
  Plug 'dhruvasagar/vim-table-mode'
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'

  function! BuildComposer(info)
    if a:info.status != 'unchanged' || a:info.force
      !cargo build --release
    endif
  endfunction
  Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }


 "******************************************************************************
 call plug#end()
 filetype plugin indent on
"******************************************************************************

