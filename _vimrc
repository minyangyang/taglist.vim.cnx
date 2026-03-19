"=========================================================================
" DesCRiption: 适合自己使用的vimrc文件，for Linux/Windows, GUI/Console
" Last Change: 2010-03-21 10:48:32 Asins - asinsimple AT gmail DOT com
" Author:      Assins - asinsimple AT gmail DOT com
"              Get latest vimrc from http://nootn.com/blog/Tool/22/
"			   http://amix.dk/vim/vimrc.html
" Version:     2015-7-29
"=========================================================================
set nocompatible            " 关闭 vi 兼容模式
colorscheme desert			" 设定配色方案
filetype plugin indent on   " 开启插件
syntax on                   " 自动语法高亮
set number                  " 显示行号,按扩展名设定行号见下面
"set cursorline              " 突出显示当前行
set ruler                   " 打开状态栏标尺
set autochdir               " 自动切换当前目录为当前文件所在的目录
set autoread				" 文件在外部修改后自动读取
set history=999				" 设定曾经使用过的命令保存行数，默认是20
set nobackup                " 覆盖文件时不备份
set backupcopy=yes          " 设置备份时的行为为覆盖
set confirm					" 在处理未保存或只读文件的时候，弹出确认
"set textwidth=78
"set linebreak
"set breakat-=-
set ignorecase				" 搜索时忽略大小写
set smartcase				" 但有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
set t_vb=                   " 置空错误铃声的终端代码
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4               " 设定 tab 长度为 4
set magic                   " 设置魔术
set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2             " 短暂跳转到匹配括号的时间（单位是十分之一秒）
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由vim负责保存
set smartindent             " 开启新行时使用智能自动缩进
set backspace=indent,eol,start
                            " 不设定的话在插入状态无法用退格键和Delete键删除回车符
set shortmess=atI			" 关闭打开时显示的信息
" 普通模式下按p粘贴时，默认使用系统剪切板，用 :reg 查看剪切板内容
" 如是 + 则 set clipboard=unnamedplus. " 如是 * 则 set clipboard=unnamed.
" set clipboard=unnamed
set foldclose=all           " 光标离开时自动关闭折叠
setl nofoldenable           " 关闭折叠	" set foldenable  启用折叠
setl foldmethod=syntax		" 设置代码折叠方式为 indent,syntax,marker,
setl foldcolumn=0           " 设置折叠区域的宽度
setl foldlevel=9			" 设置折叠层数为
setl foldexpr=2				" 设置代码块折叠后显示的行数

nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                            " 用空格键来开关折叠
"折叠相关的快捷键	"zR 打开所有的折叠	"zc 折叠
"zo 展开折叠	"zO 对所在范围内所有嵌套的折叠点展开
"[z 到当前打开的折叠的开始处。	"]z 到当前打开的折叠的末尾处。
"zj 向下移动。到达下一个折叠的开始处。关闭的折叠也被计入。
"zk 向上移动到前一折叠的结束处。关闭的折叠也被计入。

autocmd! BufNewFile,BufRead * setlocal nofoldenable 
							" 新建的文件，刚打开的文件不折叠

" 设置折叠层数
"nmap <leader>f1 :set foldlevel=1<CR>
"nmap <leader>f2 :set foldlevel=2<CR>
"nmap <leader>f3 :set foldlevel=3<CR>


