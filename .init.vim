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
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'kchmck/vim-coffee-script'
Plug 'bling/vim-airline'
Plug 'mattn/emmet-vim'
Plug '29decibel/codeschool-vim-theme'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/neomru.vim'
Plug 'chriskempson/base16-vim'
Plug 'dyng/ctrlsf.vim'
Plug 'gertjanreynaert/cobalt2-vim-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'ngmy/vim-rubocop'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'scrooloose/nerdtree'
Plug 'digitaltoad/vim-jade'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'wikitopian/hardmode'
Plug 'ruanyl/vim-gh-line'
Plug 'junegunn/gv.vim'
Plug 'mhartington/oceanic-next'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-endwise'
Plug 'FooSoft/vim-argwrap'
Plug 'ck3g/vim-change-hash-syntax'
Plug 'fishbullet/deoplete-ruby'
Plug 'christoomey/vim-tmux-navigator'
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'lifepillar/vim-solarized8'
call plug#end()

set termguicolors
autocmd VimEnter * colo solarized8_dark

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
set lazyredraw
set relativenumber
set sidescroll=1
set splitbelow
set splitright

let mapleader      = ' '
let maplocalleader = ' '
map <silent><Leader>o :only<CR>

"Easy align config
vmap <Enter> <Plug>(EasyAlign)

" NERDtree
map <leader>n :NERDTreeToggle<CR>
map <silent><leader>- :NERDTreeFind<cr>
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
" inoremap <up> <nop>
vnoremap <up> <nop>
nnoremap <up> <nop>
" inoremap <down> <nop>
vnoremap <down> <nop>
nnoremap <down> <nop>
" inoremap <left> <nop>
vnoremap <left> <nop>
nnoremap <left> <nop>
" inoremap <right> <nop>
vnoremap <right> <nop>
nnoremap <right> <nop>

" save a file
nnoremap <silent><Leader>, :w<CR>
nnoremap <silent><Leader>q :q<CR>

" switch between current and last buffer
nmap <leader><tab> <c-^>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

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

let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
noremap K :Ag! <C-r>=expand('<cword>')<CR><CR>
" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap \ :Ag<SPACE>

nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" via: http://whynotwiki.com/Vim
" Use v or # to get a variable interpolation (inside of a string)}
" ysiw#   Wrap the token under the cursor in #{}
" v...s#  Wrap the selection in #{}
let g:surround_113 = "#{\r}"   " v
let g:surround_35  = "#{\r}"   " #

" Select text in an ERb file with visual mode and then press s- or s=
" Or yss- to do entire line.
let g:surround_45 = "<% \r %>"    " -
let g:surround_61 = "<%= \r %>"   " =

" ctags
nnoremap <leader>s :tag <C-R><C-W><CR><Left>
" hit ,f to find the definition of the current class
" this uses ctags. the standard way to get this is Ctrl-]
nnoremap <silent><leader>f <C-]>
" use ,F to jump to tag in a vertical split
nnoremap <silent><leader>F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>
" Index ctags from any project, including those outside Rails
function! ReindexCtags()
  let l:ctags_hook = '$(git rev-parse --show-toplevel)/.git/hooks/ctags'

  if exists(l:ctags_hook)
    exec '!'. l:ctags_hook
  else
    exec "!ctags -R ."
  endif
endfunction

nmap <Leader>ct :call ReindexCtags()<CR>

map <Leader>b :Buffers <CR>
map <Leader>ur :History <CR>

map <leader>db :bw<cr>

let g:solarized_term_italics = 2

nnoremap  <leader>B :<c-u>exe "colors" (g:colors_name =~# "dark"
    \ ? substitute(g:colors_name, 'dark', 'light', '')
    \ : substitute(g:colors_name, 'light', 'dark', '')
    \ )<cr>

let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.ruby = ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::']
