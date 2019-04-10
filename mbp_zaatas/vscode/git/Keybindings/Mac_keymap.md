

# Keymap VS\_CODE - Remap

These are the Control Key I took away from VSV (VsCodeVim)
  "vim.handleKeys": {
	    "<C-a>": false,  // not sure how I will use, if at all.
	    "<C-t>": false,  // Toggles and tabs 
	    "<C-w>": false,  // Windows Nav : Cmd-w is used also.
  },

Rational:
- The objective is to get the best vim like experience.  I'm coming over from
  neovim, and would like to keep some of the years of muscle memory.

  - Ctrl W : rebind all window nav actions from vscodevim to a direct binding,
	that of ctrl-w.  As such these binding would outside of vim mode.

  - Use the Cmd key in a way that I might use the Alt key on a windows or linux box


ToDo:
- task runners



## Keybinding Tables

|     OS      |                        |
| :---------: | :--------------------- |
| Cmd Shift 1 | Print Screen           |
| Cmd Shift 2 | Print Area Screen      |
|             |                        |
| Ctrl Cmd W  | Toggle Moom            |
|             | - Arrow Move Window    |
|             | (ctrl ghjk)            |
|             | - H L Move Window      |
|             | - Space Centers Window |
|             |                        |




|       IDE        |                           |
| :--------------: | :------------------------ |
|     Cmd , s      | VSC Settings              |
|     Cmd , k      | VSC Keybindings           |
|     Cmd , r      | PDF Cheetsheet            |
|                  |                           |
|    Cmd Space     | Focus to Last Editor      |
|  ctrl Cmd Space  | Command Palette           |
|                  |                           |
| Cmd Ctrl Up/Down | Inc/ Dec Active Editor    |
|                  |                           |
|  Cmd Ctrl , / .  | Rezise Active Editor      |
|                  |                           |
|  Ctrl Cmd J / K  | Insert Line Above / Below |
|                  |                           |
|     Cmd K K      | Look up in Mac Dictionary |
|                  |                           |
|                  |                           |



|   VIM   |        Leader         | 
| :-----: | :-------------------: | 
|    L    |  Toggle Line Number   |
|    N    |      Open VsNote      |
| Shift N |      New VsNote       |
|    W    |         Save          |
| Shift w | Save and Close Editor |



|  VIM  | Normal                          |  |
| :---: | :------------------------------ |
| H / L | Bol / Eol                       |
|  g C  | Dup Line to Below, Comment Orig |
|  g b  | Add another cursor              |
|  g d  | Jump to Definition              |
|  g h  | Hover / Info                    |
| n ss  | Insert n Spaces (def = 1)       |
| s xx  | Fwd Find two letter (sneak)     |
| S xx  | Rev Find two letter (sneak)     |


|  VIM  | Visual            |
| :---: | :---------------- |
|  g f  | Select by block   |
|  g q  | reflow & wordwrap |


| Surround                              |                                                |
| :------------------------------------ | :--------------------------------------------- |
| d s '<existing char>'                 | Delete existing surround                       |
| c s  '<existing char> <desired char>' | Change surround existing to desired            |
| y s  '<motion> <desired char>'        | Surround something with something using motion |
| S  '<desired char>'                   | Surround full section when in visual modes     |


| Ctrl - p | P-Files                   |
| :------: | :------------------------ |
|    l     | Log Files                 |
|    n     | New File (explorer)       |
|  Ctrl N  | New Folder (explorer)     |
|    o     | Open File                 |
|    p     | Quick Open                |
|          |                           |
|  Ctrl O  | Open Folder in New Window |
|          |                           |




| Ctrl - T | Toggle and Tabs   |
| :------: | :---------------- |
|    A     | Acitvity Bar      |
|    C     | Clean Screen Mode |
|    E     | Auto Word Wrap    |
|  J / L   | Next & Prev Tab   |
|    M     | Mini Map          |
|    N     | VsNote            |
|  Ctrl B  | New VsNote        |
|    S     | Status Bar        |
|    T     | Tabs Visable      |
|          |                   |


| Ctrl - W | Action                            |
| :------- | :-------------------------------- |
| B        | Toggle Side Bar View              |
| C        | Close Active Editor               |
| Cmd C    | Close Editors in the Active Group |
| Ctrl C   | Close All Open Editors            |
|          |                                   |
| E        | Open Explorer (toggle)            |
| H J K L  | Focus to Editor on the            |
|          |                                   |
| N        | New Editor/Tab (un-named)         |
| Cmd N    | Open New Window                   |
| Ctrl N   | Open Active Editor New Window     |
|          |                                   |
| O        | Only                              |
| Ctrl O   | Reset from Only                   |
|          |                                   |
| Q        | Quick Open View                   |
| R        | Reload Editor                     |
|          |                                   |
| S        | Switch Horz/Vert Window           |
| Ctrl s   | Switch Windows                    |
|          |                                   |
|          |                                   |
| V        | Split Vert                        |
|          |                                   |
| Z        | Toggle Zen Mode                   |


| Cmd - W (Panel + Term) | Action            |
| :--------------------- | :---------------- |
| H J K L                | Move Editor       |
| Cmd H J K L            | Move Editor Group |
|                        |

	
| Cmd - P (Panel + Term) | Action               |
| :--------------------- | :------------------- |
| H / L                  | Next / Prev Panel    |
| M                      | Panel Move H/V       |
| Cmd M                  | Toggle Panel Max     |
| P                      | Panel Visible        |
| Cmd P                  | Panel Focus          |
| K                      | Close Panel          |
| T                      | Toggle Terminal View |
| Cmd T                  | Clear Terminal       |
| Shift T                | Kill Terminal        |