"-----------------------------------------------------------------
" "一壹甲⒈①⑴" 设置在状态行显示的信息
"-----------------------------------------------------------------
set cmdheight=2					" 设定命令行的行数为
set laststatus=2				" 显示状态栏 (默认值为 1,不显示状态栏)
set statusline =\ %<%F[%1*%M%*%n%R%H]%=\ %y\%0(%{&fileformat}\[%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\%c:%l/%L%) " 设置在状态行显示的信息

" 用处不大，在状态栏后显示笑脸，出错显示苦逼脸。
" if filereadable(expand("$Home/vimfiles/plugin/vimbuddy.vim"))
	" set statusline+=\ %{VimBuddy()} " vim buddy
" endif

"-----------------------------------------------------------------
" "二贰乙⒉②⑵"	图形界面设定
"-----------------------------------------------------------------
if has("gui_running")			" 有图形界面时
	"set guioptions-=m			" 隐藏菜单栏
	set guioptions-=T			" 隐藏工具栏
	set guioptions-=L			" 隐藏左侧滚动条
	"set guioptions-=r			" 隐藏右侧滚动条
	"set guioptions-=b			" 隐藏底部滚动条
	"set showtabline=0			" 隐藏Tab栏
	autocmd GUIEnter * winpos  60 0
	set	lines=99 columns=90		" 设定GUI高度宽度
else							" 没有图形界面时
	set fillchars=vert:\ ,stl:\ ,stlnc:\
							" 在被分割的窗口间显示空白，便于阅读
endif

let mapleader=","|let g:mapleader=","|	" 设置leader为,

"-----------------------------------------------------------------
" 设定doc目录,可以由PLUG目录vimdoc设定中文帮助
"-----------------------------------------------------------------
"新插件没有帮助标签时 :helptags ~/.vim/doc 生成帮助标签

let helptags = $vimfiles.'/doc'		
if version >= 6.03|set helplang=cn|endif

" 用户目录,编辑vim配置文件,修改保存后自动更新
if has("win32") || has("win64") || has("win95") || has("win16")
	set fileformats=dos,unix,mac
    nmap <Leader>ev :tabnew $HOME/_vimrc<CR>
    let $VIMFILES = $HOME.'/vimfiles'
	autocmd! bufwritepost vimrc source $HOME./_vimrc
	let Tlist_Ctags_Cmd =  $Home.'/bin/ctags.exe' "设ctags所在目录
elseif has("unix")
    set fileformats=unix,dos,mac
    nmap <Leader>ev :tabnew $HOME/.vimrc<CR>
    let $VIMFILES = $HOME.'/.vim'
	autocmd! bufwritepost vimrc source $HOME/.vimrc
	let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif

" 配置多语言环境
if has("multi_byte")
    " UTF-8 编码
    set encoding=utf-8  termencoding=utf-8
    set formatoptions+=mM		"正确处理中文字符的折行和拼接
    set fencs=ucs-bom,utf-8,cp936| ",gb2312,gb18030,big5,euc-jp,euc-kr,latinl
	"中文字体的设置需要用到中文请务必保证vimrc的编码是gbk格式
	"set guifont=Fixedsys,Courier_new,Lucida Console:h:大小:i斜体:b黑体:cANSI

	"可用gfw单独设置中文，分开设中英文字体的代码如下:
	"set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI gfw=幼圆:h10.5:cGB2312
	"细明体（还行）,要完整显示字体需要安装unicode6.0,第二个是宋体
	set gfn=MingLiU:h14:w6:b,MinLiu-ExtB:h14:w6:b,MinLiu_HKSCS-ExtB:h14:w6:b
	" set gfn=Kingsoft_Phonetic:h14
	" set gfw=Sun-ExtA:h12:b,Sun-ExtB:h12:b
	" set gfn=YaHei\ Consolas\ Hybrid:h10.5

	if has("win32")
		source $VIMRUNTIME/delmenu.vim
        language messages zh_CN.utf-8
		source $VIMRUNTIME/menu.vim
		set langmenu=zh_cn.utf-8
    endif
" 设双字节前可能要设定字体，不然会重罢为单字节
	if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
		set ambiwidth=double
    endif
else
	echoerr "抱歉, 此版 (g)vim 编译时未 +multi_byte"
endif

" 能够漂亮地显示.NFO文件
function! SetFileEncodings(encodings)
	let b:myfileencodingsbak=&fileencodings
	let &fileencodings=a:encodings
endfunction
function! RestoreFileEncodings()
	let &fileencodings=b:myfileencodingsbak
	unlet b:myfileencodingsbak
endfunction
au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
au BufReadPost *.nfo call RestoreFileEncodings()
" 打开srt、txt文件高亮
au BufNewFile,BufRead *.srt setf srt
au BufNewFile,BufRead *.txt set filetype=txt

"-----------------------------------------------------------------
" "三叁丙⒊③⑶"	常用功能快捷键设定 
"-----------------------------------------------------------------
nmap <silent> <leader>/ :noh<CR>|		" 临时关闭高亮搜索
" Buffers操作快捷方式!
nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>

" 关于tab的快捷键
nnoremap <C-TAB> :tabnext<CR>
nnoremap <C-S-TAB> :tabprev<CR>
" map tn :tabnext<CR>|map tp :tabprevious<CR>
map te :tabedit<CR>|map tc :tabclose<CR>

" 关于窗口的快捷键
map wn :new<CR>|map wc :close<CR>
map wk <C-W>K|map wj <C-W>J
map wh <C-W>H|map wl <C-W>L
map <leader>wv <C-W>v|map <leader>ws <C-W>s

" 窗口分割时,进行切换的按键热键需要连接两次
" 切换的时候会变得非常方便.
map <C-j> <C-W>j|map <C-k> <C-W>k
map <C-h> <C-W>h|map <C-l> <C-W>l

" 一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
nmap <leader>1 :set filetype=xhtml<CR>
nmap <leader>2 :set filetype=css<CR>
nmap <leader>3 :set filetype=javascript<CR>
nmap <leader>4 :set filetype=php<CR>
nmap <leader>5 :set filetype=python<CR>
nmap <leader>0 :set filetype=txt<CR>

" 更改文件格式中的回车符
nmap <leader>fd :set fileformat=dos<CR>
nmap <leader>fu :set fileformat=unix<CR>

" 更改文件编码为utf-8格式并保存
nmap <leader>utf :set fileencoding=utf-8<CR>:w<CR>


"-----------------------------------------------------------------
" "四肆丁⒋④⑷"	常用插件设定 
"-----------------------------------------------------------------

"-----------------------------------------------------------------
" plugin - bufexplorer.vim Buffers切换
" \be 全屏方式查看全部打开的文件列表
" \bv 左右方式查看   \bs 上下方式查看
"-----------------------------------------------------------------

"-----------------------------------------------------------------
" plugin - NERD_commenter.vim   注释代码用的，
" <leader>ca 在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
" <leader>cs 以”性感”的方式注释
" <leader>cA 在当前行尾添加注释符，并进入Insert模式
" [count],cc:光标以下count行逐行添加注释(7,cc)
" [count],cu:光标以下count行逐行取消注释(7,cu)
" [count],cm:光标以下count行尝试添加块注释(7,cm)
" 注：count参数可选，无则默认为选中行或当前行
"-----------------------------------------------------------------
let NERDMenuMode = 2		" 默认时菜单显示在plugin下，2时为顶级目录。
let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看

"-----------------------------------------------------------------
" plugin - NERD_tree.vim 以树状方式浏览系统中的文件和目录
" :ERDtree 打开NERD_tree         :NERDtreeClose    关闭NERD_tree
" o 打开关闭文件或者目录         t 在标签页中打开
" T 在后台标签页中打开           ! 执行此文件
" p 到上层目录                   P 到根目录
" K 到第一个节点                 J 到最后一个节点
" u 打开上层目录                 m 显示文件系统菜单（添加、删除、移动操作）
" r 递归刷新当前目录             R 递归刷新当前根目录
"-----------------------------------------------------------------
" <F3> NERDTree 切换 PS:用得少还是删了吧，不然打开VIM会很慢。
" map <F3> :NERDTreeToggle<CR>|imap <F3> <ESC>:NERDTreeToggle<CR>

"-----------------------------------------------------------------
" plugin - tagbar.vim/taglist  查看函数列表，需要ctags程序
" F8 打开隐藏的taglist窗口 / F9 打开隐藏tagbar窗口
"-----------------------------------------------------------------
if filereadable(expand("$Home/vimfiles/plugin/taglist.vim"))
	nnoremap <silent> <F8> :TlistToggle<CR>
	"let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
	let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
	let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 
	"let Tlist_Compact_Format = 1	
	let Tlist_JS_Settings = 'javascript;s:string;a:array;o:object;f:function;m:member;'			" 让vim的Taglist插件支持高亮显示Javascript源代码中的关键词。
	"let Tlist_Show_Menu = 1
endif
" if filereadable(expand("$Home/vimfiles/plugin/tagbar.vim"))
	" nnoremap <silent> <F9> :TagbarToggle<CR>
	" highlight TagbarScope guifg=Green ctermfg=Green
	" let g:tagbar_expand = 1
	" let g:tagbar_foldlevel = 2
	" let g:tagbar_autoshowtag = 1
" endif

"-----------------------------------------------------------------
" 让 TOhtml 产生有 CSS 语法的 html
" syntax/2html.vim，可以用:runtime! syntax/2html.vim
let html_use_css=1
"-----------------------------------------------------------------

"-----------------------------------------------------------------
" plugin - checksyntax.vim    JavaScript常见语法错误检查
" 默认快捷方式为 F5
"-----------------------------------------------------------------
" let g:checksyntax_auto = 0 " 不自动检查

"-----------------------------------------------------------------
" 启用全能补全 (omni completion)
"-----------------------------------------------------------------
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

"-----------------------------------------------------------------
" javascript 语法设置 ~/.vim/syntax/javascript.vim
"-----------------------------------------------------------------

" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1

"-----------------------------------------------------------------
" 优化javascript代码
"-----------------------------------------------------------------
nmap <leader>js :call g:Jsbeautify()<CR>

"-----------------------------------------------------------------
" "禁止载入的插件
"-----------------------------------------------------------------
let g:loaded_vimballPlugin= 1
let g:loaded_vimball      = 1
let g:GetLatestVimScripts_allowautoinstall= 0 "下载插件后自动安装。
let g:fencview_autodetect = 0   "关闭自动识别文件编码（在$path有iconv.dll才能开启）

let g:vimim_toggle = 'wubi,pinyin'
"let g:vimim_cloud = 'baidu,sogou,qq,google'
"let g:vimim_map = ''
"let g:vimim_mode = 'dynamic'
"let g:vimim_mycloud = 0
"let g:vimim_plugin = '\vimfiles\plugin'
"let g:vimim_punctuation = 2
"let g:vimim_shuangpin = 0

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"-----------------------------------------------------------------
" "五伍戊⒌⑤⑸"	次常用快捷键设定 
"-----------------------------------------------------------------
" 简繁互换
" vnoremap <c-t> :Tcn<CR>
vnoremap <c-s> :Scn<CR> 
" 在命令行中输入两条命令,可用"|"隔开。
" normal命令须用execute来执行，见下面例子。
nnoremap <c-s> :exe "normal ggVG<c-s>"<CR>

" 一些方便的文本替换操作
nmap <leader>dm :%s///g<CR>|					" 删除文件中的^M(CTRL+v,松开v,按m)字符
nmap <leader>dbs :%s/[ \t\r]\+$//g<CR>|			" 删除所有行未尾空格
nmap <leader>del :g/^\s*$/d<CR>|				" 删除包含有空格组成的空行
nmap <leader>dms :%s/ {1,}/ /g<CR>|				" 将多个空格换成一个空格
nmap <leader>sfu :%s/^\(.\)/\U\1/g<CR>|			" 句首字母大写
"nmap <F12> :g/^$/d|		 				     " 删除没有内容的空行
"nmap <F12> :g/^[ |\t]*$/d|					     " 除以空格或tab开头到结尾的空行
"nmap <F12> :%s/\n//g|						" 删除所有换行符
" :s/\(\w\+\)\s\+\(\w\+\)/\2\t\1|			" 将 data1 data2 修改为 data2 data1
" :%s/\(\w\+\), \(\w\+\)/\2 \1/|			" 将 Doe, John 修改为 John Doe
" :%s/\<id\>/\=line(".")|					" 将各行的 id 字符串替换为行号
" :%s/\(^\<\w\+\>\)/\=(line(".")-10) .".". submatch(1)
		" 将每行开头的单词替换为(行号-10).单词的格式,如第11行的word替换成1. word
	"let g:vimim_ctrl6_toggle=1	
    "let g:vimim_insertmode_toggle=1
    let g:vimim_smart_space_key=1	
	" 补全弹出菜单主题2 
	highlight! PmenuSbar  NONE
	highlight! PmenuThumb NONE
	highlight! Pmenu      guibg=darkcyan
	highlight! link PmenuSel NonText
nmap tw ea<C-X><C-U><C-N><C-P>
imap tw <esc>ea<C-X><C-U><C-N><C-P>
  
" =========================================================================
" "五伍戊⒌⑤⑸"  "六陆己⒍⑥⑹" "七柒庚⒎⑦⑺" "八捌辛⒏⑧⑻" "九玖壬⒐⑨⑼"
" =========================================================================
