call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'junegunn/vim-easy-align'
Plug 'gregsexton/MatchTag'
Plug 'scrooloose/syntastic'
Plug 'vim-ruby/vim-ruby'
Plug 'airblade/vim-gitgutter'
Plug 'cohama/lexima.vim' " plugin for auto-close
Plug 'Yggdroot/indentLine'
Plug 'kchmck/vim-coffee-script'
Plug 'bling/vim-airline'
Plug 'mattn/emmet-vim'
Plug '29decibel/codeschool-vim-theme'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'
Plug 'rstacruz/vim-fastunite'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
Plug 'chriskempson/base16-vim'
Plug 'dyng/ctrlsf.vim'
Plug 'gertjanreynaert/cobalt2-vim-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'ngmy/vim-rubocop'
Plug 'crusoexia/vim-monokai'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'scrooloose/nerdtree'
Plug 'digitaltoad/vim-jade'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/seoul256.vim'
Plug 'wikitopian/hardmode'
Plug 'ruanyl/vim-gh-line'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/gv.vim'
" Plug 'takac/vim-hardtime'
" NeoBundle
call plug#end()

if $ITERM_PROFILE == 'Solarized Dark'
  set bg=dark
  autocmd VimEnter * colo solarized
endif

if $ITERM_PROFILE == 'Solarized Light'
  set bg=light
  autocmd VimEnter * colo solarized
endif

if $ITERM_PROFILE == 'Codeschool'
  autocmd VimEnter * colo codeschool
endif

if $ITERM_PROFILE == 'Cobalt2'
  autocmd VimEnter * colo cobalt2
endif

if $ITERM_PROFILE == 'Monokai'
  set bg=dark
  autocmd VimEnter * colo monokai
endif

if $ITERM_PROFILE == 'Base16'
  set bg=dark
  autocmd VimEnter * colo base16-tomorrow
endif


if $ITERM_PROFILE == 'Seoul Dark'
  let g:seoul256_background = 235
  set bg=dark
  autocmd VimEnter * colo seoul256
endif
" Basic setiings
set clipboard=unnamed " copy to system clipboard
" set ruler
set nowrap         " don't wrap lines
set tabstop=2      " a tab is two spaces
set shiftwidth=2   " an autoindent (with <<) is two spaces
set softtabstop=2  " if we have smart tabs, treat like hard tabs
set expandtab      " Use spaces instead of tags
" set cursorline     " Highlight the current line
set list           " Show invisible characters

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
map <silent><Leader>o :only<CR>

" unite
map <Leader>b [unite]b
map <Leader>ul :Unite -start-insert -buffer-name=line line<CR>

"Easy align config
vmap <Enter> <Plug>(EasyAlign)

" NERDtree
map <leader>n :NERDTreeToggle<CR>
map <silent><leader>- :NERDTreeFind<cr>
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let g:NERDTreeWinSize=35

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

" Make it obvious where 80 characters is
set textwidth=80
highlight ColorColumn ctermbg=000000
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

let Grep_Skip_Dirs = '.git log tmp'

let g:airline_powerline_fonts = 1

" Vim. Live it. (http://www.tylercipriani.com/vim.html)
inoremap <up> <nop>
vnoremap <up> <nop>
nnoremap <up> <nop>
inoremap <down> <nop>
vnoremap <down> <nop>
nnoremap <down> <nop>
inoremap <left> <nop>
vnoremap <left> <nop>
nnoremap <left> <nop>
inoremap <right> <nop>
vnoremap <right> <nop>
nnoremap <right> <nop>

" save a file
nnoremap <silent><Leader>w :w<CR>
nnoremap <silent><Leader>q :q<CR>

let g:user_emmet_leader_key='<C-Z>'

" Always show statusline
set laststatus=2

" Better navigation in long lines
nnoremap j  gj
nnoremap k  gk

nmap <leader>cf <Plug>CtrlSFPrompt

nmap <silent> <BS> :nohlsearch<CR>

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

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
map <C-P> :FZF<CR>

" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" let g:hardtime_default_on = 1
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}

" Disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
