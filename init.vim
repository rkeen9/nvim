"  set the runtime path to include Vundle and initialize
" toggles line numbers
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'vimlab/split-term.vim'
Plug 'conornewton/vim-latex-preview'
Plug 'skywind3000/asyncrun.vim'
" Plug 'Yggdroot/indentLine'
" Initialize plugin system
call plug#end()

"remap leader to space
let mapleader = "\<Space>"
set number relativenumber

"escapes insert mode when you type kj
imap kj <Esc>

"changes a tab to 4 spaces
set expandtab ts=4 sw=4 ai

"changes vim clipboard to system clipboard
set clipboard=unnamedplus

"makes it so vim does not empty clipboard upon exiting (requires xsel on system)
autocmd VimLeave * call system("xsel -ib", getreg('+'))

"makes things automatically indent
set autoindent

"makes it so new split windows open to the right 
set splitbelow splitright

"get rid of autocommenting 
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"making 'd' delete instead of cut
nnoremap d "_d
vnoremap d "_d

"Shortcuts for split navigation
map <leader>w <C-w>
"map <C-H> <C-w>h
"map <C-J> <C-w>j
"map <C-K> <C-w>k
"map <C-L> <C-w>l

"airline configuration
" set t_Co=256
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1

"Vim markdown configuration
let g:vim_markdown_folding_disabled = 1

"tab to indent and Shift+tab to unindent
" for command mode
nnoremap <S-Tab> <<
nnoremap <Tab> >>
" for insert mode
inoremap <C-S-Tab> <C-d>
inoremap <C-Tab> <C-t>
" for visual mode
vnoremap <Tab> >
vnoremap <S-Tab> <

"tq to save and exit vim
nnoremap ;q :wq<Return>

";; to save
noremap ;; :w<Return>

"qq to exit vim without saving
noremap qq :q!<Return>

set nofoldenable

"colour scheme and font customized to use terminal transparency
set backspace=2
set background=dark
colorscheme gruvbox
let g:airline_theme='gruvbox'
"autocmd vimenter * AirlineTheme gruvbox
set encoding=utf-8
set guifont=Source_Code_Pro_for_Powerline:h11:cANSI:qDRAFT
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

syntax on
let g:netrw_browse_split = 1

" coc config
let g:coc_global_extensions = [
\ 'coc-snippets',
"\ 'coc-pairs',
"\ 'coc-tsserver',
"\ 'coc-prettier',
"\ 'coc-eslint', 
"\ 'coc-json', 
\ 'coc-clangd',
\ ]

" let b:coc_diagnostic_disable = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" shortcuts for tab navigation
"nnoremap <C-Left> :tabprevious<CR>
"nnoremap <C-Right> :tabnext<CR>
"nnoremap <silent> <A-Left> :execute 'silent! tabmove ' .(tabpagenr()-2)<CR>
"nnoremap <silent> <A-Right> :execute 'silent! tabmove ' .(tabpagenr()+1)<CR>

" shortcuts for buffer navigation
set switchbuf=usetab

" open Nerd Tree with ctrl+n
nmap <C-n> :NERDTreeToggle<CR>
" buffer navigation
" F5 lists buffers
:nnoremap <C-Tab> :buffers<CR>:buffer<Space>
nnoremap <C-h> :bprev<CR>
nnoremap <C-l> :bnext<CR>
noremap bd :bdelete<Return>

" NerdTree open in tab
let NERDTreeMapOpenInTab='\r'

" can't remember why I set this
set hidden

" indent character
"let g:indentLine_setColors = 0
"let g:indentLine_bgcolor_term = 238
    "let g:indentLine_char = '│'
"set cursorcolumn
"set cursorline

" Funtion navigation
map [[ :silent! eval search('{', 'b')<CR>w99[{
map ][ :silent! eval search('}')<CR>b99]}
map ]] j0[[%:silent! eval search('{')<CR>
map [] k$][%:silent! eval search('}', 'b')<CR>

" opposite of shift+J
map <C-j> i<CR><Esc>

" split resizing
nnoremap <C-Left> :vertical resize -10 <CR>
nnoremap <C-Right> :vertical resize +10 <CR>
nnoremap <C-Up> :resize -10 <CR>
nnoremap <C-Down> :resize +10 <CR>

"scroll wheel
set mouse=a

"ctrl+t to open termainal
nnoremap <C-t> :Term <CR>

"enable spell checking
set spelllang=en_ca
set spell

"latex preview
let g:latex_pdf_viewer="zathura"

"remap ` to space+m
map <leader>m `
