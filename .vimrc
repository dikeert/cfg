syntax on
set shortmess=at
set nocompatible
set nu
set nowrap

if $VIM_CRONTAB == "true"
	set nobackup
	set nowritebackup
endif

"shut the fuck up!
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=n

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'chase/vim-ansible-yaml'
Plugin 'rdnetto/YCM-Generator'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'dracula/vim'
Plugin 'scrooloose/nerdcommenter'
call vundle#end() 
filetype plugin indent on

syntax enable
syntax on
set hidden

if has("unix")
	let s:uname = system("echo -n \"$(uname)\"")
	if !v:shell_error && s:uname == "Linux"
		try
			colorscheme dracula
		catch /^Vim\%((\a\+)\)\=:E185/
			" deal with it
		endtry
		set background=dark
	else
		set background=light
		try
			colorscheme PaperColor
		catch /^Vim\%((\a\+)\)\=:E185/
			" deal with it
		endtry
		highlight ColorColumn ctermbg=255
	endif
endif

" indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set backspace=indent,eol,start

" Ignore these directories
set wildignore+=*/target/**,*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip  

let &colorcolumn=join(range(81,999),",")
hi Visual term=reverse cterm=reverse guibg=Grey

" YouCompleteMe
set completeopt=menuone
let g:ycm_show_diagnostics_ui = 0
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1


map <c-k><c-b> :NERDTreeToggle<cr>
