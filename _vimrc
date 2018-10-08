version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
map! <S-Insert> *
vmap  "*d
map Q gq
vmap [% [%m'gv``
vmap ]% ]%m'gv``
vmap a% [%v]%
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())
" auto save when hit escape
inoremap <Esc> <Esc>:w<CR>
imap ,/ </<C-X><C-O>
vmap <C-Del> "*d
vmap <S-Del> "*d
vmap <C-Insert> "*y
vmap <S-Insert> "-d"*P
nmap <S-Insert> "*P
" tabbing for selection in visual mode
vmap <Tab> >gv
vmap <S-Tab> <gv
inoremap  u
let &cpo=s:cpo_save
unlet s:cpo_save
syntax on
syntax enable
" fix tab size to 4 spaces
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cindent
set backspace=indent,eol,start
" no backup file
set nobackup
set nowritebackup
set noswapfile
set diffexpr=MyDiff()
set display=truncate
set guioptions=egmrLT
set helplang=En
set history=200
set hlsearch
set incsearch
set langnoremap
set nolangremap
set nrformats=bin,hex
set ruler
set runtimepath=~/vimfiles,C:\\Program\ Files\ (x86)\\Vim/vimfiles,C:\\Program\ Files\ (x86)\\Vim\\vim81,C:\\Program\ Files\ (x86)\\Vim\\vim81\\pack\\dist\\opt\\matchit,C:\\Program\ Files\ (x86)\\Vim/vimfiles/after,~/vimfiles/after
set scrolloff=5
set ttimeout
set ttimeoutlen=100
" no undo files
set noundofile
set wildmenu
" nowrap by default
set nowrap
" Enable utf-8 characters
set enc=utf-8
" My GUI settings
set guifont=Consolas:h16:cDEFAULT
colorscheme gruvbox
" autocmd VimEnter * NERDTree D:\Saigon\apps\minesweeper
autocmd VimEnter * NERDTree D:\Projects\Thuy\minesweeper
" vim: set ft=vim :
