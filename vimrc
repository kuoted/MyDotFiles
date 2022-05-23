"-----------------------------------------------------------------------------------
" 文件检测
"-----------------------------------------------------------------------------------
"filetype on "文件类型检测功能
"filetype indent on  " 针对不同的文件类型采用不同的缩进格式
"filetype plugin on " 针对不同的文件类型加载对应的插件
filetype plugin indent on " 三合一的写法
 
"-----------------------------------------------------------------------------------
" vim-plug
"-----------------------------------------------------------------------------------
"call plug#begin('$Vim_HOME\plugged') " vim-plug存放在自定义的目录plugged
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/winmanager'
Plug 'preservim/nerdcommenter'
Plug 'Shougo/neocomplete'
"Plug 'luochen1990/rainbow'

Plug 'esukram/vim-taglist'
Plug 'othree/xml.vim'
"Plug 'vim-scripts/peaksea'
 
"三个snippet的插件同时安装 supertab 用来防止使用 tab 展开 snippet 与 youcompleteme 的 tab 补全发生冲突
Plug 'ervandew/supertab'  
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'jlanzarotta/bufexplorer'

" add by Ted 
Plug 'tomasr/molokai'
" Plug 'nanotech/jellybeans.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()




"-----------------------------------------------------------------------------------
"
"-----------------------------------------------------------------------------------

"-----------------------------------------------------------------------------------
"
"-----------------------------------------------------------------------------------
"-----------------------------------------------------------------------------------
" 指定vim使用的python dll的位置
"-----------------------------------------------------------------------------------
 
 
"-----------------------------------------------------------------------------------
" 使用配色方案
"-----------------------------------------------------------------------------------
colorscheme molokai 
"-----------------------------------------------------------------------------------
" 一般设置
"-----------------------------------------------------------------------------------
set nu "显示行号
syntax on "开启语法高亮
" set fdm=syntax
set guifont=courier_new:h18  "使用字体
set ruler "显示光标当前位置
set history=100 "历史命令保存行数
set autoread "当文件被外部改变时自动读取
set tags=./tags,tags
 
 
"取消自动备份及产生swp文件
set nobackup
set nowb
set noswapfile
set cursorline   "高亮光标所在行
"set novisualbell  "取消光标闪烁
set laststatus=2  "总是显示状态行
set showcmd  "状态栏显示当前执行的命令
set cmdheight=1   "设置命令行高度为3
set paste   "粘贴时保持格式
set showmatch  "高亮显示匹配的括号
set ignorecase "在搜索的时候忽略大小写
set hlsearch "高亮被搜索的句子
set incsearch "在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set autoindent "继承前一行的缩进方式，特别适用于多行注释
set smartindent "为C程序提供自动缩进
set cindent  "使用C样式的缩进
 
set tabstop=2  "制表符为2
"统一缩进为2
set softtabstop=2
set shiftwidth=2
set expandtab
 
set nowrap  "取消换行
set shortmess=atI "启动的时候不显示那个援助索马里儿童的提示
 
"在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
set scrolloff=3 "光标移动到buffer的顶部和底部时保持3行距离, 或set so=3
 
"设定默认解码
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
"设定编码
"set enc=utf-8
set fileencodings=ucs-bom,utf-8,chinese
"set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8
set cursorline "突出显示当前行
 
"启用鼠标
" set mouse=a
" set mouse-=a
set selection=exclusive
set selectmode=mouse,key
set laststatus=2  "显示状态栏
set ruler  "显示光标当前位置
set guioptions+=m   "菜单栏
set guioptions+=T  "工具栏
set nocp "关闭vi模式
set nocompatible "vim在工作的时候不需要考虑和vi兼容
set clipboard+=unnamed  "与windows共享剪贴板
 
"-----------------------------------------------------------------------------------
" Settings for winManager
"-----------------------------------------------------------------------------------
let &titlestring = expand("%:p") 
if &term == "screen" 
   "set t_ts=^[k 
   "set t_fs=^[\ 
endif 
if &term == "screen" || &term == "xterm" 
   set title 
endif 

"-----------------------------------------------------------------------------------
" Settings for winManager
"-----------------------------------------------------------------------------------
let g:winManagerWindowLayout='FileExplorer|TagList'  "设置界面分割
let g:winManagerWidth = 30   "设置winmanager的宽度，默认为25 
nmap <f2> :WMToggle<cr> "快捷键
 
