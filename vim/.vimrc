let g:author = "Arvin Wee"
let email = "clovery.org@gmail.com"
let $VIMHOME=$HOME.'/.vim'
"expand('<sfile>:p:h') . "/.vim"

set nocompatible

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'                " https://github.com/tomtom/tcomment_vim
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'msanders/snipmate.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'shougo/neocomplete.vim'             " https://github.com/shougo/neocomplete.vim
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'ntpeters/vim-better-whitespace'     " https://github.com/ntpeters/vim-better-whitespace

Plugin 'jdkanani/vim-material-theme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'joshdick/onedark.vim'

Plugin 'posva/vim-vue'
Plugin 'mattn/emmet-vim'
Plugin 'isRuslan/vim-es6'
Plugin 'wavded/vim-stylus'
Plugin 'tpope/vim-markdown'
Plugin 'burnettk/vim-angular'
Plugin 'digitaltoad/vim-jade'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'kchmck/vim-coffee-script'
Plugin 'jelera/vim-javascript-syntax'       " https://github.com/jelera/vim-javascript-syntax

" Plugin 'wincent/terminus'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'shougo/vimshell.vim'
" Plugin 'ervandew/screen'
" Plugin 'jistr/vim-nerdtree-tabs'

call vundle#end()

" 设置主题
set t_Co=256
set guifont=Monaco:h16
set linespace=2
set background=dark
colorscheme onedark

syntax enable

" 开启代码折叠
" set foldmethod=syntax
"
" airline'
let g:airline#extensions#enabled = 1
set laststatus=2

" 显示行号
set nu
" 相对光标所在行显示行后，光标所在行为第 0 行
" set rnu
"
" 突出显示当前行
set cursorline
" hi CursorLine ctermbg=LightBlue

" Change cursor shape in different modes
" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" 使用系统剪贴板
set clipboard+=unnamed

" 设置标尺
set ruler
set rulerformat=%12(%c%V\ %p%%%)

"Keep cursor centered vertically on the screen
set scrolloff=10 " 0

"在输入命令时列出匹配项目，也就是截图底部的效果
set wildmenu

" match rule
set matchpairs=(:),{:},[:],<:>

" 自动加载被修改的文件
set autoread

" 缩进
set tabstop=2     " tab长度
set shiftwidth=2  " 空白长度
set expandtab     " 空格替换tab
set autoindent    " 自动缩进

au FileType ruby,sass,scss,less,styl,css,yaml,vim,coffee,sh,html,jade,styl setl shiftwidth=2
au FileType ruby,sass,scss,less,styl,css,yaml,vim,coffee,sh,html,jade,styl setl tabstop=2

" 文件编码
set fileencodings=utf-8,chinese,cp936

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

set modifiable

" 显示键入的命令
set showcmd

" 自动存盘
" set autowrite

" 搜索
set hlsearch " 高亮搜索的关键字
" set incsearch " 在搜索时，输入的词句的逐字符高亮

" 自动切换当前目录为当前文件所在的目录
set autochdir

" 启动文件自动检测
filetype plugin indent on

" 自动补全
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascrīpt set omnifunc=javascrīptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

""""""""""""""""""""""""""""""""""""""""""""""""""
" javascript设置
""""""""""""""""""""""""""""""""""""""""""""""""""

" 打开javascript折叠
let b:javascript_fold=1

" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1

" vim-javascript
" Vastly improved vim's javascript indentation.
" https://github.com/pangloss/vim-javascript
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_args = "--no-eslintrc --config ~.eslintrc"

if has("autocmd")
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd GUIEnter * set vb t_vb=
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" 键盘映射
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <CR> G

""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动注释
" let g:vimrc_author='afei'
" let g:vimrc_email='clovery.org@gmail.com'
" nmap <D-c> :AuthorInfoDetect<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""

set backspace=indent,eol,start " backspace over everything in insert mode


""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示隐藏字符
""""""""""""""""""""""""""""""""""""""""""""""""""
" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
" set list
set list
set listchars=eol:␣,nbsp:☠,tab:>-,trail:-

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
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
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<TAB>" : "\<C-n>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1

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

""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowLineNumbers=1
map <D-i> :NERDTree<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" mac vim
""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_macvim")
  set background=dark
  colorscheme solarized
  set transparency=1

  " 标签页切换映射
  nn <D-1> 1gt
  nn <D-2> 2gt
  nn <D-3> 3gt
  nn <D-4> 4gt
  nn <D-5> 5gt
  nn <D-6> 6gt
  nn <D-7> 7gt
  nn <D-8> 8gt
  nn <D-9> 9gt
  nn <D-0> :tablast<CR>

  " CTRL-Tab is next tab
  noremap <D-C-Tab> :<C-U>tabnext<CR>
  inoremap <C-Tab> <C-\><C-N>:tabnext<CR>
  cnoremap <C-Tab> <C-C>:tabnext<CR>
  " CTRL-SHIFT-Tab is previous tab
  noremap <C-S-Tab> :<C-U>tabprevious<CR>
  inoremap <C-S-Tab> <C-\><C-N>:tabprevious<CR>
  cnoremap <C-S-Tab> <C-C>:tabprevious<CR>
else
  nnoremap <C-]> gt " Ctrl + ]
  nnoremap <C-[> gT " Ctrl + [
endif
