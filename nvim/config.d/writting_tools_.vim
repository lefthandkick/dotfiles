" Author            : Matthew Rockwell
" Inspired by       : the VIM Community
" Initially created : 5/14/1998
"
"******************************************************************************

" ------[ vimwiki/vimwiki' {{{

  let g:vimwiki_folding = 'custom'

  let wiki_diary = {}
  let wiki_diary.index = 'Diary'
  let wiki_diary.path = '~/.config/nvim/vim_wiki_files/Diary/'
  let wiki_diary.html_template = '~/.config/nvim/vim_wiki_files/diary/public_html/template.tpl'
  let wiki_diary.syntax = 'markdown'

  let wiki_proj = {}
  let wiki_proj.index = 'Projects'
  let wiki_proj.path = '~/.config/nvim/vim_wiki_files/Project_Notes/'
  let wiki_proj.syntax = 'markdown'

  let wiki_vim = {}
  let wiki_vim.index = 'VIM-Notes'
  let wiki_vim.path = '~/.config/nvim/vim_wiki_files/Vim/'
  let wiki_vim.syntax = 'markdown'

  let g:vimwiki_list = [wiki_diary, wiki_proj, wiki_vim]

  nmap <Leader>wv <Plug>VimwikiVSplitLink

  augroup my-wiki
  "  command Help :e /Users/left-hand/Dropbox/Dot_Files/nvim/vim_wiki_files/Vim/Nvim.wiki
    autocmd FileType vimwiki  call pencil#init({'wrap': 'soft'})
  augroup END
"}}}

 "------[ 'reedes/vim-pencil' {{{
  let g:pencil#joinspaces = 1             " 0=one_space (def), 1=two_spaces
  let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
  augroup my-pencil
    autocmd FileType markdown call pencil#init({'wrap': 'soft', 'autoformat': 1})
    autocmd FileType text     call pencil#init({'wrap': 'hard', 'autoformat': 0})
  augroup END

  "}}}

"------[ 'reedes/vim-lexical' {{{
  "Better Spelling Mappings
  set spellsuggest=10
  " keyboard shortcuts
  nnoremap <Leader>\ [sz=

  let g:lexical#spelllang  = ['en_us',]
  let g:lexical#thesaurus  = []
  let g:lexical#thesaurus  = ['/Users/left-hand/.local/share/nvim/spell/mthesaur.txt']
  let g:lexical#spellfile  = ['/Users/left-hand/.local/share/nvim/spell/en.utf-8.add']
  let g:lexical#dictkonary = ['/usr/share/dict/words',]

  " spell word
  let g:lexical#spell_key = '<leader>sk'
  " let g:lexical#thesaurus_key = '<leader>t'
  let g:lexical#dictionary_key = '<leader>sK'

"}}}

" ------[ 'phongvcao/vim-stardict' {{{
       " Make vim-stardict split open in a :split (default value)
       let g:stardict_split_horizontal = 1
       let g:stardict_split_size       = 22

       " Prompts for word to type in
       nnoremap <leader>sL :silent! StarDict<Space>

       " Lookup the word under cursor
       nnoremap <leader>sl :silent! StarDictCursor<CR>
"}}}

" ------[ ron89/thesaurus_query.vim'  {{{

 let g:tq_openoffice_en_file = "/Users/left-hand/.config/nvim/spell/MyThes/th_en_US_new"
 let g:tq_mthesaur_file      = "/Users/left-hand/.config/nvim/spell/mthesaur.txt"
 let g:tq_enabled_backends   = ["openoffice_en","mthesaur_txt"]
 let g:tq_python_version = 3

 "let g:tq_truncation_on_definition_num = 9
 let g:tq_truncation_on_syno_list_size = 20

 nnoremap <Leader>st :ThesaurusQueryReplaceCurrentWord<CR>
"}}}

" ------[ 'rhysd/vim-grammarous' {{{
  "For example, below setting makes grammar checker check comments only except for markdown and vim help.
  let g:grammarous#default_comments_only_filetypes = {
              \ '*' : 1, 'help' : 0, 'markdown' : 0,
              \ }
  " noremap <leader>wg :GrammarousCheck<CR>
       " noremap <leader>wr :GrammarousReset<CR>
  " command Gram      GrammorousCheck
  " command Gramreset GrammorousReset
  cnoreabbrev gram GrammorousCheck
  cnoreabbrev gramreset GrammorousReset


"}}}
