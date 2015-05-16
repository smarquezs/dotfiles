call plug#begin('~/.nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-eunuch'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'gregsexton/MatchTag'
Plug 'scrooloose/syntastic'
Plug 'vim-ruby/vim-ruby'
Plug 'airblade/vim-gitgutter'
Plug 'cohama/lexima.vim' " plugin for auto-close
Plug 'Yggdroot/indentLine'
Plug 'gregsexton/gitv'
Plug 'altercation/vim-colors-solarized'
Plug 'kchmck/vim-coffee-script'
Plug 'bling/vim-airline'
Plug 'jpo/vim-railscasts-theme'
Plug 'tomasr/molokai' " color scheme
Plug 'mattn/emmet-vim'
Plug '29decibel/codeschool-vim-theme'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'
Plug 'rstacruz/vim-fastunite'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
Plug 'tsukkee/unite-tag'
Plug 'Shougo/vimfiler'
Plug 'google/vim-colorscheme-primary' " colorscheme
Plug 'whatyouhide/vim-gotham'
Plug 'gosukiwi/vim-atom-dark'
" NeoBundle
call plug#end()
  
" general config
set bg=dark
autocmd VimEnter * colo atom-dark

set nowrap
set number
set noswapfile
set splitright
set splitbelow
set ignorecase
set mouse=a
set textwidth=80

let mapleader      = ','
let maplocalleader = ','
map <Leader>o :only<CR>

" unite
map <C-p> [unite]p
map <Leader>b [unite]b
map - :VimFiler<CR>
map <Leader>ul :Unite -start-insert -buffer-name=line line<CR>

"Easy align config
vmap <Enter> <Plug>(EasyAlign)

"Fugitive
set diffopt+=vertical
map <Leader>gs :Gstatus<CR>
map <Leader>gd :Gdiff<CR>
map <Leader>gw :Gwrite<CR>
map <Leader>gv :Gitv<CR>

" terminal
tnoremap <esc> <C-\><C-n>

"spelling
autocmd BufRead,BufNewFile *.markdown setlocal spell
autocmd BufRead,BufNewFile *.gitcommit setlocal spell
 " autocmd BufRead,BufNewFile *.md setlocal spell


let Grep_Skip_Dirs = '.git log tmp' 

set clipboard+=unnamedplus
autocmd BufWritePre *.rb,*.erb,*.js,*.css,*.yml,*.rake,*.haml,*.json,*.java :%s/\s\+$//e
" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>k :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>

let g:airline_powerline_fonts = 1

" Disable arrows
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" save a file
nnoremap <Leader>w :w<CR>
inoremap <Leader>w <esc>:w<CR>
" tabs
nnoremap <leader>( :tabprev<cr>
nnoremap <leader>) :tabnext<cr>

let g:user_emmet_leader_key='<C-Z>'

let g:vimfiler_as_default_explorer = 1

let g:vimfiler_tree_leaf_icon = ""
let g:vimfiler_tree_opened_icon = "▼"
let g:vimfiler_tree_closed_icon = "▷"

let g:molokai_original = 1

" Moving lines and selections with Ctrl-J and K
nnoremap <c-k> :m-2<cr>==
nnoremap <c-j> :m+<cr>==
inoremap <c-j> <esc>:m+<cr>==gi
inoremap <c-k> <esc>:m-2<cr>==gi
vnoremap <c-j> :m'>+<cr>gv=gv
v
