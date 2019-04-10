" Inspired by       : the VIM Community
" Author            : Matthew Rockwell
" Initially created : 5/14/1998
"******************************************************************************


set rtp+=/usr/local/opt/fzf

" ------[ Denite    {{{2
"
" Leader a is denite access
  nnoremap [denite] <Nop>
  nmap     <Leader>a [denite]

  call denite#custom#option('_', {
        \ 'prompt': '❯',
        \ 'updatetime': 1,
        \ 'auto_resize': 0,
        \ 'winheight': 18,
        \ 'highlight_matched_char': 'Underlined',
        \ 'highlight_mode_normal':  'Search',
        \ 'highlight_mode_insert':  'Search',
        \ 'reversed': 0,
        \ 'auto-accel': 1,
        \ 'buffer_name': 'DenBuf',
        \ 'smartcase': 1,
        \ 'root-markers':'.git',
        \ 'mode': 'normal',
        \})
        " \ 'highlight_mode_normal':  'CursorLine',

  call denite#custom#source('file/rec', 'vars', {
        \'command': ['ag', '--files', '--glob', '!.git'],
        \'matchers': ['matcher/fruzzy'],
        \'sorters':['sorter_sublime'],
        \})

  call denite#custom#source('file', 'vars', {
        \'sorters':['sorter_sublime'],
        \})

  " -u flag to unrestrict (see ag docs)
  call denite#custom#var('file/rec', 'command',
  \ ['ag', '--follow', '--nocolor', '--nogroup', '-u', '-g', ''])

  "Alias for file/rec/get
  call denite#custom#alias('source', 'file/rec/git', 'file/rec')
  call denite#custom#var('file/rec/git', 'command',
  \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

  " denite content search - use quickfix for results
  map <silent>[denite]g :DeniteProjectDir -buffer-name=grep -default-action=quickfix grep:::!<CR>
    call denite#custom#source(
    \ 'grep', 'matchers', ['matcher_regexp'])

    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])

 nnoremap <silent>[denite]b :Denite buffer<CR>
 nnoremap <silent>[denite]r :Denite file_mru<CR>
 nnoremap <silent>[denite]h :Denite command_history<CR>

 nnoremap <silent>[denite]p :DeniteProjectDir -buffer-name=gitOnly file/rec/git<CR>

 nnoremap <silent>[denite]f :Denite file <CR>
 nnoremap <silent>[denite]F :Denite file/rec <CR>

 "Denite Bookmarks"
 call dirmark#set_default_group('lefhand')
 cnoreabbrev Book     Denite dirmark
 cnoreabbrev Bookmark Denite dirmark/add
"}}}

" ------[ Defx   {{{2

  call defx#custom#option('_', {
        \ 'root_marker'  : '[:] ',
        \ 'auto_cd'      : 1,
        \ 'listed'       : 1,
        \ 'buffer_name'  : 'defx',
        \ 'direction'    : 'topleft',
        \ 'columns'      : 'mark:filename:type',
        \ 'ignored_files': '.*'
        \ })

 call defx#custom#column('filename', {
	      \ 'directory_icon': '▸',
	      \ 'root_icon': ' ',
	      \ 'opened_icon': '▾',
	      \ 'min_width': 24,
	      \ 'max_width': 80,
	      \ })
      "  'root_marker_highlight' : 'Ignore',

	call defx#custom#column('mark', {
	      \ 'readonly_icon': 'R',
	      \ 'selected_icon': '*',
	      \ })

	function! s:defx_my_settings() abort
    IndentLinesDisable
    setl nospell
    setl signcolumn=no

	  " Define mappings
	  nnoremap <silent><buffer><expr> <CR> defx#do_action('open')
	  nnoremap <silent><buffer><expr> c    defx#do_action('copy')
	  nnoremap <silent><buffer><expr> m    defx#do_action('move')
	  nnoremap <silent><buffer><expr> p    defx#do_action('paste')
	  nnoremap <silent><buffer><expr> l    defx#do_action('open')
	  nnoremap <silent><buffer><expr> v    defx#do_action('open', 'vsplit')
	  nnoremap <silent><buffer><expr> P    defx#do_action('open', 'pedit')
	  nnoremap <silent><buffer><expr> o    defx#do_action('open_or_close_tree')
	  nnoremap <silent><buffer><expr> K    defx#do_action('new_directory')
	  nnoremap <silent><buffer><expr> N    defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> M    defx#do_action('new_multiple_files')
	  nnoremap <silent><buffer><expr> C    defx#do_action('toggle_columns', 'mark:filename:type:size:time')
	  nnoremap <silent><buffer><expr> S    defx#do_action('toggle_sort', 'time')
	  nnoremap <silent><buffer><expr> d    defx#do_action('remove')
	  nnoremap <silent><buffer><expr> r    defx#do_action('rename')
    nnoremap <silent><buffer><expr> R    defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> !    defx#do_action('execute_command')
	  nnoremap <silent><buffer><expr> x    defx#do_action('execute_system')
	  nnoremap <silent><buffer><expr> yy   defx#do_action('yank_path')
	  nnoremap <silent><buffer><expr> .    defx#do_action('toggle_ignored_files')

	  nnoremap <silent><buffer><expr><leader>; defx#do_action('repeat')

	  nnoremap <silent><buffer><expr> h    defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr> ~    defx#do_action('cd')
	  nnoremap <silent><buffer><expr> q    defx#do_action('quit')

	  nnoremap <silent><buffer><expr> <Space>  defx#do_action('toggle_select') . 'j'

	  nnoremap <silent><buffer><expr> *      defx#do_action('toggle_select_all')
	  nnoremap <silent><buffer><expr> j      line('.') == line('$') ? 'gg' : 'j'
	  nnoremap <silent><buffer><expr> k      line('.') == 1 ? 'G' : 'k'
	  nnoremap <silent><buffer><expr> <C-l>  defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> <C-g>  defx#do_action('print')
	  nnoremap <silent><buffer><expr> cd     defx#do_action('change_vim_cwd')
	endfunction

  nnoremap    <silent> - :call OpenDefx()<cr>
  cnoreabbrev <silent>dx :call OpenDefx()<cr>

  " let g:defx_open_path = getcwd()
  function! OpenDefx() abort
    let g:defx_open_path = getcwd()

    if isdirectory(expand('%:p:h'))
      let g:defx_open_path = expand('%:p:h')
    endif
    execute('Defx -toggle `g:defx_open_path`')
  endfunction

  augroup MyDefx
    autocmd!
	   au FileType defx call s:defx_my_settings()
  augroup END
