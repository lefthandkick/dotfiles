" Author            : Matthew Rockwell
" Inspired by       : the VIM Community
" Initially created : 5/14/1998
"
"******************************************************************************
"
" ------[ escape keybindings  {{{1
"
  " inoremap fd <Esc>
  " vnoremap fd <Esc>

  inoremap jk <Esc>
  vnoremap jk <Esc>

  " Save some some typing
  nnoremap ; :
" }}}

" ------[ Navigation / Movement {{{2
"
  " change pwd to that of the file being editied
  " autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

  " insert  mode cursor navigation on mac I have remaped C-HJKL to arrows
    " inoremap <C-j> <C-o>gj
    " inoremap <C-h> <left>
    " inoremap <C-l> <right>
    " inoremap <C-k> <C-o>gk

  " turn on vim command line competion via tab
  set wildcharm=<Tab>

  "insert n space 4ss insert 4 spaces or ss for 1 space
  nnoremap ss i<space><esc>

" insert lines
  noremap <silent> gO :call AddEmptyLineAbove()<CR>
  noremap <silent> go :call AddEmptyLineBelow()<CR>

  noremap <silent><A-C-k> :call AddEmptyLineAbove()<CR>
  noremap <silent><A-C-j> :call AddEmptyLineBelow()<CR>

  " not sure how ot map alt in mac / this for my linux
  " noremap <silent> <A-k> :call AddEmptyLineAbove()<CR>
  " noremap <silent> <A-k> :call AddEmptyLineBelow()<CR>

" nvim built-in terminal
  tnoremap <C-w>h <C-\><C-N><C-w>h
  tnoremap <C-w>j <C-\><C-N><C-w>j
  tnoremap <C-w>k <C-\><C-N><C-w>k
  tnoremap <C-w>l <C-\><C-N><C-w>l
  inoremap <C-w>h <C-\><C-N><C-w>h
  inoremap <C-w>j <C-\><C-N><C-w>j
  inoremap <C-w>k <C-\><C-N><C-w>k
  inoremap <C-w>l <C-\><C-N><C-w>l
" TAB - make shift L/R same as tab - I do not use tab-key to move txt

  nnoremap > >>_
  nnoremap < <<_

  nnoremap <S-Tab> <<_
  nnoremap <Tab> >>_
  inoremap <S-Tab> <C-D>
  vnoremap <Tab> >gv
  vnoremap <S-Tab> <gv

" keep cursor position when joining
  nnoremap J mzJ`z
" Split line (sister to Join lines) S is covered by cc.
  nnoremap S mzi<CR><ESC>`z

  nnoremap H ^
  nnoremap L $

"}}}

" ------[ Cut/Paste Undo/Redo   {{{2

