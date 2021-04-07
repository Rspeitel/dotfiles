"PLUGINS
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'scrooloose/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'Raimondi/delimitMate'
Plug 'sheerun/vim-polyglot'
call plug#end()

"THEMEING
syntax on
colorscheme onedark
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \            [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
  \   'right': [ [  'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
  \            ['lineinfo'],
  \            ['percent'],
  \            [ 'fileformat', 'fileencoding', 'filetype'] ]
  \ },
  \ 'component_expand': {
  \    'linter_checking': 'lightline#ale#checking',
  \    'linter_warnings': 'lightline#ale#warnings',
  \    'linter_errors': 'lightline#ale#errors',
  \    'linter_ok': 'lightline#ale#ok',
  \ },
  \ 'component_type': {
  \     'linter_checking': 'left',
  \     'linter_warnings': 'warning',
  \     'linter_errors': 'error',
  \     'linter_ok': 'left',
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
  \
  \ }

hi Normal guibg=NONE ctermbg=NONE

"GIT GUTTER
set updatetime=250

"LEADER KEY
let g:mapleader = "\<Space>"
nnoremap <silent> <leader>m :marks<CR>
nnoremap <silent> <leader>t :GFiles<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>d :bp\|bd #<CR>
nnoremap <silent> <leader>c :let @+ = expand('%') <CR>
nnoremap <leader>f :Ggrep<Space>

"ENABLE MOUSE
set mouse=a

"USE SPACES INSTEAD OF TABS
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"SHOW EXTRA SPACES AND CHARACTERS
set list

"RELATIVE LINE NUMBERS
set nu rnu

"SET LINE OVERFLOW MARKER
set colorcolumn=100
highlight ColorColumn ctermbg=0

"CLEAN SEARCH ON ESCAPE
nnoremap <ESC> :noh <CR>
"AUTO UPDATE CONFIG ON SAVE
autocmd! bufwritepost init.vim source %

autocmd! bufwritepre * %s/\s\+$//e

"REMAP FOR SPLITS
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-A-H> :vertical resize -10<CR>
nnoremap <C-A-L> :vertical resize +10<CR>
nnoremap <C-A-J> :resize -10<CR>
nnoremap <C-A-K> :resize +10<CR>
nnoremap <C-M> :vsp<CR>
nnoremap <C-N> :split<CR>

"OPEN QUICKFIX AFTER GREP"
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
augroup END

"SET SEARCH TO IGNORE CASE"
set ignorecase

"SPLIT DEFAULTS
set splitright splitbelow

"SETUP FILETYPE SOURCES
"Took this out for now. Might need it eventually
"source ~/.config/nvim/filetypes/javascript
