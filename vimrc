"    ______                  ____  _
"   |__  / |__   __ _  ___  | __ )(_)_ __
"     / /| '_ \ / _` |/ _ \ |  _ \| | '_ \
"    / /_| | | | (_| | (_)  | |_) | | | | |
"   /____|_| |_|\__,_|\___/ |____/|_|_| |_|

"   __     __  ___   __  __   ____     ____
"   \ \   / / |_ _| |  \/  | |  _ \   / ___|
"    \ \ / /   | |  | |\/| | | |_) | | |
"     \ V /    | |  | |  | | |  _ <  | |___
"      \_/    |___| |_|  |_| |_| \_\  \____|

" Author: https://github.com/zhao1-1
" ------------------------------------------
" figlet ZhaoBin-VIMRC
" Call figlet
noremap tx :r !figlet 
" -------------------------------------------

" ------------------
" ===Editor Setup===
" ------------------
" echom "Welcome to my world ~(>^.^<)~"

" ===
" === Main code Display
" ===
" 设置<LEADER>为空格键
let mapleader="\<space>"
" 代码高亮--开
syntax on
" 打开行号
set number
" 以当前行号为起点，上下计算行号
"set norelativenumber
" 当前光标位置显示一条线
set cursorline
" 字不会超出当前窗口，会自动换行
set wrap
" 输入任何字符，在vim右下角会提示显示该字符
set showcmd
" 在vim：进入指令模式下，会tab帮你自动补全
set wildmenu



" ===
" === Systm
" ===
" 让vim配置保存后立刻生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 大部分插件需要的配置
set nocompatible
" 自动检测文件类型
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
" 让vim可以使用鼠标
set mouse=a
" 指定编码
set encoding=utf-8


" 终端跑vim配色不对，加此项可修复
let &t_ut=''
" tab键代表缩进长度为2
" set noexpandtab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
" set autoindent
" 显示行尾空格
set list
set listchars=tab:\|\ ,trail:▫
" 滚屏的时候上下始终留5行
set scrolloff=5
" 设置缩进
set tw=0
set indentexpr=
" 回退到行首的时候再回退至行尾
set backspace=indent,eol,start
" 代码折叠方式
set foldmethod=indent
set foldlevel=99
" json 格式化
"com! FormatJSON %!python3 -m json.tool
" Cursor shape（vim三种不同模式下光标不同样式）
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" 设置下边状态栏为2
set laststatus=2
" 在当前文件目录下执行命令
set autochdir
" 打开vim，光标会停留在上次关闭时候的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif



