## Manual Install Instructions: 

1. Install VIM Plug with this command

`curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
    
2. Copy `.vimrc` file to your home directory (overwrite existing file you never edited it before).

3. Go to terminal and type `vim` and then type `:PlugInstall`. Wait for the process to complete.

4. Type `:q` `:q` (twice) to quit vim. And type `vim` in terminal again.

5. Install required plugins by `coc`, type: `:CocInstall coc-java coc-tsserver`
