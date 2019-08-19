set nocompatible

filetype plugin indent on
syntax on
syntax enable
set fileformat=unix
set showmatch ruler
set nobackup noundofile noswapfile
set autoindent smartindent cindent tabstop=4 shiftwidth=4
set backspace=indent,eol,start
set nowrap
set enc=utf-8
set guifont=Consolas:h12:cDEFAULT
set lines=33 columns=110
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
set wildmenu wildmode=longest:full,full

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

" Gui option for gvim. Hide menu & toolbar
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll Bar

" Map Tab and Shift Tab
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Move current line
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Remove all trailing whitespace by pressing \t {trim}
nnoremap <Leader>t :let _s=@/<Bar>:%s/\s\+$//e<Bar><CR>:%s/
/\r/g<Bar>:let @/=_s<Bar><CR>

" Start of vim-plug manager
call plug#begin('~/vimfiles/plugged')
	"Plug 'haishanh/night-owl.vim'
	Plug 'morhetz/gruvbox'
	Plug 'scrooloose/nerdtree'
	Plug 'tpope/vim-surround'
	Plug 'alvan/vim-closetag'
	Plug 'vim-scripts/AutoComplPop'
	Plug 'vim-scripts/zoom.vim'
	Plug 'powerline/powerline'
	Plug 'nathanaelkane/vim-indent-guides'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'junegunn/rainbow_parentheses.vim'
call plug#end()
" End vim-plug manager

" Map NerdTree to <F3>
map <F3> :NERDTreeToggle<CR>

" Set my favorite color scheme
colorscheme gruvbox 

" Rainbow Parentheses
augroup rainbow
	autocmd!
	autocmd FileType javascript,typescript,php,html RainbowParentheses
augroup END

" Indent guide open
let g:indent_guides_enable_on_vim_startup = 1

" snippets
nnoremap <Leader>h5 :-1read ~\vimfiles\snippets\html5.html<CR>10jwf>a
nnoremap <Leader>bo :-1read ~\vimfiles\snippets\bootstrap.html<CR>10jwf>a
nnoremap <Leader>ga :-1read ~\vimfiles\snippets\ga.html<CR>
nnoremap <Leader>jq :-1read ~\vimfiles\snippets\jquery.html<CR>

" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>



