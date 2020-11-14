"installs vimplug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Statusline
Plug 'vim-airline/vim-airline'
" Git
Plug 'tpope/vim-fugitive'

" Color themes
Plug 'w0ng/vim-hybrid'
" Plug 'fatih/vim-go', { 'tag': '*' }

" Language pack, https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'

" Svelte syntax highlighting
"Plug 'evanleck/vim-svelte'
" Plug 'leafOfTree/vim-svelte-plugin'
Plug 'burner/vim-svelte'

"linting
Plug 'w0rp/ale'
Plug 'jasonshell/vim-svg-indent'
""Plug 'vim-syntastic/syntastic'
""Plug 'mtscout6/syntastic-local-eslint.vim'

" Fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" COC intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" " Initialize plugin system
call plug#end()


