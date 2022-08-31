set encoding=utf-8 "ファイル読み込み時の文字コード
scriptencoding utf-8 " Vim Script内でマルチバイトを使う場合の設定
set fileencoding=utf-8 "保存時の文字コード
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp,ucs-boms,cp932
set fileformats=unix,dos,mac

set ambiwidth=double "⬜︎や○が崩れる問題を解決
" Vim scritptにvimrcも含まれるので、日本語でコメントを書く場合は先頭にこの設定が必要になる

"文字コードをUFT-8に設定
set fenc=utf-8


"Setting=============================================
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
" タブ入力を複数の空白入力に置き換える
set expandtab
" インデント幅
set shiftwidth=4
" タブキー押下時に挿入される文字幅を指定
set softtabstop=4
" ファイル内にあるタブ文字の表示幅
set tabstop=4
" 終了時に余計な空白を削除する
autocmd BufWritePre * :%s/\s\+$//ge
" ヤンクとクリップボードを共有
set clipboard=unnamed,autoselect
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect
" カーソルの左右移動で行末から次の行への移動を可能にする
set whichwrap=b,s,h,l,<,>,[,],~


"見た目系
" 行番号を表示
set number
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に前の行の構文をチェックし次の行のインデントを増減する
set smartindent
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
set showmode
" シンタックスハイライトの有効化
syntax enable
set background=dark
syntax on
" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~
" コメントの色を水色
hi Comment ctermfg=8
" タイトルを表示
set title
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの位置を表示する

"検索系==========================================
" インクリメンタルサーチ（1文字入力ごとに検索する）
set incsearch
" 検索パターンに大文字小文字を区別しない
set ignorecase
" 検索パターンに大文字を含んでいたら大文字小文字を区別する
set smartcase
" 検索結果をハイライト
set hlsearch
" Escキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan


" マウスの有効化（カーソル移動・スクロール移動）
if has('mouse')
  set mouse=a
  if has('mouse_sgr')
    set ttymouse=sgr
  elseif v:version > 703 || v:version is 703 && has('patch632')
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif
endif


" HTML/XML閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" コマンドモードの補完
set wildmenu

"keybindings===============================
"jjでinsertモードを抜ける
inoremap <silent> jj <ESC>
"shift+h で行の先頭
noremap <S-h> ^
"shift+lで行の末尾
noremap <S-l> $
" 折り返し時に表示行単位での移動できるようにする
noremap j gj
noremap k gk

"color scheme
"colorscheme molokai
"let g:molokai_original = 1