" ===
" === 全局键位替换
" ===
noremap s <nop>
" noremap j k
" noremap k j
" 多行，多列移动
noremap H 8h
noremap L 8l
noremap J 10j
noremap K 10k
" $ key: go to the start of the line
noremap $ 0
" 0 key: go to the end of the line
noremap 0 $
" 对调; :两个键位
noremap ; :
noremap : ;
" Join lines
noremap <C-j> J
" Help
noremap <C-k> K
" {  } 变成了[]，[代表段首，]代表段尾
"noremap { [
"noremap } ]
"noremap [ {
"noremap ] }
" 保存、退出、生效文件
noremap <LEADER>s :w<CR>
noremap <LEADER>q :q<CR>
noremap <LEADER>r :source $MYVIMRC<CR>
" Open your ~/.vim/vimrc File
nnoremap <LEADER>mv :set splitright<CR>:vsplit $MYVIMRC<CR>
" 在Insert模式下，按两下j键，相当于<Esc>，并且光标回到最初编辑位置
inoremap jj <Esc>`^
" 在Insert模式下，Ctrl+a，移动光标至行首
inoremap <C-a> <Esc>I
" 在Insert模式下，Ctrl+e，移动光标至行尾
inoremap <C-e> <Esc>A
" 在Insert模式下，Ctrl+u，删除或剪切光标之前的所有内容；
inoremap <C-u> <Esc>ld0I
" 在Insert模式下，Ctrl+k，删除或剪切光标之后的所有内容；
inoremap <C-k> <Esc>ld$A
" 在Insert模式下，Ctrl+y，粘贴ctrl+u或ctrl+K剪切的内容
inoremap <C-y> <Esc>pa
" 在visual模式下，取消按u和U转换大小写，而是跟Normal一样，用~键转换大小写
vnoremap u <nop>
vnoremap U <nop>
" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <ESC>/<++><CR>:nohlsearch<CR>c4l


" ===
" === Search Set
" ===
" 高亮搜索结果
set hlsearch
" 启动的时候不要高亮, 如果不设置这个，vim会自动记住你上次高亮情况
exec "nohlsearch"
" 在搜索中，边输入边高亮
set incsearch
" 搜索的时候忽略大小写
set ignorecase
" 搜索时候智能大小写
set smartcase
" 搜索时候用“n”/“N”前往下一条/上一条，并且移动至屏幕中央
noremap n nzz
noremap N Nzz
" 取消搜索高亮
noremap <LEADER><CR> :nohlsearch<CR>


" ===
" === Splite Window
" ===
" 向右分屏，并且光标放在右边；
noremap sr :set splitright<CR>:vsplit<CR>
" 向左分屏，并且光标在左边；
noremap sl :set nosplitright<CR>:vsplit<CR>
" 向上分屏，并且光标在上边；
noremap su :set nosplitbelow<CR>:split<CR>
" 向下分屏，并且光标在下边;
noremap sd :set splitbelow<CR>:split<CR>

" 分屏方向切换
noremap sv <C-w>t<C-w>H
noremap sh <C-w>t<C-w>K

" use <LEADER>+h/j/k/l switch window
noremap <LEADER>h <C-w>h
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k
noremap <LEADER>l <C-w>l

" 调整分屏各窗口的尺寸大小
noremap <LEADER><up> :res +5<CR>
noremap <LEADER><down> :res -5<CR>
noremap <LEADER><left> :vertical resize-5<CR>
noremap <LEADER><right> :vertical resize+5<CR>


" ===
" === Buffer
" ===
" 切换Buffer
"nnoremap <silent> [b :bprevious<CR>
"nnoremap <silent> [n :bnext<CR>


" ===
" === Tabs
" ===
" 打开新的标签页
noremap ta :tabe<CR>
" 移动到左边的标签页
noremap t- :-tabnext<CR>
" 移动到右边的标签页
noremap t= :+tabnext<CR>



" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s





" ===
" === Plug
" ===

call plug#begin('~/.vim/plugged')

" This plugin provides a start screen for Vim and Neovim.
Plug 'mhinz/vim-startify'

" The statusline is the colored line at the bottom
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'bling/vim-bufferline'
" Plug 'liuchengxu/space-vim-theme'

" Colorscheme
Plug 'connorholyday/vim-snazzy'
Plug 'w0ng/vim-hybrid'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'

" Add indent line especially in Python.
Plug 'Yggdroot/indentLine'

" File manager and navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'ctrlpvim/ctrlp.vim'      "Search and Navigation

" Fuzzy Search by fzf.vim
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" find and replace text through multiple files
"Plug 'brooth/far.vim'

" quick Move in current screen page
Plug 'easymotion/vim-easymotion'

" language is all about "surroundings": parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.
Plug 'tpope/vim-surround'

" Golang
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }      代码补全、重构、跳转、自动格式化、自动导入等功能

" Python
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Taglist  代码大纲（browse the tags of the current file and get an overview of its structure）
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Word highlighting and navigation throught out the buffer.
" * Highlight with <Leader>k
" * Navigate highlighted words with n and N
" * Clear every word highlight with <Leader>K throughout the buffer
Plug 'lfv89/vim-interestingwords'

" Auto Complete
"Plug 'Valloric/YouCompleteMe'

" Code Format  代码格式化
Plug 'sbdchd/neoformat'

" Error checking  静态检查
Plug 'w0rp/ale'

" Comment Code by Useing 'gcc' to comment code and 'gcgc' to cancel all code when you in NormalMode,And Using 'gc' to comment or cancel code when you in VisualMode.
Plug 'tpope/vim-commentary'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" Undo Tree
Plug 'mbbill/undotree/'

" Other visual enhancement
"Plug 'itchyny/vim-cursorword'

" Markdown
Plug 'iamcco/markdown-preview.nvim'
", { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Other useful utilities
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim' " distraction free writing mode
Plug 'godlygeek/tabular' " in command mode, type ';Tabularize /=' to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip

" Chinese Input Fuck
Plug 'lyokha/vim-xkbswitch'

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'fadein/vim-FIGlet'

call plug#end()


" ===
" === ColorScheme
" ===
"let g:SnazzyTransparent = 1
set background=dark
colorscheme gruvbox

" ===
" === Yggdroot/indentLine
" ===
let g:indentLine_char = '|'
let g:indentLine_color_term = 238
let g:indentLine_color_gui = '#333333'
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig


" ===
" === NERDTree
" ===
noremap gn :NERDTreeToggle<CR>
let NERDTreeShowHidden=1    "show hidden file
let NERDTreeMapToggleHidden = "zh"
"let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = "N"
"let NERDTreeMapUpdirKeepOpen = "n"
"let NERDTreeMapOpenSplit = ""
"let NERDTreeOpenVSplit = "I"
"let NERDTreeMapActivateNode = "i"
"let NERDTreeMapOpenInTab = "o"
"let NERDTreeMapOpenInTabSilent = "O"
"let NERDTreeMapPreview = ""
"let NERDTreeMapCloseDir = ""
"let NERDTreeMapChangeRoot = "l"
"let NERDTreeMapMenu = ","


" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


" ==
" == ctrlp
" ==
"let g:ctrlp_map = '<C-p>'


" ==
" == easymotion
" ==
nmap ff <Plug>(easymotion-s2)


" ==
" == vim-surround
" ==
" type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
" ys iw '     （you add a surrounding ' in a word）
" ys ip )     （you add a surrounding ) in paragraph）
" cs ) ]      （change a surrounding from () to []）
" cs } >      （change a surrounding from {} to <>）
" ds '         ( delete a surrounding '')



" ==
" == fzf.vim
" ==
" Ag[Pattern]：模糊搜索字符串
" Files[Path]：模糊搜索目录


" ==
" == pthon-mode
" ==
"let g:pymode_python = 'python3'
"let g:pymode_trim_whitespaces = 1
"let g:pymode_options_max_line_length = 120


"" ===
"" === YouCompleteME
"" ===
"nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap g/ :YcmCompleter GetDoc<CR>
"nnoremap gt :YcmCompleter GetType<CR>
"nnoremap gr :YcmCompleter GoToReferences<CR>
"let g:ycm_autoclose_preview_window_after_completion=0
"let g:ycm_autoclose_preview_window_after_insertion=1
"let g:ycm_use_clangd = 0
"let g:ycm_python_interpreter_path = "/bin/python3"
"let g:ycm_python_binary_path = "/bin/python3"


" ===
" === ale
" ===
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']


"" ===
"" === Taglist
"" ===
noremap <silent> <LEADER>t :TagbarOpenAutoClose<CR>
" nnoremap <LEADER>t :TagbarToggle<CR>


" ===
" === MarkdownPreview
" ===
" let g:mkdp_auto_start = 0
" let g:mkdp_auto_close = 1
" let g:mkdp_refresh_slow = 0
" let g:mkdp_command_for_global = 0
" let g:mkdp_open_to_the_world = 0
" let g:mkdp_open_ip = ''
" let g:mkdp_browser = 'Safari'     " 选择打开的浏览器
" let g:mkdp_echo_preview_url = 0
" let g:mkdp_browserfunc = ''
" let g:mkdp_preview_options = {
"     \ 'mkit': {},
"     \ 'katex': {},
"     \ 'uml': {},
"     \ 'maid': {},
"     \ 'disable_sync_scroll': 0,
"     \ 'sync_scroll_type': 'middle',
"     \ 'hide_yaml_meta': 1
"     \ }
" let g:mkdp_markdown_css = ''
" let g:mkdp_highlight_css = ''
" let g:mkdp_port = ''
" let g:mkdp_page_title = '「${name}」'
" let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]


" ===
" === vim-table-mode
" ===
noremap <LEADER>T :TableModeToggle<CR>

" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0


" ===
" === Goyo 极简格式写作
" ===
noremap <LEADER>gy :Goyo<CR>


" ===
" === vim-signature 给文件添加书签
" ===
"let g:SignatureMap = {
"         \ 'Leader'             :  "m",
"         \ 'PlaceNextMark'      :  "m,",
"         \ 'ToggleMarkAtLine'   :  "m.",
"         \ 'PurgeMarksAtLine'   :  "dm-",
"         \ 'DeleteMark'         :  "dm",
"         \ 'PurgeMarks'         :  "dm/",
"         \ 'PurgeMarkers'       :  "dm?",
"         \ 'GotoNextLineAlpha'  :  "m<LEADER>",
"         \ 'GotoPrevLineAlpha'  :  "",
"         \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
"         \ 'GotoPrevSpotAlpha'  :  "",
"         \ 'GotoNextLineByPos'  :  "",
"         \ 'GotoPrevLineByPos'  :  "",
"         \ 'GotoNextSpotByPos'  :  "mn",
"         \ 'GotoPrevSpotByPos'  :  "mp",
"         \ 'GotoNextMarker'     :  "",
"         \ 'GotoPrevMarker'     :  "",
"         \ 'GotoNextMarkerAny'  :  "",
"         \ 'GotoPrevMarkerAny'  :  "",
"         \ 'ListLocalMarks'     :  "m/",
"         \ 'ListLocalMarkers'   :  "m?"
"         \ }


" ===
" === Undotree 文件版本历史
" ===
noremap ty :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 0

" ===
" === xkbswitch
" ===
let g:XkbSwitchEnabled = 1


" ===
" === Compile function
" ===
  noremap ss :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc


" ___   _
"|_ _| | |    _____   _____  __      ____  ____  __
" | |  | |   / _ \ \ / / _ \ \ \ /\ / /\ \/ /\ \/ /
" | |  | |__| (_) \ V /  __/  \ V  V /  >  <  >  <
"|___| |_____\___/ \_/ \___|   \_/\_/  /_/\_\/_/\_\


