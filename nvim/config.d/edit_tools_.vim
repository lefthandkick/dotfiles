
" Author            : Matthew Rockwell
" Inspired by       : the VIM Community
" Initially created : 5/14/1998
"******************************************************************************


" ------[ chrisbra/csv.vim  {{{2
"
  let b:csv_arrange_use_all_rows = 1

  augroup filetypedetect
    au! BufRead,BufNewFile *.csv,*.dat	setfiletype csv
  augroup END
"
"
" }}}

" ------[ Plug elzr/vim-json {{{2
  let g:vim_json_syntax_conceal = 1    " turn on "
  let g:indentLine_noConcealCursor="nc"
"
"}}}

" ------[ rhysd/clever-f.vim   {{{2
"
" Clever let f/F t/T repeat.  No need for ; to repeat
"
  let g:clever_f_smart_case = 1
  let g:clever_f_fix_key_direction = 1
  let g:clever_f_show_prompt = 0
  let g:clever_f_mark_char = 1

  " below variables must be set before loading this script
  let g:clever_f_mark_cursor_color       = 'Cursor'
  let g:clever_f_mark_char_color         = 'myCleverChar'

  augroup au_clever
    autocmd!
    autocmd VimEnter *  highlight default myCleverChar   ctermfg=white ctermbg=red  cterm=bold,underline
  augroup END

"}}}

" ------[ easymotion/vim-easymotion {{{2
"
  " turn default mappings off
  let g:EasyMotion_smartcase  = 1
  let g:EasyMotion_do_mapping = 0

  let g:EasyMotion_use_upper = 1
  let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'

  let g:EasyMotion_verbose           = 0  "turn messages off
  let g:EasyMotion_enter_jump_first  = 1
  let g:EasyMotion_space_jump_first  = 1
  let g:EasyMotion_landing_highlight = 0
  let g:EasyMotion_move_highlight    = 1

  hi EasyMotionTarget ctermbg=none ctermfg=green
  hi EasyMotionShade  ctermbg=none ctermfg=blue

  hi EasyMotionTarget2First  ctermbg=none ctermfg=red
  hi EasyMotionTarget2Second ctermbg=none ctermfg=lightred

  hi EasyMotionMoveHL    ctermbg=green ctermfg=none
  hi EasyMotionIncSearch ctermbg=green ctermfg=none

  nmap <leader>em  :<C-u>call EasyMotion#S(-1,1,2)<CR>
  command Easy     :call EasyMotion#S(-1,1,2)
  cnoreabbrev easy Easy

  nmap  <silent><leader>en <Plug>(easymotion-next)
  command EasyNext :call EasyMotion#NextPrevious(0,0)
  cnoreabbrev en EasyNext

  nmap  <silent><leader>ep <Plug>(easymotion-prev)
  command EasyPrev :call EasyMotion#NextPrevious(0,1)
  cnoreabbrev ep EasyPrev

  nmap s  <Plug>(easymotion-s2)
  xmap s  <Plug>(easymotion-s2)
  omap z  <Plug>(easymotion-s2)

  nmap <Leader>s <Plug>(easymotion-sn)
  xmap <Leader>s <Plug>(easymotion-sn)
  omap <Leader>z <Plug>(easymotion-sn)
"}}}

" ------[ matze/vim-move  {{{2
  let g:move_map_keys = 1
  let g:move_key_modifier = 'M'

  "use the Alt/Opt key with hjkl
"}}}

" ------[ gutentags (hold) {{{2

  " let g:gutentags_trace = 0
  " let g:gutentags_enabled = 1
  " let g:gutentags_resolve_symlinks = 1
  " let g:gutentags_cache_dir = "User/left-hand/.cache/tag_cache"


  " let g:gutentags_project_root = ['.git']

  " let g:gutentags_gtags_executable = "/usr/local/Cellar/ctags/5.8_1/bin/ctags"

  " let g:gutentags_add_default_project_roots = ['.git']
  " let g:gutentags_exclude_filetypes = ['.txt', '.md']

  " let g:airline#extensions#gutentags#enabled = 1

"}}}

" ------[ majutsushi/tagbar  {{{2
  nmap <leader>tb :TagbarToggle<CR>
  cnoreabbrev tagbar TagbarToggle
"}}}

 " ------[ Super Tap   {{{2
  let g:SuperTabDefaultCompletionType = "<c-n>"
  "let g:SuperTabContextDefaultCompletionType = "<c-n>"
"}}}

