" Author            : Matthew Rockwell
" Inspired by       : the VIM Community
" Initially created : 5/14/1998
"
" -------------------------------------------------------------------------------

  function SaveDelBuff()
    :update
    :Bwipeout
  endfunction
  cnoreabbrev W :call SaveDelBuff()


 function PrintKeymap()   "{{{

    :redir > ~/.config/nvim/pk_vim_keymap.txt
    :silent verbose map
    " :silent verbose vmap
    " :silent verbose imap
    :redir END
 endfunction

command Pk call PrintKeymap()

"}}}

  function! AddEmptyLineBelow()  "{{{
    call append(line("."), "")
  endfunction "}}}

  function! AddEmptyLineAbove() "{{{
    let l:scrolloffsave = &scrolloff
    " Avoid jerky scrolling with ^E at top of window
    set scrolloff=0
    call append(line(".") - 1, "")
    if winline() != winheight(0)
      silent normal! <C-e>
    end
    let &scrolloff = l:scrolloffsave
  endfunction "}}}

  function! StripTWSpaces()   "{{{
    let l:l = line(".")
    let l:c = col(".")
    %s/\s\+$//e
    call cursor(l:l, l:c)
  endfunction                 "}}}

function! ScrollOtherWindow(direction) "{{{
  execute 'wincmd' (winnr('#') == 0 ? 'w' : 'p')
  execute (a:direction ? "normal! \<C-d>" : "normal! \<C-u>")
  wincmd p
endfunction
"}}}

  function! SmartClose() "{{{
    if winnr('$') != 1
      close
    endif
  endfunction "}}}

  function! ToggleWinSplit() "{{{
    let prev_name = winnr()
    silent! wincmd w
    if prev_name == winnr()
      call SplitNice()
    else
      call SmartClose()
    endif
  endfunction

  function! SplitNice()
    if winwidth(0) > 2 * &winwidth
      vsplit
    else
      split
    endif
  wincmd p
  endfunction
"}}}

 function! NeatFoldText()   "{{{
   hi Folded term=NONE cterm=NONE gui=NONE

    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1

    let foldSize = 1 + v:foldend - v:foldstart
    let lineCount = line("$")

    if has("float")
        try
            let foldPercentage = printf(" %.1f", (foldSize*1.0)/lineCount*100) . "% "
        catch /^Vim\%((\a\+)\)\=:E806/	" E806: Using Float as String
            let foldPercentage = printf("| [of %d lines] |", lineCount)
        endtry
    endif

    "let lines_count_text = '| ' . printf("%10s", lines_count . ' lines ') . ' - ' . foldPercentage . ' |'
    let lines_count_text = ' '

    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart(' <<->> ' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 40)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn

    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
"}}}

  function! ToggleNumbering() abort "{{{
          if !&number && !&relativenumber
              set number
              set norelativenumber
          elseif &number && !&relativenumber
              set nonumber
              set relativenumber
          elseif !&number && &relativenumber
              set number
              set relativenumber
          elseif &number && &relativenumber
              set nonumber
              set norelativenumber
          endif
     endfunction
   "}}}

" q: Quickfix  "{{{

" The prefix key.
nnoremap [Quickfix]  <Nop>
nmap    q  [Quickfix]
" Disable Ex-mode.
nnoremap Q  q

" Toggle quickfix window.

 " q<space> is the toggle
nnoremap <silent> [Quickfix]<Space>
      \ :<C-u>call <SID>toggle_quickfix_window()<CR>

function! s:toggle_quickfix_window()
  let _ = winnr('$')
  cclose
  if _ == winnr('$')
    copen
    setlocal nowrap
    setlocal whichwrap=b,s
  endif
endfunction
"}}}

" :help <what you want help with> displayed in a new tab {{{
" ----------------------------------------------------------------------------
function! Myhelptab()
  if &buftype == 'help'
    wincmd T
    nnoremap <buffer> q :q<cr>
  endif
endfunction
"}}}

