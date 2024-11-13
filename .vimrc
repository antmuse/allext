"Antmuse's vim config, version 1.2.0.0
"Email: antmuse@live.cn
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 一般设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Windows Vim启动后自动最大化窗口
"au GUIEnter * simalt ~x

"设置宽度不明的文字(如 “”①②→ )为双宽度文本
set ambiwidth=double

"高亮光标所在行（我选择不改变前景和背景色，只加了一条下划线）
"set cursorline
"hi cursorline guibg=NONE gui=underline

set tags=./.tags;,.tags

" if isdirectory('.git') && filereadable('.proj.vim')
if filereadable('.proj.vim')
    "set path+=./app/include
    source ./.proj.vim
endif

" 设定默认解码
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
set nobomb

" 显示中文帮助，中文帮助需自已安装好
set helplang=cn

" 设定颜色方案和字体
colorscheme desert
if has("win32")
    set guifont=Consolas:h14
    set guifontset=Micosoft\ Yahei:h14
    "set guifontset=微软雅黑:h14
    " 与windows共享剪贴板
    set clipboard+=unnamed
elseif has("unix")
    set guifont=Monospace\ Regular\ 14
    set guifontset=Monospace\ Regular\ 14
    " 与linux共享剪贴板
    set clipboard+=unnamed
endif

" 用浅色高亮当前行
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

" 显示行号
set nu

"自动设置目录为正在编辑的文件所在的目录
" set autochdir

" 不要使用vi的键盘模式，而是vim自己的
set nocompatible

" history文件中需要记录的行数
set history=100

" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 侦测文件类型
filetype on

" 为特定文件类型载入相关缩进文件
filetype indent on

" 载入文件类型插件/filetype plugin on后set completeopt才会有效(智能补全)
filetype plugin on
set completeopt=longest,menu

" 保存全局变量
set viminfo+=!

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" 语法高亮
syntax on

" 高亮字符，让其不受100列限制
:highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
:match OverLength '\%256v.*'

" 状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Green
highlight StatusLineNC guifg=Gray guibg=White

" 自动保存加载视图
set sessionoptions=buffers,curdir,resize,folds,tabpages
" au VimEnter * call EnterHandler()
" au VimLeave * call LeaveHandler()
" function! LeaveHandler()
"     exec "mks! ~/vimfiles/session.vim"
" endfunction
" function! EnterHandler()
"     exe "source ~/vimfiles/session.vim"
" endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 不要备份文件（根据自己需要取舍）
set nobackup

" 不要生成swap文件，当buffer被丢弃的时候隐藏它
set noswapfile
set bufhidden=hide

" 字符间插入的像素行数目
set linespace=0

" 增强模式中的命令行自动完成操作
set wildmenu

" 在状态行上显示光标所在位置的行号和列号
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)

" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=1

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2

" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0

" 不让vim发出讨厌的滴滴声
set noerrorbells

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索和匹配
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=5

" 在搜索的时候忽略大小写
"set ignorecase

" 是否高亮被搜索的内容
"set nohlsearch
set hlsearch

" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch

" 输入:set list命令是应该显示些啥？
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

" 不要闪烁
set novisualbell

