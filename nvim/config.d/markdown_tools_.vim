" Author            : Matthew Rockwell
" Inspired by       : the VIM Community
" Initially created : 5/14/1998
"
"******************************************************************************
"

" [ Markdown / Writing / Spelling / Grammar  ]
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 " AutoGroup
  augroup mymarkdown
    autocmd!
    " autocmd FileType markdown
    "   \ call deoplete#custom#buffer_option('auto_complete', v:false)

    set completeopt=longest,menuone
    autocmd FileType markdown,mkd,md  call lexical#init()
    autocmd FileType textile          call lexical#init()
    autocmd FileType text             call lexical#init({ 'spell': 0 })
  augroup END




" ------[ 'dhruvasagar/vim-table-mode'  {{{

  let g:table_mode_corner='|'

  function! s:isAtStartOfLine(mapping)
    let text_before_cursor = getline('.')[0 : col('.')-1]
    let mapping_pattern = '\V' . escape(a:mapping, '\')
    let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
    return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
  endfunction

  inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
  inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

"}}}

" ------[ 'plasticboy/vim-markdown' {{{

    " tabular must come before plasticboy/vim-markdown
    let g:tex_conceal = ""
    let g:vim_markdown_conceal = 0

    let g:vim_markdown_math = 1
    let g:vim_markdown_toc_autofit  = 1
    let g:vim_markdown_folding_level = 1        " can be 1 thru 6
    let g:vim_markdown_folding_disabled = 0     " turn folding on
    let g:vim_markdown_new_list_item_indent = 0
    let g:vim_markdown_auto_insert_bullets  = 0

    let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'css', 'javascript' ]
    let g:markdown_minlines = 100
  "}}}

" ------[ 'euclio/vim-markdown-composer'   {{{
    let g:markdown_composer_open_browser   = 0    "Start Browser when opening an md file - default = 1 (yes)
    let g:markdown_composer_refresh_rate   = 0    "0 = every keystroke, or # in ms
    " let g:markdown_composer_syntax_theme = "solarized-dark"
    let g:markdown_composer_autostart = 0         " Start the view server on opening md file 1 = yes
    " let g:markdown_composer_custom_css = ['file:///home/left-hand/.local/share/nvim/css/solarized-dark.css']

    function CompMd()
      :ComposerStart
      :ComposerOpen
    endfunction
    nnoremap  <C-w>m :exec CompMd()<CR>

    command MdShow  :exec CompMd()
    cnoreabbrev mdshow MdShow

    "}}}



