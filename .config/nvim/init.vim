"{{{ Dein
	filetype off
	set runtimepath+=~/.config/nvim/dein.vim
	call dein#begin(expand('~/.config/nvim/bundle'))
	call dein#add('chase/vim-ansible-yaml')
	call dein#add('scrooloose/nerdtree')
	call dein#add('ctrlpvim/ctrlp.vim')
	call dein#add('NLKNguyen/papercolor-theme')
	call dein#add('dracula/vim')
	call dein#add('scrooloose/nerdcommenter')
	call dein#add('fatih/vim-go')
	call dein#add('Shougo/deoplete.nvim')
	call dein#add('nathanaelkane/vim-indent-guides')
	call dein#add('zchee/deoplete-go', {'build': 'make'})
	call dein#end()
"}}}

"{{{ Basics
	set nocompatible
	set mouse=a
	
	filetype plugin indent on

	syntax on
	syntax enable

	set hidden
	set shortmess=at
	set nu
	set nowrap
	set timeoutlen=1000 ttimeoutlen=0
	set cmdheight=1
	set laststatus=2

	if $VIM_CRONTAB == "true"
		set nobackup
		set nowritebackup
	endif
	
	" shut the fuck up!
	set noerrorbells visualbell t_vb=
	autocmd GUIEnter * set visualbell t_vb=n

	
	" indentation
	set tabstop=2
	set softtabstop=2
	set shiftwidth=2
	set autoindent
	set smartindent
	set backspace=indent,eol,start

	" Ignore these directories
	set wildignore+=*/target/**,*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip  

	let &colorcolumn=join(range(81,999),",")
	hi Visual term=reverse cterm=reverse guibg=Grey
"}}}

"{{{ Colors, Clipboard
	"{{{ *nix
		if has("unix")
			set background=light
			set clipboard=unnamedplus
			try
				colorscheme PaperColor
			catch /^Vim\%((\a\+)\)\=:E185/
				" deal with it
			endtry
			"highlight ColorColumn ctermbg=255
		endif
	"}}}
"}}}

" {{{ Plugins
	" {{{ NERDCommenter
		let g:NERDSpaceDelims = 1
		let g:NERDTrimTrailingWhitespace = 1
	" }}}
	
	" {{{ Deoplete
		let g:deoplete#enable_at_startup = 1
		set completeopt-=preview
		set completeopt+=noinsert
		call deoplete#custom#source('go', 'rank', 1000)
		let g:deoplete#ignore_sources = {}
		let g:deoplete#ignore_sources._ = ['buffer']
	" }}}
	
	" {{{ vim-go
		let g:go_highlight_build_constraints = 1
		let g:go_highlight_extra_types = 1
		let g:go_highlight_fields = 1
		let g:go_highlight_functions = 1
		let g:go_highlight_methods = 1
		let g:go_highlight_operators = 1
		let g:go_highlight_structs = 1
		let g:go_highlight_types = 1
		let g:go_auto_sameids = 1
		let g:go_auto_type_info = 1
	" }}}
	
	" {{{ CTRL-P
		let g:ctrlp_root_markers = ['.config', 'config', 'pom.xml', '.p4ignore', 'main.go', 'Makefile']
		let g:ctrlp_show_hidden = 1
	" }}}
" {{{ Vin Indent Guides
		let g:indent_guides_auto_colors = 0
		let g:indent_guides_enable_on_vim_startup = 1
		hi IndentGuidesOdd  ctermbg=254
		hi IndentGuidesEven ctermbg=255
	" }}}
" }}}

"{{{ Bindings
	"{{{ Navigation
		nnoremap <M-H> :bp<Enter>
		nnoremap <M-L> :bn<Enter>
	"}}}
	
	"{{{ Tools
		map <c-k><c-b> :NERDTreeToggle<cr>
	"}}}
	
	"{{{ Actions
		map <F10> :qall<cr>
		imap jk <Esc>
	"}}}

	"{{{ FileType
		"{{{ Go
			au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
			au FileType go nmap <leader>gg :GoDef<cr>
			au FileType go nmap <leader>gt :GoTest<cr>
			au FileType go nmap <leader>gb :GoBuild<cr>
		"}}}
	"}}}
	
	
"}}}

" vim:ts=2:sw=2:ai:foldmethod=marker:foldlevel=0:
