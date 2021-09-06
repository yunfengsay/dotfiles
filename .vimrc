set shell=/bin/bash

set nu
syntax on
colorscheme desert
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set nocp
set nocompatible
set encoding=UTF-8
set history=100 
set autoread 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
source ~/.vim/cocvim.self.vim
source ~/.vim/self_define.vim
source ~/.vim/dart.vim

Plugin 'sillybun/vim-repl'
" Plugin 'maralla/completor.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround' 
" Plugin 'JamshedVesuna/vim-markdown-preview'
" Plugin 'zxqfl/tabnine-vim'

" 状态栏
Plugin 'vim-airline/vim-airline'
" 记录编程时间
" Plugin 'wakatime/vim-wakatime'
call vundle#end()   
" autocmd vimenter * NERDTree
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'dikiaap/minimalist'
Plug 'craigemery/vim-autotag'
Plug 'neovimhaskell/haskell-vim'
Plug 'hlint-refactor-vim'
" Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc-neco'
Plug 'preservim/nerdcommenter'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-jedi'
Plug 'APZelos/blamer.nvim'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
"Plug 'crusoexia/vim-monokai'

" 文档 https://github.com/APZelos/blamer.nvim
let g:blamer_enabled = 1
let g:blamer_delay = 200
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_prefix = ' '
let g:blamer_date_format = '%y-%m-%d'

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

call plug#end()

let g:lsc_auto_map = v:true

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
			\ 'name' : 'css',
			\ 'priority': 9,
			\ 'subscope_enable': 1,
			\ 'scope': ['css','scss'],
			\ 'mark': 'css',
			\ 'word_pattern': '[\w\-]+',
			\ 'complete_pattern': ':\s*',
			\ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
			\ })

" vim默认显示隐藏文件
let NERDTreeShowHidden=1

"允许使用鼠标点击定位
set mouse=ar

"允许区域选择
set selection=exclusive
set selectmode=mouse,key
"高亮光标所在行
set cursorline
"取消光标闪烁
set novisualbell

"总是显示状态行
set laststatus=2

"状态栏显示当前执行的命令
set showcmd

"标尺功能，显示当前光标所在行列号
set ruler

"设置命令行高度为1
set cmdheight=1

"粘贴时保持格式
" set paste
"高亮显示匹配的括号
set showmatch

"在搜索的时候忽略大小写
set ignorecase

"高亮被搜索的句子
set hlsearch

"在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch


"制表符为4
set tabstop=4

"统一缩进为4
set softtabstop=4
set shiftwidth=4


"继承前一行的缩进方式，特别适用于多行注释
set autoindent

"为C程序提供自动缩进
set smartindent

"使用C样式的缩进
set cindent

"允许使用退格键，或set backspace=2
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set nowrap

"启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI


"在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

"光标移动到buffer的顶部和底部时保持3行距离, 或set so=3
set scrolloff=3

"设定默认解码
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936


"设定字体
set guifont=Courier_New:h11:cANSI
set guifontwide=新宋体:h11:cGB2312

"设定编码
set enc=utf-8
set fileencodings=ucs-bom,utf-8,chinese
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"自动补全
filetype plugin indent on
set completeopt=longest,menu

"自动补全命令时候使用菜单式匹配列表
set wildmenu
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complet

" 格式化json
com! FormatJSON %!python -m json.tool

inoremap <silent><expr> <TAB>
			\ pumvisible() ? coc#_select_confirm() :
			\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

cnoremap kj <C-C>
set autoread
set nobackup
set nowb
set noswapfile
"允许区域选择
set selection=exclusive
set selectmode=mouse,key
"状态栏显示当前执行的命令
set showcmd

" 设置共享粘贴板
set clipboard=unnamed
set clipboard=unnamedplus

"统一缩进为4
set softtabstop=4
set shiftwidth=4

"高亮显示匹配的括号
set showmatch

" 设置默认展开NERDTree
autocmd StdinReadPre * let s:std_in = 1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd VimEnter * NERDTree
" wincmd w
" autocmd VimEnter * wincmd w
" autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <silent><c-s> :<c-u>update<cr>

inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-k> <Up>
inoremap <C-l> <Down>
inoremap <C-q> <PageUp>
inoremap <C-z> <PageDown>
inoremap <C-p> :Files<CR>
nmap <C-p> :Files<CR>
nmap <C-e> :Buffers<CR>
" 退出终端模式
tnoremap kj <C-\><C-n>
tnoremap <Esc> <C-\><C-n>
" 格式化代码
nmap <leader>f  <Plug>(coc-format-selected)
let g:fzf_action = { 'ctrl-e': 'edit' }

nmap <S-f> :CtrlSF<Space>

autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
" let g:typescript_indent_disable = 1
" autocmd FileType typescript :set makeprg=tsc
" let g:typescript_compiler_binary = 'tsc'
" let g:typescript_compiler_options = ''
" let g:typescript_opfirst='\%([<>=,?^%|*/&]\|\([-:+]\)\1\@!\|!=\|in\%(stanceof\)\=\>\)'

command! -nargs=0 Prettier :CocCommand prettier.formatFile

command WQ wq
command Wq wq
command W w
command Q q

function! s:GoToDefinition()
	if CocAction('jumpDefinition')
		return v:true
	endif

	let ret = execute("silent! normal \<C-]>")
	if ret =~ "Error" || ret =~ "错误"
		call searchdecl(expand('<cword>'))
	endif
endfunction

nmap <silent> gd :call <SID>GoToDefinition()<CR>
inoremap jj <ESC>
nmap <c-i> !gt


au BufNewFile,BufRead *.axml set filetype=html
