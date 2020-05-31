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
set number relativenumber 					" Show left number gutter
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
set cmdheight=2 							" Add more lines to command line box
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
set autoread 								" Auto reload file
set fileencoding=utf-8 						" The encoding written to file
set fileformat=unix 						" Set fileformat to unix
set encoding=utf-8 							" Set string encoding
set iskeyword+=- 							" Treat dash separated words as a word text object
set foldmethod=manual 						" Manual folding
set list! listchars=tab:\|\  				" Show tab vertical bars

" Auto toggle line number
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Fix autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
	\ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
autocmd FileChangedShellPost *
	\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

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

	" Back to NERD tree
	Plug 'scrooloose/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

	" Interaction
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'tpope/vim-surround'
	Plug 'terryma/vim-multiple-cursors'

	" Programming
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'jelera/vim-javascript-syntax'
	Plug 'captbaritone/better-indent-support-for-php-with-html'
	Plug 'ap/vim-css-color'
	Plug 'alvan/vim-closetag'

	" Interface
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

" Change leader to space
let mapleader=" "
" -------------------------------------------------------------------------------------------------------
" NERD Tree
" -------------------------------------------------------------------------------------------------------
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['\.svn$', '\.git$', 'node_modules']

" Highight file
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeLimitedSyntax = 1

" Toggle and mapping
autocmd VimEnter * NERDTree
map <M-f> :NERDTreeToggle<CR>
map <M-d> :NERDTree %<CR><C-w>l
nmap <Leader>r :NERDTreeFocus<cr> \| R \| <c-w><c-p>

" -------------------------------------------------------------------------------------------------------
" COC SETTINGS - https://github.com/neoclide/coc.nvim
" -------------------------------------------------------------------------------------------------------
" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif

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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" Format the whole document
nmap <leader>g :Format<CR>
xmap <leader>g :Format<CR>

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json,php,javascript,html setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" -------------------------------------------------------------------------------------------------------
" VIM AIRLINE
" -------------------------------------------------------------------------------------------------------
let g:airline_theme='light'
" let g:airline_theme='palenight'
"let g:airline_theme = 'codedark'
let g:airline_powerline_fonts=1
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
map <leader>1 :set background=light<CR>:colorscheme solarized<CR>:AirlineTheme solarized<CR>
map <leader>2 :set background=dark<CR>:colorscheme solarized<CR>:AirlineTheme solarized<CR>
map <leader>3 :set background=dark<CR>:colorscheme codedark<CR>:AirlineTheme dark_minimal<CR>
map <leader>4 :set background=dark<CR>:colorscheme palenight<CR>:AirlineTheme dark_minimal<CR>
map <leader>5 :set background=dark<CR>:colorscheme gruvbox<CR>:AirlineTheme dark_minimal<CR>
map <leader>6 :set background=light<CR>:colorscheme one<CR>:AirlineTheme light<CR>
map <leader>7 :set background=dark<CR>:colorscheme one<CR>:AirlineTheme onedark<CR>

" -------------------------------------------------------------------------------------------------------
" AUTO CLOSE TAGS
" -------------------------------------------------------------------------------------------------------
let g:closetag_filenames='*.html,*.xhtml,*.phtml,*.php'

" -------------------------------------------------------------------------------------------------------
" AUTO COMMANDS
" -------------------------------------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.html set filetype=php

" -------------------------------------------------------------------------------------------------------
" MAPPING
" -------------------------------------------------------------------------------------------------------
"This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

" Change font size
nmap <C-ScrollWheelUp> :execute "GuiFont! " . substitute(GuiFont, ':h\(\d\+\)', '\=":h" . (submatch(1) + 1)', '')<CR>
nmap <C-ScrollWheelDown> :execute "GuiFont! " . substitute(GuiFont, ':h\(\d\+\)', '\=":h" . (submatch(1) - 1)', '')<CR>

" Toggle Folding
inoremap <F12> <C-O>za
nnoremap <F12> za
onoremap <F12> <C-C>za
vnoremap <F12> zf

" Clear folding
inoremap <S-F12> <C-O>zE
nnoremap <S-F12> zE
vnoremap <S-F12> <C-C>zE

" Map Tab and Shift Tab
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Map Tab and Shift Tab
inoremap <C-a> <Esc>ggVG
nnoremap <C-a> ggVG
vnoremap <C-a> <Esc>ggVG

" Move current line
nnoremap <C-Up> :<C-u>silent! move-2<CR>==
nnoremap <C-Down> :<C-u>silent! move+<CR>==
xnoremap <C-Up> :<C-u>silent! '<,'>move-2<CR>gv=gv
xnoremap <C-Down> :<C-u>silent! '<,'>move'>+<CR>gv=gv

" Better switching windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" nnoremap <C-Tab> <C-w>w

" Use alt + k/j/l/h to re
nnoremap <silent> <M-k> :resize -2<CR>
nnoremap <silent> <M-j> :resize +2<CR>
nnoremap <silent> <M-l> :vertical resize -2<CR>
nnoremap <silent> <M-h> :vertical resize +2<CR>

" Alternate way to save
nnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <Esc>:w<CR>
vnoremap <silent> <C-s> <Esc>:w<CR>

" Edit and load vimrc
nmap <leader>e :e $MYVIMRC<CR>
xmap <leader>e :e $MYVIMRC<CR>
nmap <leader>s :so $MYVIMRC<CR>
xmap <leader>s :so $MYVIMRC<CR>

" New tab
nmap <leader>n :tabnew<CR>
xmap <leader>n :tabnew<CR>

" Map for fzf
nnoremap <silent> <F2> :Files<CR>
nnoremap <silent> <F3> :Buffers<CR>

" Toggle WordWrap
nnoremap <silent> <M-z> :set nowrap!<CR>

" -------------------------------------------------------------------------------------------------------
" Remove all trailing whitespace by pressing \t {trim}
" Replace all non-breaking space character with normal space
" -------------------------------------------------------------------------------------------------------
nnoremap <Leader>t :let _s=@/<Bar>:%s/\s\+$//e<Bar>:%s/\r/\r/g<Bar>:%s/\%u00a0/ /g<Bar>:let @/=_s<Bar><CR>
