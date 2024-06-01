set number
" Enable line numbers

" Enable syntax highlighting
syntax enable

" status bar
set laststatus=2

" Enable auto-indentation and smart tab handling
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
filetype plugin indent on

" Search settings
set ignorecase
set smartcase
set hlsearch

" Enable line wrapping
set wrap

" Enable mouse support for scrolling
set mouse=a

set clipboard^=unnamed,unnamedplus
" List of plugins
"
" set ctrl +b to open file explorer
nnoremap <C-b> :NERDTreeToggle<CR>

" Enable coc.nvim
let g:coccglobal_extensions = ['coc-tsserver', 'coc-java', 'coc-json']

call plug#begin('~/.vim/plugged')

" NERDTree - File explorer
Plug 'preservim/nerdtree'

" Fugitive - Git integration
Plug 'tpope/vim-fugitive'

" CtrlP - Fuzzy file finder
"Plug 'kien/ctrlp.vim'
Plug 'ctrlpvim/ctrlp.vim'

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
Plug 'jremmen/vim-ripgrep'
"Plug 'ryanoasis/vim-devicons'
Plug 'metakirby5/codi.vim'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'APZelos/blamer.nvim'
" Add more plugins here
" run :PlugInstall in vim normal mode

call plug#end()

colorscheme OceanicNext
set encoding=UTF-8
"set guifont= 'Users/saad/Downloads/cousine.ttf'
map <C-Up> :m -2<CR>
map <C-k> :m -2<CR>
map <C-Down> :m +1<CR>
map <C-j> :m +1<CR>
nmap <C-c>   <Plug>NERDCommenterToggle
vmap <C-c>   <Plug>NERDCommenterToggle<CR>gv
imap <C-c>   <Esc><Plug>NERDCommenterTogglei

" Map CtrlP to Ctrl + P
nmap <C-p> :CtrlP .<CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
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
