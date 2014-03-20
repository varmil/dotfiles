set nocompatible               " Be iMproved

colorscheme desert
syntax on

" ビジュアルモードで選択したテキストが、クリップボードに入るようにする
" http://nanasi.jp/articles/howto/editing/clipboard.html
set clipboard=autoselect

" 無名レジスタに入るデータを、*レジスタにも入れる。
set clipboard+=unnamed
" set clipboard=unnamedplus " this is worked on Ubuntu

set number
set hlsearch
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P


 " Enable use of the mouse for all modes
 " 全モードでマウスを有効化
 set mouse=a

 " ファイル名と内容によってファイルタイプを判別し、ファイルタイププラグインを有効にする
 filetype indent plugin on

 " Better command-line completion
 " コマンドライン補完を便利に
 set wildmenu
 
 " Show partial commands in the last line of the screen
 " タイプ途中のコマンドを画面最下行に表示
 set showcmd


 " Display the cursor position on the last line of the screen or in the status
 " line of a window
 " 画面最下行にルーラーを表示する
 set ruler

 " Use case insensitive search, except when using capital letters
 " 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が
 " 混在しているときは区別する
 set ignorecase
 set smartcase
 
 " Allow backspacing over autoindent, line breaks and start of insert action
 " オートインデント、改行、インサートモード開始直後にバックスペースキーで
 " 削除できるようにする。
 set backspace=indent,eol,start
 
 " When opening a new line and no filetype-specific indenting is enabled, keep
 " the same indent as the line you're currently on. Useful for READMEs, etc.
 " オートインデント
 "set autoindent

nmap <Esc><Esc> :nohlsearch<CR><Esc>
set cursorline     " カーソル行の背景色を変える
set t_Co=256
hi CursorLine   term=reverse cterm=none ctermbg=235
hi StatusLine   ctermfg=yellow ctermbg=17 cterm=none
hi LineNr       ctermfg=gray cterm=none
set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示


" ********** TAB Setting Start **********
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

map <silent> <F5> :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> <F6> :tabclose<CR>
" tx タブを閉じる
map <silent> <f4> :tabnext<CR>
" tn 次のタブ
map <silent> <f3> :tabprevious<CR>
" tp 前のタブ
" ********** TAB Setting End **********


"--------------------------------------------------------------------------
" neobundle
"filetype off                   " Required!

"if has('vim_starting')
"  set runtimepath+=~/.vim/bundle/neobundle.vim/
"  call neobundle#rc(expand('~/.vim/bundle/'))
"endif

"netrw.vimと競合
"NeoBundle 'scrooloose/nerdtree'

"filetype plugin indent on     " Required!

"NERD_tree.vim
"---------------------
"nnoremap <f2> :NERDTreeToggle<CR>

"netrw.vim
"---------------------
 "netrwは常にtree view
 let g:netrw_liststyle = 3
 " CVSと.で始まるファイルは表示しない
 "let g:netrw_list_hide = 'CVS,\(^\|\s\s\)\zs\.\S\+'
 " 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
 let g:netrw_altv = 1
 " 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
 let g:netrw_alto = 1
 " F2キーでツリー表示
 nnoremap <f2> :Explore<CR>
