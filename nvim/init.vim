" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @theniceboy

" Checkout-list
" vim-esearch
" fmoralesc/worldslice
" SidOfc/mkdx


" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ====================
" === Editor Setup ===
" ====================

" ===
" === System
" ===
"set clipboard=unnamed
let &t_ut=''
set autochdir
set encoding=utf-8


" ===
" === Editor behavior
" ===
set number
" set relativenumber
set cursorline
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell

set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes


silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
set colorcolumn=80

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Terminal Behavior
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
" tnoremap <C-N> <C-\><C-N>


" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap ; :

" Save & quit
noremap Q :q<CR>
" noremap S :w<CR>

" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Open Startify
noremap <LEADER>st :Startify<CR>

" Undo operations
" noremap l u

" Insert Key
" noremap k i
" noremap K I

" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y :w !xclip -i -sel c<CR>

" Indentation
nnoremap < <<
nnoremap > >>

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
noremap <LEADER>tt :%s/    /\t/g

" Folding
noremap <silent> <LEADER>o za


" ===
" === Cursor Movement
" ===
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     u
" < n   i >
"     e
"     v
" noremap <silent> u k
" noremap <silent> n h
" noremap <silent> e j
" noremap <silent> i l

" U/E keys for 5 times u/e (faster navigation)
" noremap <silent> U 5k
" noremap <silent> E 5j
" 
" " N key: go to the start of the line
" noremap <silent> N 0
" " I key: go to the end of the line
" noremap <silent> I $
" 
" " Faster in-line navigation
" noremap W 5w
" noremap B 5b
" 
" " set h (same as n, cursor left) to 'end of word'
" noremap h e

" Ctrl + U or E will move up/down the view port without moving the cursor
" noremap <C-U> 5<C-y>
" noremap <C-E> 5<C-e>

" ===
" === Insert Mode Cursor Movement
" ===
" inoremap <C-a> <ESC>A


" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <C-K> <C-w>k
noremap <C-J> <C-w>j
noremap <C-H> <C-w>h
noremap <C-L> <C-w>l

" Disable the default s key
" noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap <C-S>k :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap <C-S>j :set splitbelow<CR>:split<CR>
noremap <C-S>h :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap <C-S>l :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Place the two screens up and down
" noremap sh <C-w>t<C-w>K
" " Place the two screens side by side
" noremap sv <C-w>t<C-w>H
" 
" " Rotate screens
" noremap srh <C-w>b<C-w>K
" noremap srv <C-w>b<C-w>H
" 
" " Press <SPACE> + q to close the window below the current window
" noremap <LEADER>q <C-w>j:q<CR>


" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tn :tabe<CR>
" Move around tabs with tn and ti
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tH :-tabmove<CR>
noremap tL :+tabmove<CR>


" ===
" === Markdown Settings
" ===
" Snippets
" source ~/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell


" ===
" === Other useful stuff
" ===
" \p to show the current buffer file path
nnoremap \p 1<C-G>

" Move the next character to the end of the line with ctrl+9
" inoremap <C-u> <ESC>lx$p

" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:sp<CR>:term<CR>

" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>
" noremap <C-x> ea<C-x>s
" inoremap <C-x> <Esc>ea<C-x>s

