" vim-plug start
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.nvim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

let fancy_symbols_enabled = 1
Plug 'ryanoasis/vim-devicons'
let g:webdevicons_enable_nerdtree = 1
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'catppuccin',
      \ }

Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
\  'javascript' : {
\    'extends' : 'jsx',
\    'quote_char': "'",
\  },
\}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
Plug 'vim-scripts/auto-pairs-gentle'
Plug 'tpope/vim-commentary'
Plug 'mileszs/ack.vim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'zah/nim.vim'
Plug 'vim-python/python-syntax'
Plug 'lilydjwg/colorizer' 
Plug 'myusuf3/numbers.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()


