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
let &undodir=stdpath('data') . '/undodir'
set undofile
"Searching smart case
set ignorecase
set smartcase
"leader is space
let mapleader=" "
"Plugins
call plug#begin(stdpath('data').'/plugged')
 "Syntax and autocomplete
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'tpope/vim-surround'
 Plug 'dense-analysis/ale'
 Plug 'preservim/nerdcommenter'
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
 Plug 'nvim-treesitter/playground'
 "LaTeX!
 Plug 'lervag/vimtex' 
 "Debugging
 "Plug 'puremourning/vimspector'
 "Navigation
 Plug 'christoomey/vim-tmux-navigator'
 Plug 'liuchengxu/vista.vim'
 "Fuzzy Finder
 "Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 "Plug 'junegunn/fzf.vim'
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim'
 Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
 ""Snippets
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 "File and undo tree
 Plug 'preservim/nerdtree'
 Plug 'mbbill/undotree'
 ""Git Integration
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'tpope/vim-fugitive'
 Plug 'airblade/vim-gitgutter'
 "Appearances
 Plug 'ryanoasis/vim-devicons' 
 "Plug 'doums/darcula'
 Plug 'joshdick/onedark.vim'
 "Plug 'dracula/vim'
 "Plug 'morhetz/gruvbox'
 "Plug 'arcticicestudio/nord-vim'
 "Status bar at bottom
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
call plug#end()

filetype plugin on

"set guifont=JetBrains\ Mono
"set background=dark
colorscheme onedark
highlight ColorColumn ctermbg=238
"Nice background color (slightly dark)
highlight Normal guibg=#26262a 
"highlight Normal guibg=none
autocmd VimEnter * NERDTree

" -----------------
" Settings for coc
" -----------------
" coc extensions
let g:coc_global_extensions = ['coc-pyright', 'coc-json', 'coc-prettier',
	\ 'coc-pairs', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-sh', 'coc-clangd']
set updatetime=300
set nobackup
set nowritebackup
set hidden
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
" Recently vim can merge signcolumn and number column into one
set signcolumn=number
else
set signcolumn=yes
endif
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
inoremap <silent><expr> <c-space> coc#refresh()
else
inoremap <silent><expr> <c-@> coc#refresh()
endif
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
execute 'h '.expand('<cword>')
elseif (coc#rpc#ready())
call CocActionAsync('doHover')
else
execute '!' . &keywordprg . " " . expand('<cword>')
endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
"ALE support
let g:ale_disable_lsp = 1
let g:ale_linters = {'*':[], 'python':['flake8', 'bandit', 'mypy']}
let g:ale_fixers = {'*':[], 'python':['black'], 'cpp':['clangtidy', 'clang-format', 'astyle']}
"let g:ale_fix_on_save = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

"-----------
"Treesitter
"-----------
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = { },

  highlight = {
	-- `false` will disable the whole extension
	enable = true,

	-- list of language that will be disabled
	disable = {},

	-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
	-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
	-- Using this option may slow down your editor, and you may see some duplicate highlights.
	-- Instead of true it can also be a list of languages
	additional_vim_regex_highlighting = false,
  },
}
EOF
"
"-----------
"Vimtex
"-----------
let g:tex_flavor='latex'
let g:vimtex_view_method='mupdf'
"let g:vimtex_view_general_viewer = 'mupdf'
"let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_quickfix_mode=0
"let maplocalleader = " "
"set conceallevel=1
"let g:tex_conceal='abdmg'
"-----------
"Vimspector
"-----------
let g:vimspector_enable_mappings = 'HUMAN'

"----------
"Snippets
"----------
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"

"----------
"Status Bar
"----------

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

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
"Editing vimrc
nnoremap _v :exe 'edit' stdpath('config').'/init.vim'<CR>
nnoremap _V :exe 'edit' stdpath('config').'/init.vim'<CR>
"Window shortcuts
nnoremap <leader>l :lopen <CR>
nnoremap <leader>w <C-w><C-w>
nnoremap <leader>e :ALENextWrap<CR>
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
nnoremap <leader>sl 0v$
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
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>
"Beginning/end of line
"nnoremap <leader>l $
"nnoremap <leader>n Go<ESC>
"Control backspace - may not work in TUI
inoremap <C-BS> <ESC> dBi
nnoremap <C-BS> dB