" Press ` to change case (instead of ~)
noremap ` ~

" noremap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
noremap tx :r !figlet

" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!chromium % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
	endif
endfunc



" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.config/nvim/plugged')



" Testing my own plugin
" Plug 'theniceboy/vim-calc'

" Pretty Dress
Plug 'theniceboy/eleline.vim'
"Plug 'bling/vim-bufferline'
Plug 'vim-airline/vim-airline'
"Plug 'liuchengxu/space-vim-theme'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
"Plug 'rakr/vim-one'
"Plug 'mhartington/oceanic-next'
"Plug 'kristijanhusak/vim-hybrid-material'
Plug 'ajmwagar/vim-deus'

" Genreal Highlighter
Plug 'jaxbot/semantic-highlight.vim'
Plug 'chrisbra/Colorizer' " Show colors with :ColorHighlight

" Template
Plug 'aperezdc/vim-template'

" File navigation
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf'
Plug 'francoiscabrol/ranger.vim'


" Taglist
Plug 'liuchengxu/vista.vim'

" Error checking
Plug 'dense-analysis/ale'

" Auto Complete
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Isort
"Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Undo Tree
Plug 'mbbill/undotree'

" Git
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive' " gv dependency
Plug 'junegunn/gv.vim' " gv (normal) to show git log
"Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'

" Tex
Plug 'lervag/vimtex'

" CSharp
Plug 'OmniSharp/omnisharp-vim'
Plug 'ctrlpvim/ctrlp.vim' , { 'for': ['cs', 'vim-plug'] } " omnisharp-vim dependency

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript' ", { 'for' :['javascript', 'vim-plug'] }
Plug 'jelera/vim-javascript-syntax'

" Go
Plug 'fatih/vim-go' " , { 'do': ':GoUpdateBinaries' }

" Python
Plug 'tmhedberg/SimpylFold'
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
"Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim'
Plug 'bfredl/nvim-ipy', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

Plug 'zchee/deoplete-jedi'

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


Plug 'neomake/neomake'
let g:neomake_python_enabled_makers = ['pylint']
" call neomake#configure#automake('nrwi', 500)

" Plug 'julienr/vim-cellmode'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'dkarter/bullets.vim', { 'for' :['markdown', 'vim-plug'] }


" Editor Enhancement
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line
Plug 'AndrewRadev/switch.vim' " gs to switch
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock
Plug 'easymotion/vim-easymotion'

" Formatter
Plug 'Chiel92/vim-autoformat'

" For general writing
Plug 'reedes/vim-wordy'
Plug 'ron89/thesaurus_query.vim'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Find & Replace
Plug 'wsdjeg/FlyGrep.vim' " Ctrl+f (normal) to find file content
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }
Plug 'osyo-manga/vim-anzu'

" Documentation
Plug 'KabbAmine/zeavim.vim' " <LEADER>z to find doc

" Mini Vim-APP
" Plug 'mhinz/vim-startify'
"Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vim-clap'
Plug 'jceb/vim-orgmode'

" Vim Applications
Plug 'itchyny/calendar.vim'

" Other visual enhancement
Plug 'ryanoasis/vim-devicons'

" Other useful utilities
Plug 'airblade/vim-rooter' " auto change pwd
Plug 'tpope/vim-eunuch' " do stuff like :SudoWrite

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'roxma/nvim-yarp'
Plug 'rbgrouleff/bclose.vim' " For ranger.vim

" tmux
Plug 'roxma/vim-tmux-clipboard'

" go-to
Plug 'davidhalter/jedi-vim'
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

Plug 'scrooloose/nerdcommenter'



call plug#end()



" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim


" hi Search ctermbg=lightyellow ctermfg=red
nnoremap <silent> <leader>h :set hlsearch! hlsearch?<CR> 

" ===
" === Dress up my vim
" ===
set termguicolors	" enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
"let ayucolor="mirage"
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:one_allow_italics = 1


"color dracula
"color one
"color deus
color gruvbox
"let ayucolor="light"
"color ayu
"set background=light

hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70

" ===================== Start of Plugin Settings =====================

" airline
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 1
let g:airline_inactive_collapse = 1

let g:airline#parts#ffenc#skip_expected_string="utf-8[unix]"
let g:airline_skip_empty_sections = 1
"let g:airline_section_y='%{&fileencoding}'


"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"
"" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
"
"" airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''


let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'ƛ'


highlight Normal ctermbg=none
highlight Normal guibg=none
highlight NonText ctermbg=none
highlight NonText guibg=none

let g:FlyGrep_search_tools = ["rg","ag"]
let g:FlyGrep_input_delay = 100


" ===
" === NERDTree
" ===

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc()==0 && !exists('s:std_in') | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
noremap tt :NERDTreeToggle<CR>
" let NERDTreeMapOpenExpl = ""
" let NERDTreeMapUpdir = "N"
" let NERDTreeMapUpdirKeepOpen = "n"
" let NERDTreeMapOpenSplit = "o"
" let NERDTreeMapOpenVSplit = ""
" let NERDTreeMapActivateNode = ""
" let NERDTreeMapOpenInTabSilent = ""
" let NERDTreeMapPreview = ""
" let NERDTreeMapCloseDir = ""
let NERDTreeMapOpenInTab = "O"
let NERDTreeMapChangeRoot = "r"
let NERDTreeMapMenu = "m"
let NERDTreeMapToggleHidden = "zh"
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '.idea']
let g:NERDTreeHidden=0
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

function! GetCurrentContent()
  let l:content = getline(0,line("$"))
  let l:result = 0
  for l:temp in l:content
    if strlen(l:temp)> 0
      let l:result = 1
      break
    endif
  endfor
  if l:result == 0
    let l:extension = expand("%:c")
    exe 'Template .' . l:extension
  endif
endfunction
autocmd BufEnter * call GetCurrentContent()


" ==
" == GitGutter
" ==
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap H :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>


" vim-cellmode
" let g:cellmode_use_tmux=1
" let g:cellmode_tmux_windowname='nvim'
" let g:cellmode_tmux_panenumber='2'
" noremap <silent> <C-e> :call RunTmuxPythonAllCellsAbove()<CR>

" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
			\ "Modified"	: "✹",
			\ "Staged"		: "✚",
			\ "Untracked" : "✭",
			\ "Renamed"	 : "➜",
			\ "Unmerged"	: "═",
			\ "Deleted"	 : "✖",
			\ "Dirty"		 : "✗",
			\ "Clean"		 : "✔︎",
			\ "Unknown"	 : "?"
			\ }

" 
" " ===
" " === coc
" " ===
" " fix the most annoying bug that coc has
" silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
" let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-emmet', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-lists', 'coc-gitignore', 'coc-omnisharp', 'coc-snippets']
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" 
" 
" " use <tab> for trigger completion and navigate to the next complete item
" function! s:check_back_space() abort
" 	let col = col('.') - 1
" 	return !col || getline('.')[col - 1]	=~ '\s'
" endfunction
" inoremap <silent><expr> <Tab>
" 			\ pumvisible() ? "\<C-n>" :
" 			\ <SID>check_back_space() ? "\<Tab>" :
" 			\ coc#refresh()
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <silent><expr> <c-space> coc#refresh()
" " Useful commands
" nmap <silent> <leader>y :<C-u>CocList -A --normal yank<cr>
" nmap <silent> <leader>e :<C-u>CocList -A --normal locationlist<cr>
" nmap <silent> <leader>g <Plug>(coc-definition)
" nmap <silent> <leader>d <Plug>(coc-type-definition)
" nmap <silent> <leader>i <Plug>(coc-implementation)
" nmap <silent> <leader>n <Plug>(coc-references)
" 
" " Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction


" ===
" === some error checking
" ===
let g:ale_virtualtext_cursor = 1
let g:ale_linters = {
			\ 'cs': ['OmniSharp'],
			\ 'go': ['vim-go'],
			\ 'c' : ['ccls']
			\}
let g:ale_cpp_ccls_init_options = {
\   'cache': {
\       'directory': '/tmp/ccls/cache'
\   }
\ }
let g:ale_c_gcc_executable = '/usr/bin/gcc'
let g:ale_c_gcc_options="-Wall -O2"


" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
			\ 'mkit': {},
			\ 'katex': {},
			\ 'uml': {},
			\ 'maid': {},
			\ 'disable_sync_scroll': 0,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 1
			\ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0


" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>


" ===
" === FZF
" ===
noremap <C-p> :FZF<CR>


" ===
" === CTRLP (Dependency for omnisharp)
" ===
let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlP'

" ===
" === vim-signature
" ===
let g:SignatureMap = {
			\ 'Leader':"m",
			\ 'PlaceNextMark':"m,",
			\ 'ToggleMarkAtLine':"m.",
			\ 'PurgeMarksAtLine':"dm",
			\ 'DeleteMark':"",
			\ 'PurgeMarks':"",
			\ 'PurgeMarkers':"",
			\ 'GotoNextLineAlpha':"m<LEADER>",
			\ 'GotoPrevLineAlpha':"",
			\ 'GotoNextSpotAlpha':"m<LEADER>",
			\ 'GotoPrevSpotAlpha':"",
			\ 'GotoNextLineByPos':"",
			\ 'GotoPrevLineByPos':"",
			\ 'GotoNextSpotByPos':"",
			\ 'GotoPrevSpotByPos':"",
			\ 'GotoNextMarker':"",
			\ 'GotoPrevMarker':"",
			\ 'GotoNextMarkerAny':"",
			\ 'GotoPrevMarkerAny':"",
			\ 'ListLocalMarks':"m/",
			\ 'ListLocalMarkers':"m?"
			\ }


" ===
" === Undotree
" ===
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1


" ==
" == vim-multiple-cursor
" ==
let g:multi_cursor_use_default_mapping=0
" let g:multi_cursor_start_word_key = '<c-k>'
" let g:multi_cursor_select_all_word_key = '<a-k>'
" let g:multi_cursor_start_key = 'g<c-k>'
" let g:multi_cursor_select_all_key = 'g<a-k>'
" let g:multi_cursor_next_key = '<c-k>'
" let g:multi_cursor_prev_key = '<c-p>'
" let g:multi_cursor_skip_key = '<C-x>'
" let g:multi_cursor_quit_key = '<Esc>'


" ==
" == thesaurus_query
" ==
nnoremap <leader>ss :ThesaurusQueryLookupCurrentWord<CR>
vnoremap <leader>ss y:ThesaurusQueryReplace <C-r>"<CR>
let g:tq_enabled_backends=["woxikon_de","jeck_ru","openoffice_en","mthesaur_txt"]
let g:tq_language=['en', 'ru', 'de', 'cn']

" nerdcommentor
let g:NERDCreateDefaultMappings = 0



" Startify
" let g:startify_lists = [
" 			\ { 'type': 'files',		 'header': ['	 MRU']						},
" 			\ { 'type': 'bookmarks', 'header': ['	 Bookmarks']			},
" 			\ { 'type': 'commands',	'header': ['	 Commands']			 },
" 			\ ]
" 

" ===
" === Far.vim
" ===
"nnoremap <silent> <LEADER>f :F	%<left><left>


" ===
" === vim-calc
" ===
" noremap <LEADER>a :call Calc()<CR>
" Testing
"if !empty(glob('~/Github/vim-calc/vim-calc.vim'))
"source ~/Github/vim-calc/vim-calc.vim
"endif


" ===
" === Bullets.vim
" ===
let g:bullets_set_mappings = 0


" ===
" === Vista.vim
" ===
noremap <silent> T :Vista!!<CR>
noremap <silent> <C-t> :Vista finder<CR>
function! NearestMethodOrFunction() abort
	return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" e.g., more compact: ["▸ ", ""]
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
"let g:vista_default_executive = 'ctags'
" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']

"Isort
"let g:isort_command = 'isort'
nnoremap <leader>i :Isort<CR>

" ===
" === Ranger.vim
" ===
nnoremap R :Ranger<CR>


" ===
" === fzf-gitignore
" ===
noremap <LEADER>gi :FzfGitignore<CR>


" ===
" === Ultisnips
" ===
let g:tex_flavor = "latex"
inoremap <c-n> <nop>
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', 'UltiSnips']
silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>


" ===
" === vimtex
" ===
"let g:vimtex_view_method = ''
" let g:vimtex_view_general_viewer = 'llpp'
let g:vimtex_view_general_viewer = 'mupdf'
let g:vimtex_mappings_enabled = 0
let g:vimtex_text_obj_enabled = 0
let g:vimtex_motion_enabled = 0
let maplocalleader=' '
" let g:vimtex_compiler_progname = 'nvr' 

set pastetoggle=<F12>
" ===
" === FlyGrep
" ===
nnoremap <c-f> :FlyGrep<CR>


" ===
" === GV
" ===
nnoremap gv :GV<CR>


" ===
" === vim-calendar
" ===
noremap \c :Calendar -position=here<CR>
noremap \\ :Calendar -view=clock -position=here<CR>
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
augroup calendar-mappings
	autocmd!
	" diamond cursor
	autocmd FileType calendar nmap <buffer> k <Plug>(calendar_up)
	autocmd FileType calendar nmap <buffer> h <Plug>(calendar_left)
	autocmd FileType calendar nmap <buffer> j <Plug>(calendar_down)
	autocmd FileType calendar nmap <buffer> l <Plug>(calendar_right)
	autocmd FileType calendar nmap <buffer> <c-k> <Plug>(calendar_move_up)
	autocmd FileType calendar nmap <buffer> <c-h> <Plug>(calendar_move_left)
	autocmd FileType calendar nmap <buffer> <c-j> <Plug>(calendar_move_down)
	autocmd FileType calendar nmap <buffer> <c-l> <Plug>(calendar_move_right)
	autocmd FileType calendar nmap <buffer> i <Plug>(calendar_start_insert)
	autocmd FileType calendar nmap <buffer> I <Plug>(calendar_start_insert_head)
	" unmap <C-n>, <C-p> for other plugins
	autocmd FileType calendar nunmap <buffer> <C-n>
	autocmd FileType calendar nunmap <buffer> <C-p>
augroup END


" ===
" === Anzu
" ===
set statusline=%{anzu#search_status()}
nnoremap = n
nnoremap - N


" ===
" === vim-go
" ===
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
"let g:go_def_mapping_enabled = 1
let g:go_highlight_array_whitespace_error    = 1
let g:go_highlight_build_constraints         = 1
let g:go_highlight_chan_whitespace_error     = 1
let g:go_highlight_extra_types               = 1
let g:go_highlight_fields                    = 1
let g:go_highlight_format_strings            = 1
let g:go_highlight_function_calls            = 1
let g:go_highlight_function_parameters       = 1
let g:go_highlight_functions                 = 1
let g:go_highlight_generate_tags             = 1
let g:go_highlight_methods                   = 1
let g:go_highlight_operators                 = 1
let g:go_highlight_space_tab_error           = 1
let g:go_highlight_string_spellcheck         = 1
let g:go_highlight_structs                   = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types                     = 1
let g:go_highlight_variable_assignments      = 0
let g:go_highlight_variable_declarations     = 0


" ===
" === AutoFormat
" ===
nnoremap <C-y> :Autoformat<CR>

" ===
" === OmniSharp
" ===
let g:OmniSharp_typeLookupInPreview = 1
let g:omnicomplete_fetch_full_documentation = 1

let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2
let g:OmniSharp_selector_ui = 'ctrlp'

autocmd Filetype cs nnoremap <buffer> gd :OmniSharpPreviewDefinition<CR>
autocmd Filetype cs nnoremap <buffer> gr :OmniSharpFindUsages<CR>
autocmd Filetype cs nnoremap <buffer> gy :OmniSharpTypeLookup<CR>
autocmd Filetype cs nnoremap <buffer> ga :OmniSharpGetCodeActions<CR>
autocmd Filetype cs nnoremap <buffer> <LEADER>rn :OmniSharpRename<CR><C-N>:res +5<CR>

sign define OmniSharpCodeActions text=💡

augroup OSCountCodeActions
	autocmd!
	autocmd FileType cs set signcolumn=yes
	autocmd CursorHold *.cs call OSCountCodeActions()
augroup END

function! OSCountCodeActions() abort
	if bufname('%') ==# '' || OmniSharp#FugitiveCheck() | return | endif
	if !OmniSharp#IsServerRunning() | return | endif
	let opts = {
				\ 'CallbackCount': function('s:CBReturnCount'),
				\ 'CallbackCleanup': {-> execute('sign unplace 99')}
				\}
	call OmniSharp#CountCodeActions(opts)
endfunction

function! s:CBReturnCount(count) abort
	if a:count
		let l = getpos('.')[1]
		let f = expand('%:p')
		execute ':sign place 99 line='.l.' name=OmniSharpCodeActions file='.f
	endif
endfunction


" ===
" === Colorizer
" ===
let g:colorizer_syntax = 1


" ===
" === vim-floaterm
" ===
"nnoremap ? :FloatermToggle<CR>
"let g:floaterm_position = 'center'
"let g:floaterm_winblend = 20
"let g:floaterm_height = winheight(0)/3*2
"let g:floaterm_width = &columns/3*2


" ===
" === vim-clap
" ===
"nnoremap ,c :Clap bcommits<CR>
"nnoremap ,l :Clap blines<CR>
nnoremap ,b :Clap buffers<CR>
nnoremap ,C :Clap colors<CR>
"nnoremap ,h :Clap hist<CR>
nnoremap ,c :Clap commits<CR>
"nnoremap ,f :Clap files<CR>
nnoremap ,t :Clap filetypes<CR>
nnoremap ,g :Clap gfiles<CR>
"nnoremap , :Clap grep<CR>
"nnoremap ,a :Clap jumps<CR>
"nnoremap , :Clap marks<CR>
"nnoremap ,t :Clap tags<CR>
nnoremap ,w :Clap window<CR>


" ===
" === vim-easymotion
" ===
let g:EasyMotion_smartcase = 1
" 'f{char} to move to {char}
map f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)
" 's{char}{char} to move to {char}{char}
"nmap 's <Plug>(easymotion-overwin-f2)
" Move to line
"map 'l <Plug>(easymotion-bd-jk)
"nmap 'l <Plug>(easymotion-overwin-line)
" Move to word
"map  'w <Plug>(easymotion-bd-w)
"nmap 'w <Plug>(easymotion-overwin-w)


" 自定义快捷键
nnoremap <LEADER>w :w<CR>
nnoremap <LEADER>q :q<CR>
nnoremap <LEADER>qw :qw<CR>
nnoremap <LEADER>0 :source ~/.config/nvim/init.vim<CR>

nnoremap <LEADER>y "+y
nnoremap <LEADER>p "+gp



" ===================== End of Plugin Settings =====================

" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"

" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
	exec "e ~/.config/nvim/_machine_specific.vim"
endif

map <F5> :call CompileRunGcc()<CR>
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
            exec "!time python %"
elseif &filetype == 'html'
            exec "!firefox % &"
elseif &filetype == 'go'
    "        exec "!go build %<"
            exec "!time go run %"
elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
endif
    endfunc
		 
		 
