"Simple vim settings
set termguicolors
syntax enable
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nowrap
set noswapfile
set encoding=utf8
set relativenumber
set number
set mouse=a
set noswapfile
set incsearch
set colorcolumn=80
set showcmd
set cmdheight=2
set scrolloff=5
"set shell=powershell
"set nohlsearch
let &undodir=stdpath('data').'/undodir'
set undofile
"Searching smart case
set ignorecase
set smartcase
"leader is space
let mapleader=" "
"Plugins
call plug#begin(stdpath('data').'/plugged')
 "Syntax and autocomplete
 Plug 'neovim/nvim-lspconfig' 
 Plug 'tpope/vim-surround'
 Plug 'dense-analysis/ale'
 Plug 'preservim/nerdcommenter'
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
 Plug 'nvim-treesitter/playground'
 Plug 'ms-jpq/coq_nvim'
 Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
 "LaTeX!
 Plug 'lervag/vimtex' 
 "Navigation
 Plug 'christoomey/vim-tmux-navigator'
 Plug 'liuchengxu/vista.vim'
 "Fuzzy Finder
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim'
 Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
 ""Snippets
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 "File and undo tree
 "Plug 'preservim/nerdtree'
 Plug 'ms-jpq/chadtree' 
 Plug 'mbbill/undotree'
 ""Git Integration
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'tpope/vim-fugitive'
 Plug 'airblade/vim-gitgutter'
 "Appearances
 Plug 'joshdick/onedark.vim'
 Plug 'nvim-lualine/lualine.nvim'
 "Plug 'doums/darcula'
 Plug 'dracula/vim'
 "Plug 'morhetz/gruvbox'
 "Plug 'arcticicestudio/nord-vim'
 "Status bar at bottom
call plug#end()

filetype plugin on
"set guifont=JetBrains\ Mono
"set background=dark
colorscheme onedark
highlight ColorColumn ctermbg=238
"Nice background color (slightly dark)
highlight Normal guibg=#26262a 
"highlight Normal guibg=none
autocmd VimEnter * CHADopen

lua << EOF
require('ts_config')
require('lsp_config')
require('lualine_config')
require('chadtree_config')
EOF

"ALE Settings
let g:ale_linters = {
\	'python':['flake8', 'bandit', 'mypy']
\}
let g:ale_fixers = {
\   'python': ['black'],
\   'html': ['prettier'],
\   'css': ['prettier'],
\   'javascript': ['prettier'],
\   'json': ['prettier']
\}

nnoremap <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>

"----------
"Snippets
"----------
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"----------
"Commenting
"----------
filetype plugin on

"-----------
"Vimtex
"-----------
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
      \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_quickfix_mode=0
"let maplocalleader = " "

"----------
"Snippets
"----------
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"

"Vista
let s:enabled = 0

function! ToggleVista()
if s:enabled
	:Vista coc
	let s:enabled = 0
else
	:Vista!!
	let s:enabled = 1
endif
endfunction
" --------
" Mappings
" --------
"Plug-in shortcuts
nnoremap <leader>rr :NERDTreeFind <CR>
nnoremap <C-n> :NERDTreeToggle <CR>
nnoremap <leader>v :call ToggleVista() <CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>e :ALENextWrap<CR>
nnoremap <leader>at :ALEToggle<CR>
nnoremap <leader>ra :ALEFix<CR>
"Editing vimrc
nnoremap _v :exe 'edit' stdpath('config').'/init.vim'<CR>
nnoremap _V :exe 'edit' stdpath('config').'/init.vim'<CR>
"Window shortcuts
nnoremap <leader>l :lopen <CR>
nnoremap <leader>w <C-w><C-w>
nnoremap <leader>0 <C-W><
nnoremap <leader>9 <C-W>>
"Ease-of use
nnoremap <leader>n :noh<CR>
nnoremap <C-a> ggVG
"Copy-paste from system
vnoremap <leader>y "*y
vnoremap <leader>yy "*y|y
nnoremap <leader>pp "*p
"Night-mode light-mode
nnoremap <leader>nm :highlight Normal guibg=#26262a <CR>
nnoremap <leader>lm :colorscheme onedark <CR>
"Line editing
nnoremap <leader>cl 0v$y
nnoremap <leader>dl 0v$yo<ESC>pjddk
"nnoremap <leader>sl 0v$
nnoremap <leader>xl 0v$d
nnoremap <leader>pl o<ESC>pjddk
nnoremap <leader>ss ^v$
"Fuzzy finder
"nnoremap <leader>p :GFiles<CR>
"nnoremap <C-p> :GFiles<CR>
nnoremap <C-p> <cmd>Telescope find_files<CR>
nnoremap <leader>p <cmd>Telescope find_files<CR>
nnoremap <C-g> <cmd>Telescope live_grep<CR>
nnoremap <leader>g <cmd>Telescope live_grep<CR>
"Adding newlines without leaving normal mode
nnoremap <leader>o o<ESC>x
nnoremap <leader>O O<ESC>x
"Beginning/end of line
"nnoremap <leader>l $
"nnoremap <leader>n Go<ESC>
"Control backspace - may not work in TUI
inoremap <C-BS> <ESC> dBi
nnoremap <C-BS> dB

