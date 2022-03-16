set encoding=UTF-8
syntax on
set number
set tabstop=4
set guifont=operator\ mono\ medium:h13
set mouse=a
set clipboard+=unnamedplus
set cursorcolumn
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
colorscheme catppuccin
hi Normal ctermbg=NONE guibg=NONE
