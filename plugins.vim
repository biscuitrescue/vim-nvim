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

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" let g:airline_theme='dracula'
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

Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'catppuccin',
       \ }


" Plug 'xavierd/clang_complete'
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

Plug 'frenzyexists/aquarium-vim', { 'branch': 'develop' }
let g:aquarium_style="dark"

Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'zah/nim.vim'
Plug 'vim-python/python-syntax'
Plug 'lilydjwg/colorizer' 
Plug 'myusuf3/numbers.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'PotatoesMaster/i3-vim-syntax'

call plug#end()


