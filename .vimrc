colorscheme koehler
syntax on

" ビジュアルモードで選択したテキストが、クリップボードに入るようにする
" http://nanasi.jp/articles/howto/editing/clipboard.html
" set clipboard=autoselect

" 無名レジスタに入るデータを、*レジスタにも入れる。
" set clipboard+=unnamed  //this is not worked
set clipboard=unnamedplus


set number
set hlsearch

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
set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示

