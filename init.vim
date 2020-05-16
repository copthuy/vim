" -------------------------------------------------------------------------------------------------------
" GENERAL SETTINGS
" -------------------------------------------------------------------------------------------------------
filetype plugin indent on 					" Turns on "detection", "plugin" and "indent" at once
syntax enable 								" Enables syntax highlighing
set nocompatible 							" No compatible
set t_Co=256 								" Support 256 colors
set hidden 									" Allow modified buffers to be hidden
set nowrap 									" Nowrap long lines
set ruler 									" Show the cursor position all the time
set number 									" Show left number gutter
set mouse=a 								" Enable your mouse
set splitbelow 								" Horizontal splits will automatically be below
set splitright 								" Vertical splits will automatically be to the right
set tabstop=4 								" Insert 4 spaces for a tab
set shiftwidth=4 							" Set indent the same size as tab size 
set softtabstop=0 							" No insert spaces in insert mode to simulate tab space
set noexpandtab 							" Use tab character
set autoindent 								" Copy indent from current line when starting a new line (ai).
set smartindent 							" Smart auto indent when starting a new line
set showmatch 								" Highlight the matching bracket or brace
set backspace=indent,eol,start 				" Make backspace key work the same as other applications
set title 									" Show filepath in title
set laststatus=2 							" Show status bar
set showcmd 								" Show (partial) command in the status line
set autochdir 								" Change dir to opened file's dir
set updatetime=50 							" Faster completion
set cmdheight=2 							" Add one more line to command line box
set clipboard=unnamedplus 					" Copy paste between vim and everything else
set hlsearch 								" Highlight search keyword
set incsearch 								" Enable incremental search, highlight search result as you type
set ignorecase 								" Search ignore case
set smartcase 								" Search exact pattern
set switchbuf=usetab,newtab 				" Open buffer in new window tab
set completeopt=longest,menuone,noinsert 	" Command line completion
set colorcolumn=81 							" Column marker at 81 (avoid writing long code)
set nobackup 								" No backup file						
set noundofile 								" No undo file
set noswapfile 								" No swap file
set fileencoding=utf-8 						" The encoding written to file
set fileformat=unix 						" Set fileformat to unix
set encoding=utf-8 							" Set string encoding
set iskeyword+=- 							" Treat dash separated words as a word text object

" Highight current cursor line
" Some tweaks to make it faster since cursoline will slow down VIM
set cursorline! lazyredraw synmaxcol=1024
syntax sync minlines=256
hi cursorline cterm=none term=none
augroup cline
	autocmd!
	autocmd WinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
augroup END
highlight CursorLine guibg=#303000 ctermbg=black

" -------------------------------------------------------------------------------------------------------
" PLUGINS - vim-plug mamager
" -------------------------------------------------------------------------------------------------------
call plug#begin('~/AppData/Local/nvim/plugged')
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'tpope/vim-surround'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'captbaritone/better-indent-support-for-php-with-html'
	Plug 'jremmen/vim-ripgrep'

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
	Plug 'vim-airline/vim-airline-themes'
	
	" Themes
	Plug 'altercation/vim-colors-solarized'
	Plug 'tomasiser/vim-code-dark'
	Plug 'drewtempelmeyer/palenight.vim'
	Plug 'morhetz/gruvbox'
	Plug 'rakr/vim-one'

call plug#end()
" End vim-plug manager

" -------------------------------------------------------------------------------------------------------
" NERDTree
" -------------------------------------------------------------------------------------------------------
let g:NERDTreeWinSize=35
let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'
let g:NERDTreeAutoDeleteBuffer = 1
let g:nerdtree_tabs_open_on_console_startup=1
autocmd BufEnter * lcd %:p:h
autocmd BufWinEnter * NERDTreeMirror
autocmd VimEnter * NERDTree | wincmd w
nmap <silent> <Leader>n :NERDTreeToggle<CR>

