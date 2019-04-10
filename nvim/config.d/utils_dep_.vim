" Author            : Matthew Rockwell
" Inspired by       : the VIM Community
"
" [ Utilities & Dependencies util_dep_.vim]
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
 augroup util_dep
   autocmd!
   "pope/dispatch"
   " au FileType dart let b:dispatch = "dart '%:p'"

   "startified"
   au User Startified setlocal buftype=nofile

   "colorizer"
   au BufNewFile,BufRead *.css,*.html,*.htm  :ColorHighlight!

augroup END


" vim dispatch "

"------[ neoterm  {{{
  " When set to `1` neoterm will scroll to the end of its buffer after running any
  " command or using :TOpen for when the terminal is hidden.
  " Default value: `0`
  let g:neoterm_autoscroll = 1

  " open terminal
  nnoremap <C-w>t :vertical Tnew<cr>
  nnoremap <C-w>T :belowright Tnew<cr>

  cnoreabbrev ntv vertical Tnew
  cnoreabbrev nts belowright Tnew
  cnoreabbrev ntc Tclear!
  cnoreabbrev ntk Tkill
  cnoreabbrev nto Topen
  cnoreabbrev ntx Tclose
  cnoreabbrev ntX Tclose!
  cnoreabbrev ntd T dart %

  ""ev ___ TcloseAll
  ""ev ___ TcloseAll!
   " :[N]T {cmd}                                                                 *:T*

  " Executes the given command on the neoterm with id [N]. With no [N] the last
  " active neoterm will be used (or a new one will be created). If a new neoterm
  " window is created, mods are accepted to position the new window. If there is a
  " `%` in the given command, this will be expanded to the current file path.

  " :[N]Texec {cmds}                                                        *:Texec*

  " Executes the given commands, one by one, on the neoterm with id [N]. With no
  " [N] the last active neoterm will be used or a new one will be created. If
  " there is a `%` in the given command, this will be expanded to the current file
  " path.
  " :[N]Ttoggle                                                           *:Ttoggle*
  " Toggles the neoterm with id [N]. With no [N] the last active neoterm will be
  " toggled.  This command accepts vim |mods|. The last |mods| used will be saved
  " in the neoterm instance.

  " :TtoggleAll                                                        *:TtoggleAll*
  " Toggles all neoterm windows in the current tab.

  " :Tnext                                                                  *:Tnext*
  " Navigate to the next neoterm instance, works like `:bnext`.

  " :Tprevious                                                          *:Tprevious*
  " Navigate to the previous neoterm instance, works like `:bprevious`.

  " :TREPLSetTerm {term-id}                                          *:TREPLSetTerm*
  " Chooses, or changes, the current neoterm to run the REPL commands.

  " :TREPLSendFile                                                  *:TREPLSendFile*
  " Sends the current file to a REPL.

  " :TREPLSendLine                                                  *:TREPLSendLine*
  " Sends the current line to a REPL.

  " :TREPLSendSelection                                        *:TREPLSendSelection*
  " Sends the current selection to a REPL.
"}}}

" ----==[ 'osyo-manga/vim-over'  {{{
  " :OverCommandLine [{input}]	                        *:OverCommandLine*
  " |over.vim| standalone command line mode emulating |:substitute|.
  " It will highlight your {pattern} and the {string} replacement will be
  " previewed.

  " While in command line mode, only a subset of key mappings are available see
  " |over-command_line-key-mappings| for details.

  " {input} pre-feed the command line with the given input.

" :OverCommandLineNoremap {lhs} {rhs}		 *:OverCommandLineNoremap*
  " It is the same as :OverCommandLine but with a specified key remap.
  " {lhs} will be substitued by {rhs}.
  " You can only substitute one key or one key with at most one modifier.
  " You can set it up in |g:over_command_line_key_mappings|.
" Example: >
  "   OverCommandLineNoremap <A-b> <C-b>
  "   OverCommandLineNoremap <A-f> <C-f>

  "" set to 1 to enable the highlighting from the command line automatically
  let g:over_enable_auto_nohlsearch = 1

  ""set to 1 in order to enable the command line
  let g:over_enable_cmd_window = 1

  ""sets the |:OverCommandLine| prompt.
  let g:over_command_line_prompt = "> "

  " Sets the key mapping used on the command line.
  " You can only substitute one key or one key with at most one modifier.
     " Example: >
    " " <C-l> assigned to <C-f>
    " " <C-h> assigned to <C-b>
    " let g:over_command_line_key_mappings = {
    " \	"\<C-l>" : "\<C-f>",
    " \	"\<C-h>" : "\<C-b>",
    " \}
  "" Set to 1 if you want to highlight :/ or :? searches.
  let g:over#command_line#search#enable_incsearch = 1

  " Set to 1 the pattern highlight will follow the cursor on the
  " :/ or :? command.
  let g:over#command_line#search#enable_move_cursor = 0

  " Sets the set of characters to be automatically escaped when a buffer is
  " pasted on the command line with <C-v>.
    " If you paste $foo.bar / 2 + 1
    " \$foo\.bar \/ 2 + 1 will be generated on the command line
  let g:over#command_line#paste_escape_chars = '/.*$^~'

  " This is a generic way of remplacing the content of the paste buffer
  " when you paste on the command line with <C-v>.
    " This will escape "\n" and "\r" automatically.
    let g:over#command_line#paste_filters = {
    \	"\n" : '\\n',
    \	"\r" : '\\r',
    \}

  let g:over#command_line#substitute#replace_pattern_visually = 1
  " Instead of previewing the replacement next to the replaced pattern, it
  " visually replaces the pattern instead.
  " Not enabled. To enable, set it to 1.
  " Example: >
  "   The wolf jumps over the sheep.
  "        /\
  "        || --- You want to replace 'wolf' with 'bear'.

  "   The [wolf][bear] jumps over the sheep.
  "        /\
  "        || --- Here is how vim-over will show you the preview normally.

  "   The [bear] jumps over the sheep.
  "        /\
  "        || --- Here is how vim-over will show you the preview with this
  "               option enabled.

