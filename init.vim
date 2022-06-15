"" Karttikeya's config

set encoding=UTF-8
set ignorecase
set smartcase
set laststatus=2
set number
set shiftwidth=4
set tabstop=4
set guifont=jetbrainsmono\ nerd\ font:h9
set mouse=a
set clipboard+=unnamedplus
set scrolloff=3
set sidescrolloff=3
set noshowmode
set ruler
set title
set confirm
set termguicolors
set autoindent
set expandtab
set linebreak
set wrap

syntax on

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
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <leader>t :BufferLineCycleNext<CR>
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | | endif
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

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

let g:lightline = {'colorscheme': 'everblush'}


lua << END
require'nvim-tree'.setup {}
END

lua << END
require('lualine').setup{
options = { 
    theme = 'palenight',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    }
}

require("bufferline").setup{}

END

" hi Normal ctermbg=NONE guibg=NONE

let g:catppuccin_flavour = "palenight" " latte, frappe, macchiato, mocha
colorscheme palenight
