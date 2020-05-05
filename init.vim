set nocompatible

"filetype plugin indent on
filetype plugin on
syntax enable
set fileformat=unix
set showmatch ruler
set nobackup noundofile noswapfile
set autoindent smartindent cindent tabstop=4 shiftwidth=4
set backspace=indent,eol,start
set nowrap
set enc=utf-8
set title
set splitbelow
set mouse=a
" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" buffer & tabs
set switchbuf=usetab,newtab

" Show left number gutter
set number

" Show status bar
set laststatus=2

" Show (partial) command in the status line
set showcmd

" Command line completion
set completeopt=longest,menuone,noinsert

" Highight current cursor line
" Some tweaks to make it faster since cursoline will slow down VIM
set cursorline! lazyredraw synmaxcol=512
syntax sync minlines=128
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
call plug#begin('~/AppData/Local/nvim/plugged')
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'tpope/vim-surround'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'captbaritone/better-indent-support-for-php-with-html'

	" Programming support
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'mattn/emmet-vim'
	Plug 'jelera/vim-javascript-syntax'
	Plug 'ap/vim-css-color'
	Plug 'alvan/vim-closetag'

	" Interface
	Plug 'scrooloose/nerdtree'
	Plug 'jistr/vim-nerdtree-tabs'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'vim-airline/vim-airline'
	
	" Themes
	Plug 'altercation/vim-colors-solarized'
	Plug 'tomasiser/vim-code-dark'
	Plug 'drewtempelmeyer/palenight.vim'
	Plug 'morhetz/gruvbox'

call plug#end()
" End vim-plug manager
"
"let g:netrw_banner=0
"let g:netrw_liststyle=3
"let g:netrw_browse_split=4
"let g:netrw_altv=1
"let g:netrw_winsize=25
"augroup ProjectDrawer
"	autocmd!
"	autocmd VimEnter * :Vexplore
"augroup END

" NERDTree
let g:NERDTreeWinSize=35
let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'
let g:NERDTreeAutoDeleteBuffer = 1
"let g:nerdtree_tabs_open_on_console_startup=1
autocmd BufEnter * lcd %:p:h
autocmd BufWinEnter * NERDTreeMirror
autocmd VimEnter * NERDTree | wincmd w
nmap <silent> <Leader>n :NERDTreeToggle<CR>

" Coc commands
" https://github.com/neoclide/coc.nvim
command! -nargs=0 Format :call CocAction('format')
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
nmap F2 <Plug>(coc-rename)
autocmd CursorHold * silent call CocActionAsync('highlight')

" Auto force html as php
autocmd BufNewFile,BufRead *.htm* set filetype=php

" Vim Airline
let g:airline_theme='palenight'
"let g:airline_theme = 'codedark'
"let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

" Set my favorite color scheme
set termguicolors
set background=dark
" colorscheme solarized
" colorscheme codedark
" colorscheme palenight
let g:gruvbox_contrast_dark='soft'
colorscheme gruvbox

" Auto close tags
let g:closetag_filenames='*.html,*.xhtml,*.phtml,*.php'

" Auto save file when leaving insert mode
" autocmd InsertLeave * update

" Add - to keyword
augroup css
    autocmd!
    autocmd FileType css,html,php setlocal iskeyword+=-
augroup END

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAP
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Check spelling
nmap <F6> :setlocal spell! spelllang=en_us<CR>

"This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

" Map Tab and Shift Tab
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Map copy / paste clipboard
nnoremap <S-Insert> "+p
nnoremap <C-Insert> "+y
inoremap <S-Insert> <C-r>+
vnoremap <S-Insert> "+p
vnoremap <C-Insert> "+y

" Move current line
nnoremap <C-k> :<C-u>silent! move-2<CR>==
nnoremap <C-j> :<C-u>silent! move+<CR>==
xnoremap <C-k> :<C-u>silent! '<,'>move-2<CR>gv=gv
xnoremap <C-j> :<C-u>silent! '<,'>move'>+<CR>gv=gv

" Remove all trailing whitespace by pressing \t {trim}
" Replace all non-breaking space character with normal space
nnoremap <Leader>t :let _s=@/<Bar>:%s/\s\+$//e<Bar>:%s/\r/\r/g<Bar>:%s/\%u00a0/ /g<Bar>:let @/=_s<Bar><CR>

" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>



