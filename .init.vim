call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'junegunn/vim-easy-align'
Plug 'gregsexton/MatchTag'
Plug 'vim-ruby/vim-ruby'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs' " plugin for auto-close
Plug 'Yggdroot/indentLine'
Plug 'kchmck/vim-coffee-script'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'ruanyl/vim-gh-line'
Plug 'tpope/vim-unimpaired'
Plug 'ck3g/vim-change-hash-syntax'
Plug 'FooSoft/vim-argwrap'
Plug 'tpope/vim-endwise'
Plug 'jelera/vim-javascript-syntax'
Plug 'tpope/vim-haml'
Plug 'w0rp/ale'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wakatime/vim-wakatime'
Plug 'wikitopian/hardmode'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rhysd/clever-f.vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-rhubarb'
Plug 'rakr/vim-one'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'fvictorio/vim-extract-variable'
Plug 'dracula/vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'sickill/vim-monokai'
Plug 'icymind/NeoSolarized'
call plug#end()

let g:deoplete#enable_at_startup = 1
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

syntax enable

set background=light
colorscheme onehalflight

" Basic setiings
highlight Comment gui=italic
highlight Comment cterm=italic
highlight htmlArg gui=italic
highlight htmlArg cterm=italic
highlight htmlArg cterm=italic
set autoread
set termguicolors
set clipboard=unnamed " copy to system clipboard

" set ruler
set nowrap         " don't wrap lines
set tabstop=2      " a tab is two spaces
set shiftwidth=2   " an autoindent (with <<) is two spaces
set softtabstop=2  " if we have smart tabs, treat like hard tabs
set expandtab      " Use spaces instead of tags
set list           " Show invisible characters
set lazyredraw
set ttyfast

set synmaxcol=256
syntax sync minlines=256

" Change buffer whitout saving
set hidden

set number
set noswapfile
set splitright
set splitbelow
set smartcase
set ignorecase
set incsearch
set hlsearch

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

" set wildmenu " enhanced command line completion
set showcmd " show incomplete commands
" set wildmode=list:longest " complete files like a shell

set so=7 " set 7 lines to the cursors - when moving vertical
set scrolloff=3 " lines of text around cursor
set title " set terminal title
let mapleader      = ' '
let maplocalleader = ' '
map <silent><Leader>o :only<CR>

map <C-T> :FZF<CR>
map <Leader>b :Buffers <CR>
map <Leader>c :Commits <CR>
map <Leader>t :BTags <CR>
map <Leader>ur :History <CR>
imap <C-f> <plug>(fzf-complete-line)

"Easy align config
vmap <Enter> <Plug>(EasyAlign)

" NERDtree
map <silent><leader>n :NERDTreeToggle<CR>
map <silent><leader>- :NERDTreeFind<cr>
let NERDTreeShowHidden=0
let g:nerdtree_tabs_focus_on_files = 1

let g:NERDTreeWinSize=35

let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 30
let g:NERDTreeWinPos = "right"

let g:NERDTreeQuitOnOpen=0

"Fugitive
set diffopt+=vertical
map <Leader>gs :Gstatus<CR>
map <Leader>gd :Gdiff<CR>
map <Leader>gw :Gwrite<CR>
map <Leader>gr :Gread<CR>
map <Leader>gL :GV!<CR>
map <Leader>gl :GV<CR>
map <Leader>gb :Gblame<CR>

" ctags
nnoremap <leader>s :tag <C-R><C-W><CR><Left>
" hit ,f to find the definition of the current class
" this uses ctags. the standard way to get this is Ctrl-]
nnoremap <silent><leader>f <C-]>
" use ,F to jump to tag in a vertical split
nnoremap <silent><leader>F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>

"spelling
autocmd BufRead,BufNewFile *.markdown setlocal spell
autocmd BufRead,BufNewFile *.gitcommit setlocal spell
 " autocmd BufRead,BufNewFile *.md setlocal spell

" Make it obvious where 100 characters is
set textwidth=100
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

set sidescroll=1

let Grep_Skip_Dirs = '.git log tmp'

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
let ruby_no_expensive = 1
" let ruby_fold = 1

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

" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" Sign Column made by solarized color is strange, clear it.
highlight clear SignColumn
" vim-gitgutter will use Sign Column to set its color, reload it.
call gitgutter#highlight#define_highlights()

let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

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

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

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

let g:surround_113 = "#{\r}"   " v
let g:surround_35  = "#{\r}"   " #

let g:surround_45 = "<% \r %>"    " -
let g:surround_61 = "<%= \r %>"   " =

nnoremap <silent> <leader>a :ArgWrap<CR>

nnoremap  <leader>B :<c-u>exe "colors" (g:colors_name =~# "dark"
    \ ? substitute(g:colors_name, 'dark', 'light', '')
    \ : substitute(g:colors_name, 'light', 'dark', '')
    \ )<cr>

" Quickly select the text that was just pasted. This allows you to, e.g.,
" indent it after pasting.
noremap gV `[v`]
" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
vnoremap < <gv
vnoremap > >gv

autocmd BufRead,BufNewFile *.axlsx set filetype=ruby
au BufNewFile,BufRead *.arb			set ft=ruby

noremap ; :

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

let g:deoplete#enable_at_startup = 1


let g:lightline = {
  \   'colorscheme': 'one',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
	\   'component': {
	\     'lineinfo': ' %3l:%-2v',
	\   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }

function! RubocopAutocorrect()
  execute "!rubocop -a " . bufname("%")
endfunction

map <silent> <Leader>cop :call RubocopAutocorrect()<cr>

" ale
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

let g:neosolarized_italic = 1
let g:neosolarized_vertSplitBgTrans = 1
