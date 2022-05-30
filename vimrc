"This handles plugins to install
source ~/.vim/plug.vim

"COC recommended settings
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Prettier format (not sure it's needed)
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Hint colour
function! CocHighlight() 
  highlight CocHintFloat ctermfg=LightGreen
endfunction
autocmd VimEnter function CocHighlight()

"julien's minimum stuff
""syntax off
set syntax=on
let mapleader = "\<Space>"
set nocp nu hid ssl sm wmnu noerrorbells visualbell t_vb="" ch=2 ls=0 so=2 wim=longest,list,full mouse=a mousemodel=extend
set autoread
set noautochdir
set clipboard=unnamed
"runtime macros/matchit.vim
" let g:netrw_cursorline=0
let g:netrw_liststyle=3

" CTRL+w saves file
nnoremap <C-w> :update<cr>
inoremap <C-w> <Esc>:update<cr>
" Touchbar hack
noremap § <ESC>
inoremap § <ESC>
" Next center
nnoremap n nzz
nnoremap N Nzz
" Folding
set foldmethod=indent
set nofoldenable
" https://www.sitepoint.com/getting-started-vim/
set encoding=utf-8
set showcmd                     " display incomplete commands
" Whitespace
set list
set listchars=""                      " reset
set listchars=tab:→\ 
set listchars+=trail:·
set nowrap                      " don't wrap lines
filetype plugin indent on
set tabstop=2 shiftwidth=2 expandtab     " a tab is two spaces (or set this to 4)
set backspace=indent,eol,start  " backspace through everything in insert mode
set autoindent
"let g:html_indent_inctags = "html,body,head,tbody,svg,g,defs,path,rect"
set noshiftround
"split behaviour
set splitbelow
set splitright
"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
" clear searched text on enter
nnoremap <silent> <CR> :noh<CR><CR>
" set t_Co=256
set background=dark
colorscheme hybrid 
" coc highlight (must come after colorscheme)
highlight CocHintFloat ctermfg=LightGreen
highlight CocHintSign ctermfg=LightGreen
" coc recognize postcss as css for autocomplete
let g:coc_filetype_map = {
  \ 'postcss': 'css',
  \ }
" always display statusline
set laststatus=2
let g:eleline_powerline_fonts = 1
"Emmet
"let g:user_emmet_leader_key=','
"let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
"vimrc helpers
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>ep :vsplit $VIMPLUG<cr>
nnorema <leader>sv :source $MYVIMRC<cr>
"split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"pretty print json
nnoremap <leader>j :%!python -m json.tool<cr>
"search files
nnoremap <leader>p :Files<cr>
nnoremap <leader>f :Find 
"move lines ALT-j and ALT-k"
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv 
vnoremap ˚ :m '<-2<CR>gv=gv 

""inoremap >> ><Esc>?<[a-z]<CR>lyiwh/[^%]><CR>la</<C-r>"><Esc>:noh<CR><Esc>F<i
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Remove trailing whitespace from .js files"
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre *.js* :call <SID>StripTrailingWhitespaces()
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Automatically create dir if missing when saving file
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir)
          \   && (a:force
          \       || input("'" . a:dir . "' does not exist. Create? [y/N]") =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END

" Set syntax for .postcss file
augroup PostCSS
  au!
  autocmd BufNewFile,BufRead *.postcss set syntax=postcss filetype=postcss
  autocmd BufNewFile,BufRead *.css set syntax=postcss filetype=postcss
  autocmd FileType css,postcss setlocal iskeyword+=-
augroup END
""Execute js file
nnoremap <leader><leader> :w !node <cr>

" COC settings
" source ~/.vim/coc.vim
