set number
syntax enable
set laststatus=2
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
filetype plugin indent on
set ignorecase
set smartcase
set hlsearch
set wrap
set mouse=a
set clipboard^=unnamed,unnamedplus
nnoremap <C-b> :NERDTreeToggle<CR>
let g:coccglobal_extensions = ['coc-tsserver', 'coc-java', 'coc-json', 'coc-pyright', 'coc-php', 'coc-vetur', 'coc-snippets', 'coc-prettier' ]

call plug#begin('~/.vim/plugged')

" NERDTree - File explorer
Plug 'preservim/nerdtree'

" Fugitive - Git integration
Plug 'tpope/vim-fugitive'

" Vim-ALE - Linting
Plug 'dense-analysis/ale'

" plugin for intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'mattn/emmet-vim'
Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jcherven/jummidark.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'jremmen/vim-ripgrep'
"Plug 'ryanoasis/vim-devicons'
Plug 'metakirby5/codi.vim'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'APZelos/blamer.nvim'
Plug 'vim-python/python-syntax'       " Better Python highlighting
Plug 'jupyter-vim/jupyter-vim'        " Jupyter Notebook integration
Plug 'posva/vim-vue'                  " Vue.js syntax and file detection
Plug 'pangloss/vim-javascript'        " JS syntax
Plug 'maxmellon/vim-jsx-pretty'       " JSX/TSX highlighting
Plug 'StanAngeloff/php.vim'           " PHP improved syntax
Plug 'jiangmiao/auto-pairs'
Plug 'kdheepak/lazygit.nvim'
" Add more plugins here
" run :PlugInstall in vim normal mode

call plug#end()

colorscheme OceanicNext
set encoding=UTF-8
"set guifont= 'Users/saad/Downloads/cousine.ttf'
map <C-j> :m +1<CR>
map <C-k> :m -2<CR>
nmap <C-c>   <Plug>NERDCommenterToggle
vmap <C-c>   <Plug>NERDCommenterToggle<CR>gv
imap <C-c>   <Esc><Plug>NERDCommenterTogglei
nnoremap <C-f> :Rg<CR> 
vnoremap <C-f> :Rg<CR> 
inoremap <C-f> <Esc>:Rg<CR> 
imap <C-s> <Esc>:w<CR>
nmap <C-s> :w<CR>
vmap <C-s> :w<CR>
imap <C-q> <Esc>:q<CR>
nmap <C-q> :q<CR>

imap <C-g> <Esc>:!Lazygit<CR>
nmap <C-g> :!Lazygit<CR>
vmap <C-g> :!lazygit<CR>


" Map CtrlP to Ctrl + P
nmap <C-p> :Files<CR>
imap <C-p> <Esc>:Files<CR>
vmap <C-p> :Files<CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif

" Enable insert mode completion
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()

" refreshes NERDTree on tab changes
nnoremap <silent> <C-w><C-w> :wincmd w<CR>:NERDTreeRefresh<CR>
" Enable ALE
let g:ale_enabled = 1

" Automatically show error messages
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_set_highlights = 1
" Enable fix on save globally
let g:ale_fix_on_save = 1

" Enable TypeScript support
let g:ale_javascript_typescript_eslint_executable = 'eslint'
autocmd FileType javascript,json let b:ale_fix_on_save = 1


let g:blamer_enabled = 1
let g:blamer_template = '<author>, <summary>'
let g:blamer_show_in_insert_modes = 0
let g:blamer_delay = 500
