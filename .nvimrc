call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
" Plug 'tpope/vim-fugitive'
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
Plug 'mattn/emmet-vim'
Plug '29decibel/codeschool-vim-theme'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'
Plug 'rstacruz/vim-fastunite'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/vimfiler'
Plug 'google/vim-colorscheme-primary' " colorscheme
Plug 'whatyouhide/vim-gotham'
Plug 'gosukiwi/vim-atom-dark'
Plug 'tsukkee/unite-tag'
Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plug 'yosiat/oceanic-next-vim'
Plug 'jpo/vim-railscasts-theme'
Plug 'jdkanani/vim-material-theme'
Plug 'chriskempson/base16-vim'
Plug 'dyng/ctrlsf.vim'
Plug 'endel/vim-github-colorscheme'
Plug 'gertjanreynaert/cobalt2-vim-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'ngmy/vim-rubocop'
Plug 'jreybert/vimagit'
" NeoBundle
call plug#end()

if $ITERM_PROFILE == 'Solarized Dark'
  set bg=dark
  autocmd VimEnter * colo solarized
endif

if $ITERM_PROFILE == 'Github'
  set bg=light
  autocmd VimEnter * colo github
endif

if $ITERM_PROFILE == 'Solarized Light'
  set bg=light
  autocmd VimEnter * colo solarized
endif

if $ITERM_PROFILE == 'Codeschool'
  autocmd VimEnter * colo codeschool
endif

if $ITERM_PROFILE == 'Material'
  set bg=dark
  autocmd VimEnter * colo material-theme
endif

if $ITERM_PROFILE == 'Cobalt2'
  autocmd VimEnter * colo cobalt2
endif

if $ITERM_PROFILE == 'Base16'
  set bg=dark
  autocmd VimEnter * colo base16-tomorrow
endif

" Whitespace settings
set nowrap        " don't wrap lines
set tabstop=2     " a tab is two spaces
set shiftwidth=2  " an autoindent (with <<) is two spaces
set softtabstop=2 " if we have smart tabs, treat like hard tabs
set noexpandtab   " Use hard tabs
set list          " Show invisible characters

" Change buffer whitout saving
set hidden

set number
set noswapfile
set splitright
set splitbelow
set smartcase
set ignorecase
set incsearch
set mouse=a
set textwidth=80


let mapleader      = ' '
let maplocalleader = ' '
map <Leader>o :only<CR>

" unite
map <C-p> [unite]p
map <Leader>b [unite]b
map - :VimFiler<CR>
map <Leader>ul :Unite -start-insert -buffer-name=line line<CR>

"Easy align config
vmap <Enter> <Plug>(EasyAlign)

"Fugitive
" set diffopt+=vertical
" map <Leader>gs :Gstatus<CR>
" map <Leader>gd :Gdiff<CR>
" map <Leader>gw :Gwrite<CR>
" map <Leader>gv :Gitv<CR>

" terminal
tnoremap <esc> <C-\><C-n>

"spelling
autocmd BufRead,BufNewFile *.markdown setlocal spell
autocmd BufRead,BufNewFile *.gitcommit setlocal spell
 " autocmd BufRead,BufNewFile *.md setlocal spell


let Grep_Skip_Dirs = '.git log tmp'

set clipboard+=unnamedplus

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
nnoremap <silent><Leader>w :w<CR>

let g:user_emmet_leader_key='<C-Z>'

let g:vimfiler_as_default_explorer = 1

" Always show statusline
set laststatus=2

" Better navigation in long lines
nnoremap j  gj
nnoremap k  gk

nmap <leader>cf <Plug>CtrlSFPrompt
let g:molokai_original = 1

nmap <silent> <BS> :nohlsearch<CR>

" Moving lines and selections with Ctrl-J and K
nnoremap <c-k> :m-2<cr>==
nnoremap <c-j> :m+<cr>==
inoremap <c-j> <esc>:m+<cr>==gi
inoremap <c-k> <esc>:m-2<cr>==gi
vnoremap <c-j> :m'>+<cr>gv=gv
vnoremap <c-k> :m-2<cr>gv=gv

cmap w!! w !sudo tee % > /dev/null

autocmd FileType vimfiler nunmap <buffer> <space>

" vim-ruby
let ruby_operators    = 1
let ruby_space_errors = 1

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" vimagit
let g:magit_default_show_all_files = 1
let g:magit_default_fold_level     = 2
let g:magit_show_help              = 0

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