" -------------------------------------------------------------------------------------------------------
" COC COMMANDS
" -------------------------------------------------------------------------------------------------------
" https://github.com/neoclide/coc.nvim
command! -nargs=0 Format :call CocAction('format')
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)

autocmd CursorHold * silent call CocActionAsync('highlight')

" Auto force html as php
autocmd BufNewFile,BufRead *.html set filetype=php

" -------------------------------------------------------------------------------------------------------
" VIM AIRLINE
" -------------------------------------------------------------------------------------------------------
let g:airline_theme='light'
" let g:airline_theme='palenight'
"let g:airline_theme = 'codedark'
"let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

" -------------------------------------------------------------------------------------------------------
" SET MY FAVORITE COLOR SCHEME
" -------------------------------------------------------------------------------------------------------
set termguicolors
set background=light
" colorscheme solarized
" colorscheme codedark
" colorscheme palenight
colorscheme one
let g:gruvbox_contrast_dark='soft'
let g:solarized_contrast='hight'
" colorscheme gruvbox
map <silent> <F2> :set background=light<CR>:colorscheme solarized<CR>:AirlineTheme solarized<CR>
map <silent> <F3> :set background=dark<CR>:colorscheme solarized<CR>:AirlineTheme solarized<CR>
map <silent> <F4> :set background=dark<CR>:colorscheme codedark<CR>:AirlineTheme dark_minimal<CR>
map <silent> <F5> :set background=dark<CR>:colorscheme palenight<CR>:AirlineTheme dark_minimal<CR>
map <silent> <F6> :set background=dark<CR>:colorscheme gruvbox<CR>:AirlineTheme dark_minimal<CR>
map <silent> <F7> :set background=light<CR>:colorscheme one<CR>:AirlineTheme light<CR>
map <silent> <F8> :set background=dark<CR>:colorscheme one<CR>:AirlineTheme onedark<CR>

" -------------------------------------------------------------------------------------------------------
" AUTO CLOSE TAGS
" -------------------------------------------------------------------------------------------------------
let g:closetag_filenames='*.html,*.xhtml,*.phtml,*.php'

" Auto save file when leaving insert mode
" autocmd InsertLeave * update

" -------------------------------------------------------------------------------------------------------
" NETRW
" -------------------------------------------------------------------------------------------------------
"function ShowNetrw()
"	silent Lexplore
"	silent vertical resize 30
"endfunction
"function! ToggleNetrw()
"	let i = bufnr("$")
"	let wasOpen = 0
"	while (i >= 1)
"		if (getbufvar(i, "&filetype") == "netrw")
"			silent exe "bwipeout " . i
"			let wasOpen = 1
"		endif
"		let i-=1
"	endwhile
"    if !wasOpen
"		call ShowNetrw()
"    endif
"endfunction

"let g:netrw_banner=0
"let g:netrw_liststyle=3
"let g:netrw_browse_split=4
"let g:netrw_altv=1
"augroup ProjectDrawer
"	autocmd!
"	autocmd VimEnter * call ShowNetrw()
"augroup END
"map <Leader>n :call ToggleNetrw() <CR>

" -------------------------------------------------------------------------------------------------------
" MAPPING
" -------------------------------------------------------------------------------------------------------
"This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

" Map Tab and Shift Tab
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Move current line
nnoremap <C-k> :<C-u>silent! move-2<CR>==
nnoremap <C-j> :<C-u>silent! move+<CR>==
xnoremap <C-k> :<C-u>silent! '<,'>move-2<CR>gv=gv
xnoremap <C-j> :<C-u>silent! '<,'>move'>+<CR>gv=gv

" -------------------------------------------------------------------------------------------------------
" Remove all trailing whitespace by pressing \t {trim}
" Replace all non-breaking space character with normal space
" -------------------------------------------------------------------------------------------------------
nnoremap <Leader>t :let _s=@/<Bar>:%s/\s\+$//e<Bar>:%s/\r/\r/g<Bar>:%s/\%u00a0/ /g<Bar>:let @/=_s<Bar><CR>
