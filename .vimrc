" [Backspece] で既存の文字を削除できるように設定
"  start - 既存の文字を削除できるように設定
"  eol - 行頭で[Backspace]を使用した場合上の行と連結
"  indent - オートインデントモードでインデントを削除できるように設定
set backspace=start,eol,indent
" 特定のキーに行頭および行末の回りこみ移動を許可する設定
"  b - [Backspace]  ノーマルモード ビジュアルモード
"  s - [Space]      ノーマルモード ビジュアルモード
"   - [→]          ノーマルモード ビジュアルモード
"  [ - [←]          挿入モード 置換モード
"  ] - [→]          挿入モード 置換モード
"  ~ - ~            ノーマルモード
set whichwrap=b,s,[,],,~
" マウス機能有効化
" set mouse=a
" シンタックスハイライト有効化 (背景黒向け。白はコメントアウト
" されている設定を使用)
syntax on
highlight Normal ctermbg=black ctermfg=grey
highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray
"highlight Normal ctermbg=grey ctermfg=black
"highlight StatusLine term=none cterm=none ctermfg=grey ctermbg=black
"highlight CursorLine term=none cterm=none ctermfg=darkgray ctermbg=none
set nohlsearch " 検索キーワードをハイライトしないように設定
" カーソル行を強調表示しない
set nocursorline
" " 挿入モードの時のみ、カーソル行をハイライトする
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline
" 行番号を表示
set number
" インデント
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" ステータスラインを表示
set laststatus=2 " ステータスラインを常に表示
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] " ステータスラインの内容
" インクリメンタル検索を有効化
set incsearch
" 補完時の一覧表示機能有効化
set wildmenu wildmode=list:full
" 自動的にファイルを読み込むパスを設定 ~/.vim/userautoload/*vim
set runtimepath+=~/.vim/
runtime! userautoload/*.vim
set encoding =UTF-8 "標準文字コードをUTF-8に指定する
set hidden           "ファイル変更中でも他のファイルを開けるようにする
set autoread         "ファイル内容が変更されると自動読み込みする

" neobundle settings
if has('vim_starting')
  set nocompatible
  " neobundle をインストールしていない場合は自動インストール
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    " vim からコマンド呼び出しているだけ neobundle.vim のクローン
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  " runtimepath の追加は必須
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

" neobundle#begin - neobundle#end の間に導入するプラグインを記載します。
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }
NeoBundleLazy 'Shougo/vimshell', {
  \ 'depends' : 'Shougo/vimproc',
  \ 'autoload' : {
  \   'commands' : [{ 'name' : 'VimShell', 'complete' : 'customlist,vimshell#complete'},
  \                 'VimShellExecute', 'VimShellInteractive',
  \                 'VimShellTerminal', 'VimShellPop'],
  \   'mappings' : ['<Plug>(vimshell_switch)']
  \ }}
NeoBundle 'miyakogi/seiya.vim'
NeoBundle 'Shougo/unite.vim'
if has('lua')
	  NeoBundleLazy 'Shougo/neocomplete.vim', {
	      \ 'depends' : 'Shougo/vimproc',
	      \ 'autoload' : { 'insert' : 1,}
	      \ }
endif
NeoBundle 'Townk/vim-autoclose'
NeoBundleLazy 'tpope/vim-endwise', {
  \ 'autoload' : { 'insert' : 1,}}
NeoBundle 'basyura/TweetVim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'basyura/twibill.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'basyura/bitly.vim'
NeoBundle 'justmao945/vim-clang'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kana/vim-submode'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'altercation/vim-colors-solarized'

" vimrcに記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck
call neobundle#end()
filetype plugin indent on

" カラースキーム
" colorscheme hybrid
" 背景透過
let g:seiya_auto_enable = 1
" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \ },
      \ 'separator': {'left': '⮀', 'right': '⮂'},
      \ 'subseparator': {'left': '⮁', 'right': '⮃'}
      \ }
" neocomplete
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 2
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
" _(アンダースコア)区切りの補完を有効化
let g:neocomplete#enable_underbar_completion = 1
" ポップアップメニューで表示される候補の数
let g:neocomplete#max_list = 20
" シンタックスをキャッシュするときの最小文字長
let g:neocomplete#sources#syntax#min_keyword_length = 3
" preview window を閉じない
let g:neocomplete#enable_auto_close_preview = 0
autocmd InsertLeave * silent! pclose!
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" tweetvim
let g:tweetvim_display_source = 1
" NERDtree
let NERDTreeShowHidden=1
" vim-clang
" disable auto completion for vim-clang
let g:clang_auto = 0
" default 'longest' can not work with neocomplete
let g:clang_c_completeopt   = 'menuone'
let g:clang_cpp_completeopt = 'menuone'
if executable('clang-3.6')
    let g:clang_exec = 'clang-3.6'
elseif executable('clang-3.5')
    let g:clang_exec = 'clang-3.5'
elseif executable('clang-3.4')
    let g:clang_exec = 'clang-3.4'
else
    let g:clang_exec = 'clang'
endif
if executable('clang-format-3.6')
    let g:clang_format_exec = 'clang-format-3.6'
elseif executable('clang-format-3.5')
    let g:clang_format_exec = 'clang-format-3.5'
elseif executable('clang-format-3.4')
    let g:clang_format_exec = 'clang-format-3.4'
else
    let g:clang_exec = 'clang-format'
endif
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'

" キー設定
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')
call submode#enter_with('undo/redo', 'n', '', 'g-', 'g-')
call submode#enter_with('undo/redo', 'n', '', 'g+', 'g+')
call submode#map('undo/redo', 'n', '', '-', 'g-')
call submode#map('undo/redo', 'n', '', '+', 'g+')
inoremap jj <ESC>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	"return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
	" For no inserting <CR> key.
    return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
nnoremap split :vsplit
nnoremap twitter :TweetVimHomeTimeline
nnoremap tweet :TweetVimCommandSay
nnoremap tree :NERDTreeToggle
nnoremap tab :tabnew
nnoremap shell :VimShell
imap <F11> <nop>
set pastetoggle=<F11>

" 起動時コマンド
if has('vim_starting')
    tabnew
    normal! gt
    autocmd VimEnter * execute 'NERDTreeToggle'
endif