" 我的状态行显示的内容（包括文件类型和解码）
set statusline=[%F%m%r%h%w]\ [%{&ff}-%Y]\ [%l,%v=%p%%]\ [%{strftime(\"%y/%m/%d-%H:%M\")}]

" 总是显示状态行
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文本格式和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动格式化
set formatoptions=tcrqn

" 继承前一行的缩进方式，特别适用于多行注释
set autoindent

" 为C程序提供自动缩进
set smartindent

" 使用C样式的缩进
set cindent

"设置自动缩进
set ai!

" 制表符为4
set tabstop=4

" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" 用空格代替制表符
"set noexpandtab
set expandtab

" 不要换行
set nowrap

" 在行和段开始处使用制表符
set smarttab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" echodoc设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode
let g:echodoc_enable_at_startup = 1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-taglist的设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 单击就跳转到定义处
let Tlist_Use_SingleClick=1

" 如果taglist是最后一个窗口，则退出vim
let Tlist_Exist_OnlyWindow=1

" 只显示一个文件的taglist
let Tlist_Show_One_File=1

let Tlist_WinWidth=32

" 按照名称排序
let Tlist_Sort_Type = "name"

" 在右侧显示窗口
let Tlist_Use_Right_Window = 1

" 压缩方式
let Tlist_Compart_Format = 1

" 不要关闭其他文件的tags
let Tlist_File_Fold_Auto_Close = 1

" 不要显示折叠树
let Tlist_Enable_Fold_Column = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
    "设置cscope二进制可执行文件的绝对路径
    set csprg=/usr/bin/cscope
    "优先搜索cscope的符号文件
    set csto=0
    "使用:cstag命令代替:tag/ctrl-]/vim -t等命令，如果vim加载了cscope的数据库
    ":cstag命令实际执行的是"cs find g”
    set cst 
    "不打印cscope所产生的额外信息，也就是在加载cscope数据库时不打印冗余的log
    set nocsverb
    "加载当前路径的cscope数据库文件
    if filereadable("cscope.out")
        cs add cscope.out
        "如果cscope.out不存在于当前路径，加载环境变量CSCOPE_DB指定路径的cscope符号数据库
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    "恢复csverb的初始值
    set csverb
endif


" 只在下列文件类型被侦测到的时候显示行号，普通文本文件不显示
if has("autocmd")
    autocmd FileType xml,html,c,cs,java,perl,shell,bash,cpp,python,vim,php,ruby,ini,pose set number
    autocmd FileType xml,html vmap <C-o> <ESC>'<i<!--<ESC>o<ESC>'>o-->
    autocmd FileType java,c,cpp,cs vmap <C-o> <ESC>'<o
    autocmd FileType html,text,php,vim,c,java,xml,bash,shell,perl,python,pose setlocal textwidth=100
    "autocmd Filetype html,xml source $VIMRUNTIME/../vimfiles/plugin/closetag.vim
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
endif " has("autocmd")


" 高亮显示普通pose文件（需要pose.vim脚本）
au BufNewFile,BufRead *.pose set ft=pose


" 用空格键来开关折叠
set foldenable
set foldmethod=manual
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>


" Buffer的位置和大小
"winpos 300 100
"set lines=28
"set columns=90

" 因为设定为不换行，所以要显示底部滚动条，不显示左右滚动条和工具栏及菜单
set guioptions+=b
set guioptions-=r
set guioptions-=l
set guioptions-=T
set guioptions-=m

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-plug设定https://github.com/junegunn/vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:plug_window=
" Specify a directory for plugins
call plug#begin('~/.vim/vplugin')

" https://github.com/ludovicchabant/vim-gutentags
" call pathogen#helptags()
Plug 'ludovicchabant/vim-gutentags'

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'Valloric/YouCompleteMe', { 'do': 'python3 ./install.py --all' }

Plug 'esukram/vim-taglist'

" Plug 'vim-clang-format'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'Shougo/echodoc.vim'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin vim-gutentags设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
" let g:gutentags_project_root = ['.git', '.svn', '.root', '.gitignore', '.project']
let g:gutentags_project_root = ['.proj.vim', '.root']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.vim/cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.vim/cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" let g:gutentags_ctags_extra_args += ['--c++-kinds=+cdefghlmnpstuvxzLANU']
" let g:gutentags_ctags_extra_args += ['--c-kinds=+defghlmpstuvxzL']
" let g:gutentags_ctags_extra_args += ['--python-kinds=+cfmvIixzl']

" 禁用 gutentags 自动加载 gtags 数据库的行为
" let g:gutentags_auto_add_gtags_cscope = 0

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快捷键设置 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F5编译和运行C程序，F6编译和运行C++程序
" 请注意，下述代码在windows下使用会报错
" 需要去掉./这两个字符
" C的编译和运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    exec "!gcc % -o %<"
    exec "! ./%<"
endfunc


" C++的编译和运行
map <F6> :call CompileRunGpp()<CR>
func! CompileRunGpp()
    exec "w"
    exec "!g++ % -o %<"
    exec "! ./%<"
endfunc


" save session
map <F1> :call AppSaveSession()<CR>
func!  AppSaveSession()
    exec "mks! ~/.vim/session.vim"
endfunc

" load session
map <F2> :call AppLoadSession()<CR>
func!  AppLoadSession()
    exe "source ~/.vim/session.vim"
endfunc

noremap <F3> :NERDTreeToggle<CR>
noremap <F4> :TlistToggle<CR>
noremap <F8> :!ctags -f ./.tags -R .<CR>
noremap <F9> :!cscope -bkqR<CR>

map  <C-K><C-F> :py3f /usr/share/vim/addons/syntax/clang-format.py<CR>
imap <C-K><C-F> :py3f /usr/share/vim/addons/syntax/clang-format.py<CR>