"}}}

"------[ 'mhinz/vim-startify'  {{{
"
    let g:startify_disable_at_vimenter = 1
    let g:startify_session_dir = '~/.config/nvim/startify/session'
    let g:startify_session_delete_buffers = 1
    let g:startify_use_env =  0
    let g:startify_padding_left = 6

    let g:startify_custom_header = 'startify#fortune#boxed()'

    let g:startify_enable_special         = 0
    let g:startify_files_number           = 10
    let g:startify_relative_path          = 1
    let g:startify_change_to_dir          = 1
    let g:startify_update_oldfiles        = 1
    let g:startify_session_autoload       = 1
    let g:startify_session_persistence    = 1
    let g:startify_session_number = 999

    let g:startify_session_savevars = [
         \ 'g:startify_session_savevars',
         \ 'g:startify_session_savecmds',
         \ 'g:random_plugin_use_feature'
         \ ]

    let g:startify_bookmarks = [
     \ {'y': '/home/left-hand/Dropbox/Ubuntu18/nvim/nvim.d/todo.md'},
     \]

    let g:startify_list_order = [
          \ ['  --- Apps/Commands ---'],
          \ 'commands',
          \ ['  --- MRU ---'],
          \ 'files',
          \ ['  --- Saved Sessions ---'],
          \ 'sessions',
          \ ['  --- Bookmarks ---'],
          \ 'bookmarks'
          \ ]"

    " \ ['New Empty V-Buf', ':vnew | only | NERDTreeToggle | wincmd p'],
    let g:startify_commands = [
          \ ['New Empty V-Buf', ':vnew | only | silent NERDTreeToggle'],
          \ ['Vim Reference', 'h ref']
          \ ]

        " let g:startify_list_order = [
        "       \ ['  --- Apps/Commands ---'],
        "       \ 'commands',
        "       \ ['  --- MRU ---'],
        "       \ ['  --- MRU - Current Directory ---'],
        "       \ 'files',
        "       \ 'dir',
        "       \ ['   These are my sessions:'],
        "       \ 'sessions',
        "       \ ['   These are my bookmarks:'],
        "       \ 'bookmarks'
        "       \ ]"

    "command     Start      Startify
    cnoreabbrev startify    Strartify
    cnoreabbrev startsave   SSave
    cnoreabbrev startclose  SClose
    cnoreabbrev startload   SLoad
    cnoreabbrev startdelete SDelete
" }}}

"------[ 'chrisbra/Colorizer'  {{{
  "turn off the default keymap
  let g:colorizer_auto_map = 1

  " command ColorizerToggle Colorizer
  " cnoreabbrev coloron   ColorizerToggle
  " cnoreabbrev coloroff  ColorizerToggle

  ""ColorFgBg
  " <Leader>cC      <Plug>Colorizer  Toggle highlighting of Colors. In visual
  "                                  mode it only highlights the colors in the
  "                                  selected region (normal and visual mode).
  " <Leader>cT      <Plug>ColorContrast Cycle through contrast setting
  "                                  |:ColorContrast| (normal and visual mode)
  " <Leader>cF      <Plug>ColorFgBg     Toggle foreground and background color
  "                                  |:ColorSwapFgBg|


  command ToggleColor :call Colorizer#ColorToggle()
  cnoreabbrev coloron  ToggleColor

  command ColorOff call Colorizer#ColorOff()
  cnoreabbrev coloroff ColorOff

  command ToggleFB :call Colorizer#SwitchFGBG()
  cnoreabbrev colorflip ToggleFB
" }}}

"------[ Plug 'vim-freekeys'  {{{
  cnoreabbrev freekeys FreeKeys

"}}}

"------[ Plug 'lifepillar/vim-cheat40'  {{{
  let g:cheat40_use_default = 0

  command     EditCheat40 edit ~/.config/nvim/cheat40.txt
  cnoreabbrev echeat EditCheat40

"}}}


