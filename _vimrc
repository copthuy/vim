set nocompatible

filetype plugin indent on
syntax enable
set fileformat=unix
set showmatch ruler
set nobackup noundofile noswapfile
set autoindent smartindent cindent tabstop=4 shiftwidth=4
set backspace=indent,eol,start
set nowrap
set enc=utf-8
set title

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Show left number gutter
set number

" Show status bar
set laststatus=2

" Show (partial) command in the status line
set showcmd

" Command line completion
set completeopt=longest,menuone,noinsert
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Highight current cursor line
" Some tweaks to make it faster since cursoline will slow down VIM
set cursorline! lazyredraw synmaxcol=256
syntax sync minlines=256
hi cursorline cterm=none term=none
augroup cline
	autocmd!
	autocmd WinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
augroup END
highlight CursorLine guibg=#303000 ctermbg=black

" Column marker at 81 (avoid writing long code)
" set colorcolumn=81

" Start of vim-plug manager
call plug#begin('~/.vim/plugged')
	Plug 'scrooloose/nerdtree'
	Plug 'jistr/vim-nerdtree-tabs'
	Plug 'tpope/vim-surround'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'lifepillar/vim-mucomplete'
	Plug 'altercation/vim-colors-solarized'
	Plug 'jelera/vim-javascript-syntax'
call plug#end()
" End vim-plug manager

" NERDTree
let g:NERDTreeWinSize = 35
let g:nerdtree_tabs_open_on_console_startup = 1
nmap <silent> <F3> :NERDTreeToggle<CR>

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Vim Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Autocomplete
let g:mucomplete#enable_auto_at_startup = 1

" Set my favorite color scheme
set t_Co=256
let g:solarized_termtrans = 1
let g:solarized_termcolors = 256
"set background=dark
colorscheme solarized

" Auto save file when leaving insert mode
autocmd InsertLeave * update

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAP
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

" Map Tab and Shift Tab
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
" inoremap <S-Tab> <C-D> /// mapped with mucomplete
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Move current line
nnoremap <C-k> :<C-u>silent! move-2<CR>==
nnoremap <C-j> :<C-u>silent! move+<CR>==
xnoremap <C-k> :<C-u>silent! '<,'>move-2<CR>gv=gv
xnoremap <C-j> :<C-u>silent! '<,'>move'>+<CR>gv=gv

" Remove all trailing whitespace by pressing \t {trim}
" Replace all non-breaking space character with normal space
nnoremap <Leader>t :let _s=@/<Bar>:%s/\s\+$//e<Bar>:%s/\%u00a0/ /g<Bar>:let @/=_s<Bar><CR>

" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>



