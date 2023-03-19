" vim-plug start
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.nvim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

map <C-n> :NERDTreeToggle<CR>

let fancy_symbols_enabled = 1
Plug 'ryanoasis/vim-devicons'
let g:webdevicons_enable_nerdtree = 1

" editorconfig support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'nvim-lualine/lualine.nvim'
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-clang'
Plug 'sudar/vim-arduino-syntax'
Plug 'nikvdp/neomux'
Plug 'vim-jp/vim-cpp'
" Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/auto-pairs-gentle'
Plug 'tpope/vim-commentary'

" trigger expansion with <Comma> <Comma> keys
let g:user_emmet_leader_key=','

let g:user_emmet_settings = {
\  'javascript' : {
\    'extends' : 'jsx',
\    'quote_char': "'",
\  },
\}

" awesome completion tool
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" use <Tab> key to trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ coc#refresh()

Plug 'vim-scripts/auto-pairs-gentle'

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ghifarit53/tokyonight-vim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'drewtempelmeyer/palenight.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'NTBBloodbath/doom-one.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'sainnhe/everforest'
Plug 'rose-pine/neovim', { 'as': 'rose-pine' }

set termguicolors     " enable true colors support

Plug 'zah/nim.vim'
Plug 'vim-python/python-syntax'
Plug 'lilydjwg/colorizer' 
Plug 'myusuf3/numbers.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()

