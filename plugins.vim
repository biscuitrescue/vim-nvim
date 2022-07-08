" vim-plug start
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.nvim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Vimjas/vim-python-pep8-indent'  
Plug 'majutsushi/tagbar' 
Plug 'w0rp/ale'  
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mattn/emmet-vim'
Plug 'davidhalter/jedi-vim'
Plug 'roxma/nvim-yarp'  " dependency of ncm2
Plug 'ncm2/ncm2'  " awesome autocomplete plugin
Plug 'ncm2/ncm2-bufword'  " buffer keyword completion
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-clang'

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

Plug 'Shougo/deoplete.nvim'
Plug 'sudar/vim-arduino-syntax'
Plug 'nikvdp/neomux'
Plug 'vim-jp/vim-cpp'
Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/auto-pairs-gentle'
Plug 'tpope/vim-commentary'
Plug 'mileszs/ack.vim'

" THEMES

Plug 'drewtempelmeyer/palenight.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'romgrk/doom-one.vim'
Plug 'NTBBloodbath/doom-one.nvim'

Plug 'zah/nim.vim'
Plug 'vim-python/python-syntax'
Plug 'lilydjwg/colorizer' 
Plug 'myusuf3/numbers.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'neovim/nvim-lspconfig', { 'tag': 'v0.1.3' }

call plug#end()


