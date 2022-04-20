set encoding=UTF-8
set laststatus=2
syntax on
set number
set shiftwidth=4
set tabstop=4
set guifont=operatormono\ nerd\ font:h13
set mouse=a
set clipboard+=unnamedplus
set cursorcolumn
set noshowmode
set relativenumber
set ruler

:tnoremap <Esc> <C-\><C-n>

map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>

set wrap
fun! JumpToDef()
    if exists("*GotoDefinition_" . &filetype)
        call GotoDefinition_{&filetype}()
    else
        exe "norm! \<C-]>"
    endif
endf

nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i
let g:python_highlight_all = 1

imap cll console.log()<Esc><S-f>(a
vmap cll yocll<Esc>p
nmap cll yiwocll<Esc>p

" NEOVIDE
let g:neovide_cursor_vfx_mode="torpedo"
let g:neovide_transparency=1
let g:neovide_fullscreen=v:false

:nnoremap gb :bnext<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

set termguicolors
source ~/.config/nvim/plugins.vim

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_aggregate_errors = 1
let g:syntastic_tex_checkers = ['lacheck', 'text/language_check']
let g:syntastic_python_checkers = ['pylint']
" let g:syntastic_<filetype>_checkers = ['<checker-name>']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" let g:airline_theme="palenight"
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1

" if fancy_symbols_enabled
"     let g:webdevicons_enable = 1

"     if !exists('g:airline_symbols')
"         let g:airline_symbols = {}
"     endif
"     let g:airline_left_sep = "\uE0b4"
"     let g:airline_left_alt_sep = ''
"     let g:airline_right_sep = "\uE0b6"
"     let g:airline_right_alt_sep = ''
"     let g:airline_symbols.branch = '⭠'
"     let g:airline_symbols.readonly = '⭤'
"     let g:airline_symbols.linenr = '⭡'
" else
"     let g:webdevicons_enable = 0
" endif

let g:aquarium_style="dark"
let g:lightline = {
    \ 'colorscheme': 'palenight',
     \ }

" hi Normal ctermbg=NONE guibg=NONE
colorscheme palenight
