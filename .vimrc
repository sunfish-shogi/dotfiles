:set nu
:set ai
:set backspace=indent,eol,start
:set showmatch
:set wildmenu
:set encoding=utf-8
:set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
:set hlsearch
:set viminfo-=h
:set tabstop=4
:syntax on

let g:netrw_liststyle=3
let g:netrw_list_hide = 'CVS,\(^\|\s\s\)\zs\.\S\+'
let g:netrw_altv = 1
let g:netrw_alto = 1

au BufNewFile,BufRead *.js set nowrap tabstop=2 shiftwidth=2 et
au BufNewFile,BufRead *.json set nowrap tabstop=2 shiftwidth=2 et
au BufNewFile,BufRead *.c set nowrap tabstop=2 shiftwidth=2 et
au BufNewFile,BufRead *.cpp set nowrap tabstop=2 shiftwidth=2 et
au BufNewFile,BufRead *.cc set nowrap tabstop=2 shiftwidth=2 et
au BufNewFile,BufRead *.h set nowrap tabstop=2 shiftwidth=2 et
au BufNewFile,BufRead *.hpp set nowrap tabstop=2 shiftwidth=2 et
au BufNewFile,BufRead *.xml set nowrap tabstop=4 shiftwidth=4 et
au BufNewFile,BufRead *.html set nowrap tabstop=4 shiftwidth=4 et
au BufNewFile,BufRead *.css set nowrap tabstop=4 shiftwidth=4 et
au BufNewFile,BufRead *.plist set nowrap tabstop=4 shiftwidth=4 et
au BufNewFile,BufRead *.java set nowrap tabstop=4 shiftwidth=4 et
au BufNewFile,BufRead *.gyp set nowrap tabstop=2 shiftwidth=2 et
au BufNewFile,BufRead *.py set nowrap tabstop=2 shiftwidth=2 et
au BufNewFile,BufRead *.gradle set nowrap tabstop=4 shiftwidth=4 et
au BufNewFile,BufRead *.txt set nowrap tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.cmake set nowrap tabstop=4 shiftwidth=4 et
au BufNewFile,BufRead *.go set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.yml set nowrap tabstop=2 shiftwidth=2 et

" Vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Bundle 'gmarik/vundle'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'Syntastic'
Plugin 'fatih/vim-go'
call vundle#end()
filetype plugin indent on

" golang
set rtp^=$GOPATH/src/github.com/nsf/gocode/vim
autocmd FileType go autocmd BufWritePre <buffer> Fmt

" Syntastic
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_c_check_header = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_java_javac_config_file_enabled = 1
let g:syntastic_java_javac_config_file = ".syntastic_java_config"