" cut-paste with system buffer
  nnoremap <Leader>y "*y
  nnoremap <Leader>p "*p

  " yank to eol
  " nnoremap Y y$   -- yank ring re-defines this
  "after paste below current line, cursor to start of pasted line
  nnoremap p p`[
  "after visual yank, cursor to start of visual block
  vnoremap y y`[
  "not sure....
  vnoremap p "_dp`]

" line dupe
  nnoremap <leader>gc YI<esc>:Commentary<CR>p
"}}}

" ------[ Manage - Windows / Files / Buffers  {{{2

  " Buffers and tabs
  nnoremap <leader><Tab> :bn<CR>
  nnoremap <leader><leader><Tab> :tabn<CR>

  command TabClose tabclose
  cnoreabbrev Tx TabClose

 "save buffer changes
  nnoremap <leader>w  :update<CR>
  nnoremap <leader><leader>w :call SaveDelBuff()<CR>

  command WriteThenDeleteBuffer write | Bwipeout!
  cnoreabbrev W WriteThenDeleteBuffer

 "close all... no saving
  nnoremap <Leader>`` :qall!<CR>

  nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

 " slide window / center windows
  nnoremap <C-w>] <C-w><bar>
  nnoremap <C-w>[ <C-w>=

 "arrow keys to resize the windows works for tmux also
  nnoremap <silent> <Left>  :vertical resize +1<CR>
  nnoremap <silent> <Right> :vertical resize -1<CR>
  nnoremap <silent> <Up>    :resize -1<CR>
  nnoremap <silent> <Down>  :resize +1<CR>

  nnoremap <silent> <C-w>c  :call SmartClose()<CR>

 " If window isn't splited, split buffer.
  nnoremap <silent> <C-w><C-s>  :call ToggleWinSplit()<CR>

 " C-d / C-u the other window
  nnoremap <silent> <A-d> :call ScrollOtherWindow(1)<CR>
  nnoremap <silent> <A-u> :call ScrollOtherWindow(0)<CR>

  command! Split call SplitNice()
  nnoremap <silent> <C-w>v :call SplitNice()<CR>
  nnoremap <silent> <C-w>V :vnew<CR>
  nnoremap <silent> <C-w>n :split<CR>
  nnoremap <silent> <C-w>N :new<CR>
  " NOTE: C-w t/T create new Terminal windows"


 " Center cursor on screen when paging
  nnoremap <C-u> <C-u>zz
  nnoremap <C-d> <C-d>zz
  nnoremap <C-f> <C-f>zz
  nnoremap <C-b> <C-b>zz
  vnoremap <C-u> <C-u>zz
  vnoremap <C-d> <C-d>zz
  vnoremap <C-f> <C-f>zz
  vnoremap <C-b> <C-b>zz

 " When jump to next search/match also center screen
  nnoremap n nzz
  nnoremap N Nzz
  vnoremap n nzz
  vnoremap N Nzz
  "}}}

" ------[ Toggle folding and line numbering  {{{2

  "toggle folding
  nnoremap \ za
  vnoremap \ za

  noremap <leader>zr zR
  noremap <leader>zm zM

  " noremap [Space]k zk
  " noremap [Space]h zc
  " noremap [Space]l zo
  " noremap [Space]a za
  " noremap [Space]m zM
  " noremap [Space]i zMzv
  " noremap [Space]rr zR
  " noremap [Space]f zf
  " noremap [Space]d zd

  set foldlevelstart=1
  set foldmethod=marker
  set foldtext=NeatFoldText()
  hi Folded term=NONE cterm=NONE ctermfg=6

  "set relative line numbers
  cnoreabbrev Tln :call ToggleNumbering()<CR>
  cnoreabbrev Foldon set foldenable!

  " If press h on head, fold close. Not using since I remaped h and l
   nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc'   : 'h'
   xnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zcgv' : 'h'
   " If press o on fold, fold open.
   nnoremap <expr> o foldclosed(line('.')) != -1 ? 'zo0'   : 'l'
   xnoremap <expr> o foldclosed(line('.')) != -1 ? 'zogv0' : 'l'


"}}}

" ------[ misc  {{{2

  command InsertTimeStamp  pu=strftime('%c')
  cnoreabbrev Timestamp InsertTimeStamp

  command Spell setlocal spell!


"clears highlighting every time cr pressed
  nnoremap <silent><CR> :nohlsearch<CR>

"don't cancel visual select when shifting
  xnoremap <  <gv
  xnoremap >  >gv

"don't yank to default register when changing something
  nnoremap c "xc
  xnoremap c "xc

" Delete trailing whitespaces
  nnoremap <silent><Leader>-- :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" wipe all the registers
  command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" Disable standard plugins
  let g:loaded_getscriptPlugin = 1
  let g:loaded_netrwPlugin = 1
  let g:loaded_tarPlugin = 1
  let g:loaded_tutor_mode_plugin = 1
  let g:loaded_vimballPlugin = 1
  let g:loaded_zipPlugin = 1
  let g:loaded_gzip = 1
  let g:loaded_rrhelper = 1
  "}}}

