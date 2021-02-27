"*****************************************************************************
"" Plugin manager
"*****************************************************************************"
call plug#begin(stdpath('data') . '/plugged')

" Visual
Plug 'ghifarit53/tokyonight-vim'	" Tokyo Night theme
Plug 'itchyny/lightline.vim'		" Lightline

" NERDTree
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

" Git
Plug 'tpope/vim-fugitive'

" Dev
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" General
set number															"" Show line numbers
set linebreak														"" Break lines at word (requires Wrap lines)
set showbreak=+++												"" Wrap-broken line prefix
set textwidth=80												"" Line wrap (number of cols)
set showmatch														"" Highlight matching brace
set visualbell	                        "" Use visual bell (no beeping)

"" Searching
set hlsearch														"" Highlight all search results
set smartcase														"" Enable smart-case search
set ignorecase	                        "" Always case-insensitive
set incsearch														"" Searches for strings incrementally

"" Format
set autoindent	                        "" Auto-indent new lines
set shiftwidth=4												"" Number of auto-indent spaces
set smartindent	                        "" Enable smart-indent
set smarttab														"" Enable smart-tabs
set softtabstop=4												"" Number of spaces per Tab

"" Advanced
set autowrite														"" Automatically :write before running commands
set ruler																"" Show row and column ruler information

"" Undo & Delete
set undolevels=1000											"" Number of undo levels
set backspace=indent,eol,start					"" Backspace behaviour

" Visual
set noshowmode
set termguicolors
let g:tokyonight_style = 'storm'
colorscheme tokyonight


"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Map leader to \
let mapleader='\'

"" Switch between window
:nmap <silent> <C-h> :wincmd h<CR>
:nmap <silent> <C-j> :wincmd j<CR>
:nmap <silent> <C-k> :wincmd k<CR>
:nmap <silent> <C-l> :wincmd l<CR>


" NERDTree
let g:NERDTreeShowHidden = 1 
let g:NERDTreeMinimalUI = 1 " hide helper
let g:NERDTreeIgnore = ['^node_modules$'] " ignore node_modules to increase load speed 
let g:NERDTreeStatusline = '' " set to empty to use lightline
" " Toggle
noremap <silent> <C-b> :NERDTreeToggle<CR>
" " Close window if NERDTree is the last one
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " Map to open current file in NERDTree and set size
nnoremap <leader>pv :NERDTreeFind<bar> :vertical resize 45<CR>

" NERDTree Syntax Highlight
" " Enables folder icon highlighting using exact match
let g:NERDTreeHighlightFolders = 1 
" " Highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1 
" " Color customization
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
" " This line is needed to avoid error
let g:NERDTreeExtensionHighlightColor = {} 
" " Sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['css'] = s:blue 
" " This line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor = {} 
" " Sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange 
" " This line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor = {} 
" " Sets the color for files ending with _spec.rb
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red 

" " Sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFolderSymbolColor = s:beige 
" " Sets the color for files that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue 

" NERDTree Git Plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


" Lightline
let g:lightline = {
    \ 'colorscheme': 'tokyonight',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }


" COC
" " COC extension
let g:coc_user_config = {}
let g:coc_global_extensions = [
    \ 'coc-css',
		\ 'coc-docker',
    \ 'coc-emmet',
    \ 'coc-go',
    \ 'coc-highlight',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-phpls',
    \ 'coc-snippets',
    \ 'coc-svelte',
    \ 'coc-svg',
    \ 'coc-tailwindcss',
    \ 'coc-toml',
    \ 'coc-tsserver',
    \ 'coc-vetur',
    \ 'coc-yaml']
