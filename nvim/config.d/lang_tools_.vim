" Author            : Matthew Rockwell
" Inspired by       : the VIM Community
" Initially created : 5/14/1998
"
"******************************************************************************
"
" ------[ 'neoclide/coc.nvim' {{{
  " Set some nvim settings
  " if hidden is not set, TextEdit might fail.
  set hidden
  " Better display for messages
  set cmdheight=2
  " Smaller updatetime for CursorHold & CursorHoldI
  set updatetime=300
  " don't give |ins-completion-menu| messages.
  set shortmess+=c
  " always show signcolumns
  set signcolumn=yes

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
         \ pumvisible() ? "\<C-n>" :
         \ <SID>check_back_space() ? "\<TAB>" :
         \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> for trigger completion.
  inoremap <silent><expr> <C-space> coc#refresh()

  " Use `[c` and `]c` for navigate diagnostics
  nmap <silent> [c <Plug>(coc-diagnostic-prev)
  nmap <silent> ]c <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K for show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if &filetype == 'vim'
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Remap for rename current word
  " nmap <leader>rn <Plug>(coc-rename)
  " Remap for format selected region
  " vmap <leader>f  <Plug>(coc-format-selected)
  " nmap <leader>f  <Plug>(coc-format-selected)
  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  " vmap <leader>a  <Plug>(coc-codeaction-selected)
  " nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Use `:Format` for format current buffer
  command! -nargs=0 Format :call CocAction('format')

  " Use `:Fold` for fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Using CocList
  " Show all diagnostics
  nnoremap <silent> <space>ca  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> <space>ce  :<C-u>CocList extensions<cr>
  " Show commands
  nnoremap <silent> <space>cc  :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <space>co  :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent> <space>cy  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>cj  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>ck  :<C-u>CocPrev<CR>
  " Resume latest coc list
  nnoremap <silent> <space>cp  :<C-u>CocListResume<CR>

  augroup mycocgroup
    autocmd!
    " param help
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

    " close suggestion window upon a competion
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

    " Turn pairs specific caracters for markdown files
    autocmd FileType markdown let b:coc_paris_disabled = ['`']

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript, json setl formatexpr=CocAction('formatSelected')

    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end
  "--------------------------------------------------------------------"
  "}}}
