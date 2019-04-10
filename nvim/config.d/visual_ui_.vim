"
" Author            : Matthew Rockwell
" Inspired by       : the VIM Community
"
" [ Visual and UI ]
"-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


" ------[ mhinz/vim-halo    {{{

  highlight link Halo Search
  " autocmd BufEnter * call halo#run()
  autocmd BufEnter * call halo#run({'shape': 'halo1'})
"}}}

" ------[ Yggdroot/indentLine'  {{{
"
 let g:indentLine_noConcealCursor=""
 " let g:indentLine_setConceal = 0

  cnoreabbrev indent IndentLinesToggle

 "}}}"

" ------[ CursorLine my custom cursor {{{
"
 augroup CursorToggle
   autocmd!
     au VimEnter * call ModifiedBuffer()
     au VimEnter * highlight CursorLine gui=none guibg=#163540 guifg=fg

     au InsertEnter * set noshowmode
     au InsertEnter * highlight  CursorLine  guibg=#002b36 gui=none
     au InsertLeave * highlight  CursorLine  guibg=#163540 gui=none
 augroup END
 "}}}

" ------[ vim-airline/vim-airline {{{
"

 "AirlineToggle
 cnoreabbrev airt  AirlineToggle
 cnoreabbrev airw  AirlineToggleWhitespace
 cnoreabbrev airr  AirlineRefresh
 cnoreabbrev aire  AirlineExtensions

 let g:airline_theme="base16_solarized"
 " let g:airline_theme="bubblegum"
 " let g:airline_base16_improved_contrast = 1
 let g:airline_base16_monotone = 1
 " let g:airline_solarized_normal_green = 1
 let g:airline_solarized_dark_text = 1
 let g:airline_solarized_dark_inactive_border = 1

 let g:airline_detect_modified = 0
 " set to 0 since this function does the same"
 function! ModifiedBuffer()
    call airline#parts#define_raw('modified', '%{&modified ? " ( + )" : ""}')
    call airline#parts#define_accent('modified', 'yellow')
    let g:airline_section_c = airline#section#create(['%f', 'modified'])
 endfunction

 " Make airline status bar appear all the time
 let laststatus = 2
 let g:airline_powerline_fonts = 0

 " let g:airline_detect_paste = 1
 " let g:airline_detect_crypt = 1
 let g:airline_detect_spell = 1

 " let g:airline_inactive_collapse = 1
 " let g:airline_focuslost_inactive = 1
 " let g:airline_skip_empty_sections = 1
 " let w:airline_skip_empty_sections = 0

 let g:airline_left_sep = ''
 let g:airline_left_alt_sep = '|'

 let g:airline_right_sep = ''
 let g:airline_right_alt_sep = '|'

 let g:airline_symbols = {}
 let g:airline_symbols.branch = ''
 let g:airline_symbols.readonly = ''
 let g:airline_symbols.linenr = ''

 let g:airline_mode_map = {
   \ '__' : '-',
   \ 'c'  : 'C',
   \ 'i'  : 'I',
   \ 'ic' : 'I',
   \ 'ix' : 'I',
   \ 'n'  : 'N',
   \ 'ni' : 'N',
   \ 'no' : 'N',
   \ 'R'  : 'R',
   \ 'Rv' : 'R',
   \ 's'  : 'S',
   \ 'S'  : 'S',
   \ '' : 'S',
   \ 't'  : 'T',
   \ 'v'  : 'VC',
   \ 'V'  : 'VL',
   \ '' : 'VB',
   \ }


