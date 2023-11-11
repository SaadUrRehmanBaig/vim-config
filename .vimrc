" Enable line numbers
set number

" Enable syntax highlighting
syntax enable

" status bar
set laststatus=2

" Enable auto-indentation and smart tab handling
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Search settings
set ignorecase
set smartcase
set hlsearch

" Enable line wrapping
set wrap

" Enable mouse support for scrolling
set mouse=a
" List of plugins
"
" set ctrl +b to open file explorer
nnoremap <C-b> :NERDTreeToggle<CR>

" Enable coc.nvim
let g:coccglobal_extensions = ['coc-tsserver', 'coc-java']

call plug#begin('~/.vim/plugged')

" NERDTree - File explorer
Plug 'preservim/nerdtree'

" Fugitive - Git integration
Plug 'tpope/vim-fugitive'

" CtrlP - Fuzzy file finder
Plug 'kien/ctrlp.vim'

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


" CtrlP configuration
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Map CtrlP to Ctrl + P
nmap <C-P> :CtrlP<CR>

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
