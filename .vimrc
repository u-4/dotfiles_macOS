
" ================================================================================
" setup dein
" ================================================================================

" VIM互換にしない
if &compatible
  set nocompatible
endif

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  " dein.comlは起動時にすぐ読み込むプラグイン
  call dein#load_toml(s:toml,      {'lazy': 0})
  " dein_lazy.tomlは遅延読み込みしたいプラグイン
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

" ================================================================================

"
" syntax, solarized
"

syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" ================================================================================
" General
" ================================================================================

"文字コードをUFT-8に設定
set fenc=utf-8
set encoding=utf-8
set fileencoding=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start
" インサートモードでjjは<Esc>
inoremap jj <Esc>
" 画面の端ではなく少し早くスクロール開始
" 999に設定すると常に画面の中央と同じ？
set scrolloff=3
" 左右のカーソル移動で行をまたいで移動可能にする
set whichwrap=b,s,h,l,<,>,[,],~

" ================================================================================
" Look
" ================================================================================

" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" ハイライトするのは行番号だけにする
hi clear CursorLine
" " 現在の行を強調表示（縦）
" set cursorcolumn
" カラムラインを引く
set colorcolumn=80
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化するけど鳴らさない
set visualbell t_vb=
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" 現在のモードを表示する
set showmode
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" 常にステータス行を表示
set laststatus=2
"ステータスラインに文字コードと改行文字を表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" 全角文字を崩さずに表示
set ambiwidth=double
" 全角スペースを視覚化
"hi ZenkakuSpace cterm=underline ctermfg=lightblue ctermbg=white
"match ZenkakuSpace /　/
"TAB,EOFなどを可視化する
"set list
"set listchars=tab:>-,extends:<,trail:-,eol:<


" ================================================================================
" Search
" ================================================================================

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" 検索語が画面中央に来る
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" ================================================================================
" Format
" ================================================================================