"-----------------------------------------------------------------------------------
" Settings for NerdTree
"-----------------------------------------------------------------------------------
""map <f2> :NERDTreeToggle<cr>  ""将F2设置为开关NERDTree的快捷键
""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeWinPos='left'  ""窗口位置
let g:NERDTreeSize=30  ""窗口尺寸
let g:NERDTreeShowLineNumbers=1  ""窗口是否显示行号
let g:NERDTreeHidden=0  ""不显示隐藏文件
"-----------------------------------------------------------------------------------
" Settings for tagslist
"-----------------------------------------------------------------------------------
let Tlist_Ctags_Cmd = 'ctags'   "环境变量要将ctags.exe的目录加入path
let Tlist_Show_One_File = 1        "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1      "如果taglist窗口是最后一个窗口，则退出vim\窗口
let Tlist_Auto_Open = 0  "没反应
let Tlist_Use_Right_Window = 0 "让taglist窗口出现在Vim的右边边,选0出现在左边
let Tlist_File_Fold_Auto_Close = 1 "当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。
"let Tlist_Sort_Type =’name’  "Tag的排序规则，以名字排序。默认是以在文件中出现的顺序排序
let Tlist_GainFocus_On_ToggleOpen = 0  "Taglist窗口打开时，立刻切换为有焦点状态
"let Tlist_WinWidth = 32  "设置窗体宽度为32，可以根据自己喜好设置
let Tlist_Use_SingleClick=1  "设置单击tag就跳到tag定义的位置
"nmap <F8> :TlistToggle<CR> "热键设置
noremap <silent> <F9> :TlistToggle<cr>
" nmap <F9> <Esc>:!ctags -R *<CR>  "生成一个tags文件
let Tlist_Show_Menu = 0 "菜单栏出现tags,可以选择sort by name 或 order可以 reflash menu,基本没有什么用
" noremap <silent> <F8> :TlistToggle<CR>
"-----------------------------------------------------------------------------------
" Settings for UltiSnips
"-----------------------------------------------------------------------------------
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsSnippetDirectories = ['mysnippets','UltiSnips']
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"-----------------------------------------------------------------------------------
" Settings for NERD Commenter
"-----------------------------------------------------------------------------------
" 默认情况下，在注释分隔符后添加空格
let g:NERDSpaceDelims = 1
" 对美化的多行注释使用压缩语法(貌似这个没什么卵用)
let g:NERDCompactSexyComs = 1
 
" 按行对齐注释分隔符左对齐，而不是按代码缩进
let g:NERDDefaultAlign = 'left'
" 默认情况下，将语言设置为使用其备用分隔符（不是很明白所以忽略）
let g:NERDAltDelims_java = 1
 
" 添加您自己的自定义格式或覆盖默认格式（你懂的）
let g:NERDCustomDelimiters = { 'php': { 'left': '/*','right': '*/' },'html': { 'left': '<!--','right': '-->' },'py': { 'left': '#' },'sh': { 'left': '#' } }
" 允许注释和反转空行（在注释区域时很有用） （没亲测）
let g:NERDCommentEmptyLines = 1
 
" 取消注释时启用尾随空白的修剪
let g:NERDTrimTrailingWhitespace = 1
" 启用nerdcommenttoggle检查是否对所有选定行进行了注释
let g:NERDToggleCheckAllLines = 1
 
"" leader默认是\ 
"" \cc 注释当前行和选中行
"" \cn 没有发现和\cc有区别
"" \c<空格> 如果被选区域有部分被注释，则对被选区域执行取消注释操作，其它情况执行反转注释操作
"" \cm 对被选区域用一对注释符进行注释，前面的注释对每一行都会添加注释
"" \ci 执行反转注释操作，选中区域注释部分取消注释，非注释部分添加注释
"" \cs 添加性感的注释，代码开头介绍部分通常使用该注释
"" \cy 添加注释，并复制被添加注释的部分
"" \c$ 注释当前光标到改行结尾的内容
"" \cA 跳转到该行结尾添加注释，并进入编辑模式
"" \ca 转换注释的方式，比如： /**/和//
"" \cl \cb 左对齐和左右对其，左右对其主要针对/**/
"" \cu 取消注释
 
 
 
 
"-----------------------------------------------------------------------------------
" Settings for neocomplete
"-----------------------------------------------------------------------------------
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
 
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
 
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1
 
" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1
 
" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
 
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
 
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
 
 
"-----------------------------------------------------------------------------------
" Settings for ctrlpvim/ctrlp.vim
"-----------------------------------------------------------------------------------
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
"-----------------------------------------------------------------------------------
" Settings for Vim-Rainbow
"-----------------------------------------------------------------------------------

" let g:rainbow_conf = {
" \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
" \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
" \   'operators': '_,\|+\|-_',
" \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
" \   'separately': {
" \       '*': {},
" \       'tex': {
" \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
" \       },
" \       'css': 0,
" \   }
" \}
 
"-----------------------------------------------------------------------------------
" 配置vim-airline
"-----------------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_modified=1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'
"let g:airline#extensions#tabline#formatter = 'default'
 
"-----------------------------------------------------------------------------------
" End
"-----------------------------------------------------------------------------------

