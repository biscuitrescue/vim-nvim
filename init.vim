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

command! -nargs=0 Prettier :CocCommand prettier.formatFile
map <C-t> :set nosplitright<CR>:TagbarToggle<CR>:set splitright<CR>
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :vsplit <C-R>=expand("%:p:h") . "/" <CR>

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

" ncm2 settings {{{
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert
" make it FAST
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1,1]]
let g:ncm2#matcher = 'substrfuzzy'

let g:deoplete#sources#clang#libclang_path="/usr/lib/libclang.so"
let g:deoplete#sources#clang#clang_header="/usr/lib/clang"

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

" ale options {{{
let g:ale_python_flake8_options = '--ignore=E129,E501,E302,E265,E241,E305,E402,W503'
let g:ale_python_pylint_options = '-j 0 --max-line-length=120'
let g:ale_list_window_size = 4
let g:ale_sign_column_always = 0
let g:ale_open_list = 1
let g:ale_keep_list_window_open = '1'
let g:ale_sign_error = '‼'
let g:ale_sign_warning = '∙'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = '0'
let g:ale_lint_on_save = '1'
let g:ale_linters = {
      \ 'cpp': ['clang'],
      \ 'c': ['clang']
      \}
nmap <silent> <C-M> <Plug>(ale_previous_wrap)
nmap <silent> <C-m> <Plug>(ale_next_wrap)


" COC configuration {{{
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-python',
  \ ]

let g:coc_snippet_next = '<tab>'
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


lua << END
require'nvim-tree'.setup {}
END

lua << END
require('lualine').setup{
options = { 
    theme = 'auto',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    }
}

require("bufferline").setup{}

END

" hi Normal ctermbg=NONE guibg=NONE

let g:catppuccin_flavour = "mocha" " latte, frappe, macchiato, mocha
colorscheme catppuccin
