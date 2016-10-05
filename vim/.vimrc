set nocompatible
set shiftwidth=2
set expandtab
set number
set ruler
set hlsearch
execute pathogen#infect()
filetype plugin on
filetype indent on
syntax on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
highlight default link EndOfLineSpace ErrorMsg
match EndOfLineSpace / \+$/
autocmd InsertEnter * hi link EndOfLineSpace Normal
autocmd InsertLeave * hi link EndOfLineSpace ErrorMsg
autocmd Filetype cpp setlocal sw=4
