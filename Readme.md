# My Vim Configuration

This is a **personal Vim configuration** optimized for full-stack development.

##  Manual Install Instructions: 

1. Install VIM Plug with this command

`curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
    
2. Copy `.vimrc` file to your home directory (overwrite existing file you never edited it before).

3. Go to terminal and type `vim` and then type `:PlugInstall`. Wait for the process to complete.

4. Type `:q` `:q` (twice) to quit vim. And type `vim` in terminal again.

5. Install required plugins by `coc`, type: `:CocInstall coc-java coc-tsserver`
   
6. Install lazygit by running `brew install lazygit`

##  ⌨️ Key Bindings
1. `Ctrl + b` Toggle NERDTree file explorer

2. `Ctrl + p` Open CtrlP fuzzy file finder

3. `Ctrl + f` Search with Ripgrep

4. `Ctrl + j` Move line down

5. `Ctrl + k` Move line up

6. `Ctrl + c` Toggle comments (normal, visual, and insert modes)

7. `Ctrl + w` Switch windows and refresh NERDTree

8. `Ctrl + y` Confirm completion selection

9. `Ctrl + s` To save the document

10. `Ctrl + q` To quit the editor.

11. `Ctrl + g` To open the lazygit.
