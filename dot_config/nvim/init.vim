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
set autoindent
set updatetime=300
"set shell=powershell
set clipboard+=unnamed
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
 "Plug 'williamboman/nvim-lsp-installer'
 Plug 'ray-x/lsp_signature.nvim'
 Plug 'tpope/vim-surround'
 Plug 'dense-analysis/ale'
 Plug 'preservim/nerdcommenter'
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
 Plug 'nvim-treesitter/playground'
 "nvim-cmp autocomplete
 Plug 'saadparwaiz1/cmp_luasnip' 
 Plug 'L3MON4D3/LuaSnip' 
 Plug 'neovim/nvim-lspconfig'
 Plug 'hrsh7th/cmp-nvim-lsp'
 Plug 'hrsh7th/cmp-buffer'
 Plug 'hrsh7th/cmp-path'
 Plug 'hrsh7th/cmp-cmdline'
 Plug 'hrsh7th/nvim-cmp'
" For ultisnips users.
 Plug 'quangnguyen30192/cmp-nvim-ultisnips'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 "LaTeX!
 Plug 'lervag/vimtex' 
 "Navigation
 Plug 'christoomey/vim-tmux-navigator'
 "Fuzzy Finder
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim'
 Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
 "File and undo tree
 Plug 'preservim/nerdtree'
 Plug 'tiagofumo/vim-nerdtree-syntax-highlight' 
 Plug 'ryanoasis/vim-devicons'
 "Plug 'ms-jpq/chadtree' 
 Plug 'mbbill/undotree'
 ""Git Integration
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'tpope/vim-fugitive'
 Plug 'airblade/vim-gitgutter'
 "Appearances
 Plug 'joshdick/onedark.vim'
 Plug 'nvim-lualine/lualine.nvim'
 "Plug 'doums/darcula'
 "Plug 'dracula/vim'
 "Plug 'morhetz/gruvbox'
 "Plug 'arcticicestudio/nord-vim'
 "Status bar at bottom
call plug#end()

filetype plugin on

"Appearances
colorscheme onedark
highlight ColorColumn ctermbg=238
highlight LineNr guifg=white
"Nice background color (slightly dark)
highlight Normal guibg=none

lua << EOF
require('ts_config')
require('lsp_config')
require('lualine_config')
EOF

nnoremap <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>

" --------
" Mappings
" --------
"Plug-in shortcuts
nnoremap <leader>rr :NERDTreeFind <CR>
nnoremap <C-n> :CHADopen<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
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
nnoremap <leader>we :!explorer . <CR>
"Copy-paste from system
vnoremap <leader>y "*y
vnoremap <leader>yy "*y|y
nnoremap <leader>pp "*p
"Night-mode light-mode
nnoremap <leader>nm :highlight Normal guibg=#26262a <CR>
nnoremap <leader>lm :colorscheme onedark <CR>
nnoremap <leader>tm :highlight Normal guibg=none <CR>
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
