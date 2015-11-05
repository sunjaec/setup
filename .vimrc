set nocompatible              " be iMproved, required
filetype off                  " required
set nu
set ruler
set modeline
syntax on
set gfn=Menlo:h13
set background=dark
let mapleader = "\<Space>"
nmap <leader>nt :NERDTreeToggle<cr>
nmap <leader>sc :SyntasticCheck<cr>
nmap <F8> :TagbarToggle<CR>
nmap <leader>comp :NeoCompleteToggle<cr>
nmap <leader>rbp :RainbowParenthesesToggle<cr>

" Use pbcopy to copy selections to clipboard!!!
vmap <C-x> :!pbcopy<CR>  
vmap <C-c> :w !pbcopy<CR><CR> 
" Or we can do this
" set clipboard=unnamed

let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let $GOROOT='/usr/local/go'
let g:solarized_termcolors=256
set noswapfile

set novisualbell
set noerrorbells
set ignorecase
set ts=4
set sts=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set cursorline
set showmatch
let python_highlight_all = 1

" Shortcut to rapidly toggle `set list`
nmap <leader>sw :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'vladh/tagbar'
" Editing
"
Plugin 'rking/ag.vim'                  " Fast search
Plugin 'easymotion/vim-easymotion'     " Easy motion
Plugin 'scrooloose/nerdcommenter'      " Easy commenting
Plugin 'terryma/vim-multiple-cursors'  " Sublime-like multi-cursor editing
Plugin 'bling/vim-airline'             " Status line 
Plugin 'altercation/vim-colors-solarized'  " Solarized color scheme
Plugin 'flazz/vim-colorschemes'        " Color scheme collection
Plugin 'scrooloose/syntastic'          " Various syntax checkers
" Project
"
Plugin 'scrooloose/nerdtree.git'    " File explorer
Plugin 'kien/ctrlp.vim'             " Fuzzy file search
Plugin 'tpope/vim-fugitive'         " Git integration

" Completions
"
Plugin 'ervandew/supertab'          " Use  <tab> for completitions
Plugin 'Shougo/neocomplete.vim'     " Completion engine
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'

" Python plugins
"
Plugin 'davidhalter/jedi-vim'       " Plugin for Jedi which provides python autocompletion

" Clojure plugins 
"
Plugin 'guns/vim-clojure-static'    " Clojure syntax
Plugin 'tpope/vim-fireplace'        " REPL integration
Plugin 'venantius/vim-cljfmt'
Plugin 'kien/rainbow_parentheses.vim'

call vundle#end()            " required
filetype plugin indent on    " required

if has('gui_running')
    colorscheme solarized
else
    colorscheme solarized
endif


" Recommended syntastic config.
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0 
let g:syntastic_check_on_wq = 0

" Set the current working directory to NERDTree root, and have CtrlP use cwd
" to search
"
let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'

let g:neocomplete#enable_at_startup = 1
let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

autocmd FileType gitcommit set tw=120

autocmd Filetype go nnoremap K :GoDoc<cr>
autocmd Filetype go nnoremap <leader>d :GoDef<cr>
autocmd Filetype go nnoremap <leader>L :GoLint<cr>

autocmd Filetype cpp nnoremap <leader>d :CSearchContext -a edit<cr>
autocmd Filetype cpp nnoremap <leader>h :CCallHierarchy<cr>

autocmd Filetype java nnoremap <leader>d :JavaSearchContext -a edit<cr>
autocmd Filetype java nnoremap <leader>th :JavaHierarchy<cr>
autocmd Filetype java nnoremap <leader>ch :JavaCallHierarchy<cr>
