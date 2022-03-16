
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

if fancy_symbols_enabled
    let g:webdevicons_enable = 1

    " custom airline symbols
    if !exists('g:airline_symbols')
       let g:airline_symbols = {}
    endif
    let g:airline_left_sep = "\uE0b4"
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = "\uE0b6"
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = '⭠'
    let g:airline_symbols.readonly = '⭤'
    let g:airline_symbols.linenr = '⭡'
else
    let g:webdevicons_enable = 0
