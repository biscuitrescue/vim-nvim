"" Karttikeya's config

set encoding=UTF-8
set ignorecase
set smartcase
set laststatus=2
set number
set shiftwidth=4
set tabstop=4
set guifont=M\ Plus\ 1\ Code\ Medium:h13
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
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set linebreak
set wrap

syntax on
nnoremap <leader>t :below 10sp term://$SHELL<cr>i
" hit <Escape> key to exit from terminal mode
:tnoremap <Esc> <C-\><C-n>

" use current file directory as a start to find file to edit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
" credits to:
" https://stackoverflow.com/a/1708936

" it is ok to wrap lines, just use gj or gk to move
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wrap
fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i
let g:python_highlight_all = 1

" console.log hot key: type cll
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" insert mode, puts focus inside parentheses
imap cll console.log()<Esc><S-f>(a
" from visual mode on next line, puts visual selection inside parentheses
vmap cll yocll<Esc>p
" from normal mode, wraps word under cursor
nmap cll yiwocll<Esc>p
" credits to:
" https://gist.github.com/jasongonzales23/6189da1d82ee05a91edfd53403d6941d

" cycle buffers

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NEOVIDE
let g:neovide_cursor_vfx_mode="torpedo"
let g:neovide_transparency=0.85
let g:neovide_fullscreen=v:false


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:nnoremap gb :bnext<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

source ~/.config/nvim/plugins.vim


lua << END
require('lualine').setup{
options = { 
  theme = 'auto',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    }
}

-- require("bufferline").setup{}
require('rose-pine').setup({
    dark_variant='moon'
})

require("catppuccin").setup {
    flavour = "latte"
}

END

colorscheme catppuccin
" hi Normal ctermbg=NONE guibg=NONE
