:set nu
:set ai
:set backspace=indent,eol,start
:set showmatch
:set wildmenu
:set encoding=utf-8
:set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
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
au BufNewFile,BufRead *.h set nowrap tabstop=2 shiftwidth=2 et
au BufNewFile,BufRead *.hpp set nowrap tabstop=2 shiftwidth=2 et
au BufNewFile,BufRead *.xml set nowrap tabstop=4 shiftwidth=4 et
au BufNewFile,BufRead *.html set nowrap tabstop=4 shiftwidth=4 et
au BufNewFile,BufRead *.css set nowrap tabstop=4 shiftwidth=4 et
au BufNewFile,BufRead *.plist set nowrap tabstop=4 shiftwidth=4 et
au BufNewFile,BufRead *.java set nowrap tabstop=4 shiftwidth=4 et
au BufNewFile,BufRead *.gyp set nowrap tabstop=2 shiftwidth=2 et

" Vundle
" git clone http://github.com/gmarik/vundle.git
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'Syntastic'
Bundle 'basyura/jslint.vim'
Bundle "wookiehangover/jshint.vim"
Plugin 'vim-jp/vim-go-extra'
Plugin 'fatih/vim-go'
filetype plugin indent on

" Syntastic
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_c_check_header = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_java_javac_classpath = "/usr/local/Cellar/android-sdk/24/platforms/android-17/android.jar"

" jslint
let $JS_CMD='node'
"jslint.vimfunction! s:  autocmd BufLeave
"&lt;buffer&gt; call jslint#clear()  autocmd BufWritePost &lt;buffer&gt; call
"jslint#check()  autocmd CursorMoved  &lt;buffer&gt; call
"jslint#message()endfunctionautocmd FileType javascript call
"s:javascript_filetype_settings()

" jshint
let JSHintUpdateWriteOnly=1

" vim-go-extra
autocmd FileType go autocmd BufWritePre <buffer> Fmt

" http://qiita.com/wadako111/items/755e753677dd72d8036dより
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction
" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示
" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ
