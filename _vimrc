" 非兼容模式（不兼容VI）
set nocompatible

"///////////////////////////////////////////////////////////////////////////

"Leader
let mapleader = ";"


" general config
set nocompatible
"显示行号
set number
"语法高亮
syntax on 
"
set ruler

"搜索高亮
set hlsearch
"搜索忽略大小写
set is

set backspace=indent,eol,start

"允许backspace和光标键跨越行边界
set whichwrap+=h,l

"高亮显示匹配的括号
set showmatch
"匹配括号高亮的时间
set matchtime=2


"智能补全命令行
set wildmenu

"搜索忽略大小写
set ignorecase

"不使用swapfile
set noswapfile


"设置在vim中可以使用鼠标
set mouse=a
"tab 宽度设置
set tabstop=4
set shiftwidth=4

"\t 转成空格
set expandtab
"一个\t 转换成4个空格
set softtabstop=4
"一次shift缩进的空格数
set shiftwidth=4

"与windows 共享剪贴板
set clipboard+=unnamed


"设置编码方式
set encoding=utf-8
"自动判断编码时 依次尝试一下编码
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin11

"菜单栏乱码(放在编码之后)
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"vim 提示信息乱码
language messages zh_CN.utf-8

"防止特殊符号无法正常显示
set ambiwidth=double

filetype plugin indent on


"--------------------------setting forinterface-----------------------------
"set lines and columns
set lines=35
set columns =118


" F2 for toggling menu bar and toolbar
set guioptions-=m
set guioptions-=T

"hide right and left scroll bar
set guioptions-=r
set guioptions-=L

"高亮当前行/列
set cursorline
"set cursorcolumn


map <silent> <F2> :if &guioptions=~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <Bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>




"-------------------------- colorsolarized------------------------------------------

syntax enable

set t_Co=256

if has ('gui_runing')
	set background=light
else
	set background=dark
endif


colorscheme solarized 




"-----------------------------plugin -----------------------------------------
"
set nocompatible              " be iMproved, required
filetype off                  " required

" 启用vundle来管理vim插件
set rtp+=$VIM\vimfiles\bundle\Vundle.vim
call vundle#begin('$VIM\vimfiles\bundle\')

" 安装插件写在这之后
 
set fencs=ucs-bom,utf-8,GB18030,default,latin1


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'davidhalter/jedi-vim'
Plugin 'bronson/vim-trailing-whitespace'

" Markdown 高亮
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" 安装插件写在这之前
call vundle#end()            " required
filetype plugin on    " required

" 常用命令
" :PluginList       - 查看已经安装的插件
" :PluginInstall    - 安装插件
" :PluginUpdate     - 更新插件
" :PluginSearch     - 搜索插件，例如 :PluginSearch xml就能搜到xml相关的插件
" :PluginClean      - 删除插件，把安装插件对应行删除，然后执行这个命令即可

" h: vundle         - 获取帮助

" vundle的配置到此结束，下面是我的配置



"---------------------setting for airline "----------------------------------

set t_Co=256       " Explicitly tell Vim that the terminal supports 256 colors
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1    " enable tabline
let g:airline#extensions#tabline#buffer_nr_show=1    " 显示buffer行号
let g:airline_theme="solarized"
"set ambiwidth=double    " When iTerm set double-width characters, set it



"--------------------- setting for powerline font ---------------------------
set guifont=Inconsolata-dz_for_Powerline:h11:cANSI
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '?'
let g:airline_left_sep = '?'
let g:airline_right_sep = '?'
let g:airline_right_sep = '?'
let g:airline_symbols.linenr = '?'
let g:airline_symbols.linenr = '?'
let g:airline_symbols.linenr = '?'
let g:airline_symbols.branch = '?'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'T'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
"--------------------------- End of Settings ------------------------------



"------------------------Setting for NERDTree ----------------------------
map <F3> :NERDTree<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

"-------------------------End of Setting -------------------------------


"------------------------- Setting for Syntastic -----------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
" 修复Error后，自动更新底部错误信息
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_checkers = ['clang_check','gcc']
let g:syntastic_c_checkers = ['clang_check','gcc']
let g:syntastic_python_checkers = ['pyflakes','pylint']


"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_compiler_options = '-std=c++11'

" 设置自动检查文件类型，手动检查文件类型（手动执行syntasticCheck)
let g:syntastic_mode_map = {
            \ "mode": "active",
            \ "active_filetypes": ["cpp","c","python","md"],
            \ "passive_filetypes": ["java","php","js"] }


"------------------------ Setting for jedi -----------------------------
let g:jedi#auto_initialization = 1
"补全时不进入 docstring window
autocmd FileType python setlocal completeopt-=preview
"使用space 补全
let g:jedi#completions_command = "<Space>"



"------------------------ Setting for Map ------------------------------

" 窗口切换
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <c-W><C-L>

" 消除空格
nmap <leader><space> :FixWhitespace<CR>

"移动分割线(increase)
nmap <C-I> <C-W><<>

"-----------------------  End of Setting  ------------------------------



"---------------------------setting for coding------------------------------
" 80字符限制
set colorcolumn=81


" 代码折叠
" 操作：za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠。
" 基于缩进或语法进行代码折叠
set foldmethod=indent
" set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable


" markdown 插件不自动折叠
autocmd BufNewFile,BufRead *.md set nofoldenable

"设置 IDE
"Quickly Run
""""""""""""""""""""
map <F5> :call CompileRun()<CR>

func CompileRun()
   exec "w"
   if &filetype == "python"
      exec "!python %"

   elseif &filetype == "c"
       exec "!g++ % -o %<"
       exec "! %<"

   elseif &filetype == "cpp"
       exec "!g++ % -o %<"
       exec "! %<"
   endif
endfunc

