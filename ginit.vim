if exists('g:GuiLoaded')
	
	" Set default font
	GuiFont! agave Nerd Font:h12

	" Change font size
	nmap <F11> :execute "GuiFont! " . substitute(GuiFont, ':h\(\d\+\)', '\=":h" . (submatch(1) - 1)', '')<CR>
	nmap <C-ScrollWheelDown> :execute "GuiFont! " . substitute(GuiFont, ':h\(\d\+\)', '\=":h" . (submatch(1) - 1)', '')<CR>
	nmap <S-F11> :execute "GuiFont! " . substitute(GuiFont, ':h\(\d\+\)', '\=":h" . (submatch(1) + 1)', '')<CR>
	nmap <C-ScrollWheelUp> :execute "GuiFont! " . substitute(GuiFont, ':h\(\d\+\)', '\=":h" . (submatch(1) + 1)', '')<CR>

	" Windows fast switch only in gui
	nnoremap <C-Tab> <C-w>w

	" Disable gui popupmenu
    if exists(':GuiPopupmenu') == 2
        GuiPopupmenu 0
    endif

    " Disable gui tabline
    if exists(':GuiTabline') == 2
        GuiTabline 0
    endif
endif
