" <Leader>
let mapleader = " "

"set t_Co=256
"set termguicolors
set background=dark

"if has('patch-7.4.1778')
"  set guicolors
"endif
"if has('nvim')
"  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"endif

set laststatus=2
set nocompatible

" タブの画面上での幅
set tabstop=2
set softtabstop=2
set shiftwidth=2
" タブをスペースに展開する
set expandtab
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM 
" 行番号を非表示 (number:表示)
set number
" バックアップファイルを作成しない
set nobackup
" スワップファイルを作成しない
set noswapfile
" undoファイルを作成しない
set noundofile 
" シンタックス有効化
syntax on
" 編集中の内容を保ったまま別の画面に切り替えられるようにする
set hidden
" ヤンク/カットの保存先レジスタに*を追加(OSクリップボード)
set clipboard+=unnamed,unnamedplus
" ビジュアルモードで選択したテキストをOSクリップボードに入れる
" set clipboard+=autoselect

" Beep音抑制
set visualbell t_vb=
" デフォルトvimrc_exampleのtextwidth設定上書き(自動改行OFF)
autocmd FileType text setlocal textwidth=0

" 検索時の大文字小文字を無視
set ignorecase
set smartcase

" マウス無効
set mouse=

" カーソル行の背景色を変える
set cursorline
" カーソル位置カラムの背景色を変える
"set cursorcolumn

" Yank paste割当
nnoremap <leader>p "0p<CR>

" Yank dataをHost machineに送信する
"nnoremap <leader>y :call system('nc localhost 8377', @0)<CR>
nnoremap <leader>y :call system('pbcopy', @0)<CR>

" 追加ファイルタイプ
autocmd BufNewFile,BufRead *.as setlocal filetype=actionscript
autocmd BufNewFile,BufRead *.mxml setlocal filetype=mxml
autocmd BufRead,BufNewFile */nginx/* setlocal filetype=nginx

" *.phpファイルではタブをスペースに変換しない
autocmd BufNewFile,BufRead *.php setlocal noexpandtab 
" *.javaファイルではインデントをスペース4に設定
autocmd BufNewFile,BufRead *.java setlocal tabstop=4 softtabstop=4 shiftwidth=4

" Python3 support
let g:python3_host_prog = 'python3'

" plugin設定

" Dein
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.config/nvim/dein')
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
  let g:rc_dir    = expand('~/.config/nvim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if !has('vim_starting') && dein#check_install()
  call dein#install()
endif


" Enable filetype plugins
filetype plugin indent on
