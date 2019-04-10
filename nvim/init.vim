" Author            : Matthew Rockwell
" Inspired by       : the VIM Community
" Initially created : 5/14/1998
"
"******************************************************************************
"
let g:my_uname = substitute(system("uname"), '\n', '', '')

" Lets be modern.."
" let $XDG_RUNTIME_DIR = expand('/run/user/501')
let $XDG_CACHE_HOME = expand($HOME.'/.cache')
" let $XDG_CONFIG_DIRS = expand('/etc/xdg')
let $XDG_CONFIG_HOME = expand($HOME.'/.config')
" let $XDG_DATA_DIRS = expand('/usr/local/share:/usr/share')
let $XDG_DATA_HOME = expand($HOME.'/.local/share')

" Where to find python for nvim
let g:python3_host_prog = '/Users/left-hand/anaconda3/envs/nvim-3//bin/python3'
let g:python_host_prog =  '~/anaconda3/envs/nvim-2//bin/python'

" Where the configs are
let g:vim_home = get(g:, 'vim_home', '~/.config/nvim/')

" Load all vim configs
let config_list = [
     \ 'settings.vim',
     \ 'load_plugs.vim',
     \ 'helpers.d/*_.vim',
     \ 'config.d/*_.vim',
     \ 'keybindings.vim'
     \]

for files in config_list
  for vrc in glob(g:vim_home.files, 1, 1)
     exec 'source ' vrc
  endfor
endfor

set secure
command PU PlugUpdate | PlugUpgrade

" ------[ Global AutoGroup  {{{
  augroup myvimrc
   autocmd!
   " au BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

   au BufEnter *.txt call Myhelptab()

   au VimEnter * WipeReg
   au VimEnter * set nospell

   "Make sure all markdown files have the correct filetype
   au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set filetype=markdown

   " Vim script
   set syntax=vim
   au BufNewFile,BufRead *.vim,*.viminfo	 set filetype=vim

   "keep cursor from jumping back when leaving insert mode
   au InsertLeave * call cursor([getpos('.')[1], getpos('.')[2]+1])

   "Always disable paste mode when leaving insert mode
   au InsertLeave * set nopaste

   "-Auto-remove trailing spaces
   au BufWritePre * call StripTWSpaces()

 augroup END
 "}}}

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set mouse=c
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