" Airline Plugin Config"
" ----------------------------------------------
 " enable/disable fugitive/lawrencium integration

 let g:airline#extensions#default#section_truncate_width = {}
 let g:airline#extensions#default#section_truncate_width = {
     \ 'b': 79,
     \ 'x': 60,
     \ 'y': 88,
     \ 'z': 45,
     \ 'warning': 80,
     \ 'error': 80,
     \ }

 let g:airline#extensions#default#layout = [
   \ [ 'a', 'b', 'c' ],
   \ [ 'error', 'warning', 'x', 'y', 'z' ]
   \ ]

 "Git"
 let g:airline#extensions#branch#format = 0
 let g:airline#extensions#branch#enabled = 1
 let g:airline#extensions#branch#empty_message = ''
 let g:airline#extensions#branch#displayed_head_limit = 10

 let g:airline#extensions#csv#enabled = 1
 let g:airline#extensions#csv#column_display = 'Number'  "Default

 let g:airline#extensions#keymap#enabled = 1

 " if you want to disable auto detect, comment out those two lines
 " let g:airline#extensions#disable_rtp_load = 1
 " let g:airline_extensions = ['branch', 'hunks', 'coc']
 let g:airline_section_error   = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
 let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

 let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
 let g:airline#extensions#quickfix#location_text = 'Location'

 let g:airline#extensions#tagbar#enabled = 1
 let g:airline#extensions#tagbar#flags = ''  " (default)
 let g:airline#extensions#tagbar#flags = 'f'
 let g:airline#extensions#tagbar#flags = 's'
 let g:airline#extensions#tagbar#flags = 'p'

 let g:airline#extensions#whitespace#enabled = 0
 let g:airline#extensions#whitespace#mixed_indent_algo = 1 " (default)

  " let g:airline#extensions#windowswap#enabled = 1
  " let g:airline#extensions#windowswap#indicator_text = 'WS'

 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#show_splits = 0
 let g:airline#extensions#tabline#formatter = 'unique_tail'
 " let g:airline#extensions#tabline#formatter = 'default'

 let g:airline#extensions#tabline#show_tabs = 1
 let g:airline#extensions#tabline#show_tab_nr = 1
 let g:airline#extensions#tabline#show_tab_type = 2
 let g:airline#extensions#tabline#show_buffers = 1
 let g:airline#extensions#tabline#close_symbol = 'X'
 let g:airline#extensions#tabline#show_close_button = 0
 let g:airline#extensions#tabline#buffer_idx_mode = 1

 " rename label for buffers (default: 'buffers') (c) >
 let g:airline#extensions#tabline#buffers_label = ' <|B'
 " rename label for tabs (default: 'tabs') (c) >
 let g:airline#extensions#tabline#tabs_label = 'T|> '

 " always show current tabpage/buffer first >
 " let airline#extensions#tabline#current_first = 1

 " Just show the filename (no path) in the tab
 let g:airline#extensions#tabline#fnamemod = ':t'
 " let g:airline#extensions#tabline#fnamecollapse = 0
 " ----------------------------------------------

 " airline ... line formating
 let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

 function! MyLineNumber()
   return substitute(line('.'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g'). ' | '.
    \    substitute(line('$'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g')
 endfunction

 call airline#parts#define('linenr', {'function': 'MyLineNumber', 'accents': 'bold'})
 let g:airline_section_z = airline#section#create(['%3p%%: ', 'linenr', ':%3v'])

  " function! WindowNumber(...)
  "   let builder = a:1
  "   let context = a:2
  "   call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
  "   return 0
  " endfunction

  " call airline#add_statusline_func('WindowNumber')
  " call airline#add_inactive_statusline_func('WindowNumber')

 " Buffer Switching
 nmap <leader>1 <Plug>AirlineSelectTab1
 nmap <leader>2 <Plug>AirlineSelectTab2
 nmap <leader>3 <Plug>AirlineSelectTab3
 nmap <leader>4 <Plug>AirlineSelectTab4
 nmap <leader>5 <Plug>AirlineSelectTab5
 nmap <leader>6 <Plug>AirlineSelectTab6
 nmap <leader>7 <Plug>AirlineSelectTab7
 nmap <leader>8 <Plug>AirlineSelectTab8
 nmap <leader>9 <Plug>AirlineSelectTab9
 "}}}

" ------[ NeoSolarized' {{{
"
"
 let $NVIM_TUI_ENABLE_TRUE_COLOR   = 1
 let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

  " use these if I start using tmux again
  " set t_Co=256
  " let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
  " let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
  " set guicursor=

 set termguicolors
 set background=dark
 colorscheme solarized8_flat
 "}}}

