if exists('g:GuiLoaded')
    " Disable gui popupmenu
    if exists(':GuiPopupmenu') == 2
        GuiPopupmenu 0
    endif

    " Disbale gui tabline
    if exists(':GuiTabline') == 2
        GuiTabline 0
    endif
endif