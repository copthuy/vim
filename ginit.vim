if exists('g:GuiLoaded')
	GuiFont! agave Nerd Font:h12

	" Disable gui popupmenu
    if exists(':GuiPopupmenu') == 2
        GuiPopupmenu 0
    endif

    " Disable gui tabline
    if exists(':GuiTabline') == 2
        GuiTabline 0
    endif
endif