"}}}

 " ------[ moll/vim-bbye   {{{2

 command     BX bufdo Bwipeout

 cnoreabbrev bx   Bwipeout
 cnoreabbrev bxx  Bwipeout!

 nnoremap <Leader>d :Bwipeout<CR>
"}}}

" ------[ mhinz/vim-sayonara  {{{
 "Note: check keybindings.vim for more mappings
 "
 cnoreabbrev sx   Sayonara
 cnoreabbrev sxx  Sayonara!

 "nnoremap <Leader>x :Sayonara<CR>
"}}}

" ------[ simnalamburt/vim-mundo'  {{{2
  let g:mundo_help = 0
  let g:mundo_right = 1
  let g:mundo_width = 45
  let g:mundo_preview_height = 12
  let g:mundo_preview_bottom = 1
  " nnoremap <silent><leader>ut :MundoToggle<CR>
  cnoreabbrev ut MundoToggle

"}}}

"------[ vim-scripts/YankRing.vim' {{{2
"
  let g:yankring_enabled = 1
  let g:yankring_window_use_horiz = 0
  let g:yankring_max_history = 100
  let g:yankring_min_element_length = 2
  let g:yankring_max_display = 70
  let g:yankring_window_height = 8
  let g:yankring_window_width = 30
  let g:yankring_window_increment = 50
  let g:yankring_default_menu_mode = 3
  let g:yankring_record_insert = 0

  let g:yankring_history_dir = '/Users/left-hand/.local/share/nvim/yank_history/'

  function! YRRunAfterMaps()
     nnoremap Y :<C-U>YRYankCount 'y$'<CR>
  endfunction

  " nnoremap <silent><leader>yr :YRShow<CR>
  cnoreabbrev yr YRShow
"}}}

"" ------[ NerdTree {{{2
" let NERDTreeDirArrows = 1
" let NERDTreeDirArrowExpandable='▸'
" let NERDTreeDirArrowCollapsible='▾'

" let NERDTreeShowBookmarks=1
" let NERDTreeShowHidden=0
" let NERDTreeShowLineNumbers=0
" let NERDTreeMinimalUI=1
" let NERDTreeGlyphReadOnly = "RO"

" let NERDTreeCascadeSingleChildDir=1
" let NERDTreeRespectWildIgnore=1
" let NERDTreeChDirMode=2

" let NERDTreeQuitOnOpen=1        "-close after open a file
" let NERDTreeAutoDeleteBuffer=1  "-Auto delete buffer of file just deleted with NerdTree
" let NERDTreeMinimalUI=1         "-make it look pretty
" let NERDTreeHijackNetrw = 0

" let NERDTreeIgnore =  ['\.DAT$', '\.LOG1$', '\.LOG1$']
" let NERDTreeIgnore += [
"      \ '\.png$','\.jpg$','\.gif$','\.mp3$','\.flac$', '\.ogg$', '\.mp4$',
"      \ '\.avi$','.webm$','.mkv$','\.pdf$', '\.zip$', '\.tar.gz$', '\.rar$']

" " nnoremap <silent><leader>nt :<silent>NERDTreeToggle<CR>
" nnoremap <silent><leader>nt :<silent>NERDTree<CR>
" nnoremap <silent><leader>nf :NERDTreeFind<CR>
" nnoremap <silent><leader>nc :NERDTreeCWD<CR>

" cnoreabbrev nt  NERDTreeToggle

" cnoreabbrev nf  NERDTreeFind
" cnoreabbrev nc  NERDTreeCWD

" function! NERDTreeRefresh()
"   if &filetype == "nerdtree"
"       silent exe substitute(mapcheck("R"), "<CR>", "", "")
"   endif
" endfunction

" augroup my-nerdtree
"   autocmd!
"   " get rid of the can't load a file msg
"   " autocmd VimEnter * silent NERDTree | wincmd p

"   autocmd BufEnter * call NERDTreeRefresh()
"   autocmd FileType syntax sync fromstart
" augroup END

"}}}
