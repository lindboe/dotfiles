set nocompatible
set shiftwidth=2
set expandtab
set number
set ruler
set hlsearch

" Plugins are plain git clones in ~/.vim/pack/plugins/start (Vim native
" packages), managed by scripts/user/vim-plugins.sh
filetype plugin indent on
syntax on

" rainbow: always on, all bracket types
let g:rainbow_active = 1

" Built-in markdown syntax: highlight fenced code blocks in these languages
let g:markdown_fenced_languages = ['js=javascript', 'ts=typescript', 'javascript', 'typescript', 'jsx=javascriptreact', 'tsx=typescriptreact', 'bash=sh', 'sh', 'json', 'swift', 'kotlin', 'java', 'ruby', 'python', 'vim']

" CamelCaseMotion motions (default leader is \)
map <silent> <leader>w <Plug>CamelCaseMotion_w
map <silent> <leader>b <Plug>CamelCaseMotion_b
map <silent> <leader>e <Plug>CamelCaseMotion_e
map <silent> <leader>ge <Plug>CamelCaseMotion_ge
" inner-word text object, e.g. ci<leader>w changes one camelCase word
omap <silent> i<leader>w <Plug>CamelCaseMotion_iw
xmap <silent> i<leader>w <Plug>CamelCaseMotion_iw

" vim-prettier: format on save, but only in projects with a prettier config
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat_config_present = 1

highlight default link EndOfLineSpace ErrorMsg
match EndOfLineSpace / \+$/
autocmd InsertEnter * hi link EndOfLineSpace Normal
autocmd InsertLeave * hi link EndOfLineSpace ErrorMsg
autocmd Filetype cpp setlocal sw=4
