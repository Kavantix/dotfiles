set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

runtime! plugin/sensible.vim

nnoremap <SPACE> <Nop>
let mapleader = " "

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

syntax on
set termguicolors
set nocompatible
set number
set relativenumber
set wildmenu
set hidden
set splitbelow splitright
set ignorecase
set smartcase

" Always expand tabs to spaces!
set expandtab
set shiftwidth=2
set tabstop=2
set smarttab
set autoindent
set list


" no more swp files!
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

"exucute root dir vimrc
set exrc
" Refresh buffer
set autoread
set colorcolumn=81

" Make macros lighting fast
set lazyredraw

let s:local_coc_path = "$HOME/Git/coc.nvim"
let s:has_local_coc = isdirectory(expand(s:local_coc_path))

call plug#begin()

" start with some sensible defaults
Plug 'tpope/vim-sensible'

Plug 'neovimhaskell/haskell-vim'

Plug 'purescript-contrib/purescript-vim'

Plug 'dart-lang/dart-vim-plugin'
if !s:has_local_coc
  Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
endif
Plug 'neoclide/jsonc.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'
Plug 'zchee/vim-flatbuffers'
" Plug 'fatih/vim-go'
Plug 'crusoexia/vim-monokai'
Plug 'lervag/vimtex'
Plug 'editorconfig/editorconfig-vim'
Plug 'posva/vim-vue'
" Plug 'plasticboy/vim-markdown'
Plug 'junegunn/rainbow_parentheses.vim'
" Text Navigation
Plug 'unblevable/quick-scope'

Plug 'uarun/vim-protobuf'

" Python
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-python/python-syntax'

Plug 'vim-pandoc/vim-pandoc-syntax'

" Showing mapped leader commands
Plug 'spinks/vim-leader-guide'
Plug 'tomasiser/vim-code-dark'
Plug 'ojroques/vim-oscyank'
Plug 'puremourning/vimspector'
Plug 'towolf/vim-helm'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" Colorizer
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'navarasu/onedark.nvim'
Plug 'sainnhe/gruvbox-material'
Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}
Plug 'lewis6991/gitsigns.nvim'

" Better cursorhold event that doesnt write swap and works in nvim
Plug 'antoinemadec/FixCursorHold.nvim'

Plug 'jiangmiao/auto-pairs'

Plug 'voldikss/vim-floaterm'
call plug#end()

" in millisecond, used for both CursorHold and CursorHoldI
let g:cursorhold_updatetime = 100

" disable jumping to pair bracket if it is on another line
let g:AutoPairsMultilineClose = 0

if s:has_local_coc
  set runtimepath^=$HOME/Git/coc.nvim
endif

source $HOME/.config/nvim/plug/coc-settings.vim
source $HOME/.config/nvim/plug/remappings.vim

let NERDTreeShowHidden=1

let g:airline_extensions=[]
let g:airline_theme='dark_minimal'
" Disable whitespace showing at the right of the statusbar
let g:airline#extensions#whitespace#enabled = 0
" Only show parts of the Z section
let g:airline_section_z = '%#__accent_bold#%l%#__restore__#%#__accent_bold#/%L%#__restore__#:%v'
" Prevent airline getting slower over time while using coc
" Since coc puts in dynaimc highlighting groups which can slow it down
let g:airline_highlighting_cache = 1

" Latex config
let g:tex_flavor='latex'
let g:vimtex_compiler_progname = 'nvr'
" let g:vimtex_view_general_viewer = 'open -a /Applications/Skim.app'
" let g:vimtex_view_skim_activate = 1
let g:vimtex_view_method = 'skim'

" Disable auto folding of markdown
let g:vim_markdown_folding_disabled = 1

set noshowmode
" Always show tabline
set showtabline=2
" Force command height to 2 to prevent glitch with lightline
set cmdheight=2
let g:lightline#bufferline#clickable = 1
let g:lightline = {
      \ 'colorscheme': 'deus',
      \ 'active': {
      \ 'left': [ [ 'mode', 'paste' ],
      \           [ 'readonly', 'relativepath', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'cocstatus', 'filetype' ] ]
      \ },
      \ 'inactive': {
      \ 'left': [ [ 'relativepath' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ] ]
      \ },
      \ 'tabline': {
      \ 'left': [ [ 'buffers' ] ],
      \ },
      \ 'component': {
      \   'cocstatus': '%{coc#status()}'
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'component_raw': {
      \   'buffers': 1
      \ },
      \ }


" colorscheme monokai
let g:onedark_style='warmer'
colorscheme gruvbox-baby
hi CocHighlightText guibg=#414141
hi CocHighlightWrite guibg=#414141
hi CocHighlightRead guibg=#414141
hi Visual guibg=#414141

" Enable mouse support
set mouse=a

" Always keep 10 lines below/above cursor
set scrolloff=10

" -------------- Rainbow --------------------------

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:rainbow#max_level = 32

let g:rainbow_conf = {'guis': ['bold']}

" \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
" let g:rainbow_conf = {
" \	'guifgs': ['#858580', '#8FBCBB', '#D08770', '#A3BE8C', '#EBCB8B', '#B48EAD', '#80a880', '#887070'],
" \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
" \	'guis': [''],
" \	'cterms': [''],
" \	'operators': '_,_',
" \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
" \	'separately': {
" \		'*': {},
" \		'markdown': {
" \			'parentheses_options': 'containedin=markdownCode contained',
" \		},
" \		'lisp': {
" \	    'guifgs': ['#858580', '#8FBCBB', '#D08770', '#A3BE8C', '#EBCB8B', '#B48EAD', '#80a880', '#887070'],
" \		},
" \		'jsx': {
" \	    'guifgs': ['#858580', '#8FBCBB', '#D08770', '#A3BE8C', '#EBCB8B', '#B48EAD', '#80a880', '#887070'],
" \		},
" \		'haskell': {
" \			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'],
" \		},
" \		'vim': {
" \			'parentheses_options': 'containedin=vimFuncBody',
" \		},
" \		'perl': {
" \			'syn_name_prefix': 'perlBlockFoldRainbow', 
" \		},
" \		'stylus': {
" \			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'], 
" \		},
" \		'css': 0, 
" \	}
" \}

" let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme,dart,js,json,typescript,go RainbowParentheses
augroup END


" ---------- QuickScope --------------------------

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#eF5F70' gui=underline ctermfg=81 cterm=underline
let g:qs_max_chars=150

" Python
let python_highlight_all=1


" Set pandoc for markdown files
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
hi Conceal guifg=orange guibg=None

augroup filetypes
    au! BufRead,BufNewFile *.porth set filetype=porth
    au! FileType porth setlocal commentstring=//\ %s
    au! BufRead,BufNewFile *.ccon set filetype=ccon
    au! FileType ccon setlocal commentstring=#\ %s
augroup END

lua require 'kavantix'
