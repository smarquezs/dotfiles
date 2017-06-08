call plug#begin('~/.vim/plugged')
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
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
Plug '29decibel/codeschool-vim-theme'
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ruanyl/vim-gh-line'
Plug 'junegunn/gv.vim'
Plug 'flazz/vim-colorschemes'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-unimpaired'
Plug 'scwood/vim-hybrid'
Plug 'ck3g/vim-change-hash-syntax'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'FooSoft/vim-argwrap'
Plug 'mhartington/oceanic-next'
Plug 'lifepillar/vim-solarized8'
Plug 'tpope/vim-endwise'
Plug 'thoughtbot/vim-rspec'
Plug 'jgdavey/tslime.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'crusoexia/vim-monokai'
Plug 'roosta/srcery'
Plug 'tpope/vim-haml'
Plug 'w0rp/ale'
Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'
Plug 'wakatime/vim-wakatime'
Plug 'wikitopian/hardmode'
Plug 'trevordmiller/nova-vim'
Plug 'vim-scripts/todo-txt.vim'

" NeoBundle
call plug#end()

autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

syntax enable

" set bg=dark
" colorscheme gruvbox

colorscheme solarized8_light

if has("gui_running")
  set background=light
  colorscheme solarized
  " set gfn=Monaco:h12.5
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set guifont=Inconsolata\ for\ Powerline:h15
  endif
endif

set rop=type:directx,geom:1,taamode:1
set enc=utf-8

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  set t_ut=
endif

" Basic setiings
highlight Comment cterm=italic
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
" set relativenumber

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
" set mouse=a
"
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

map <Leader>b :Buffers <CR>
map <Leader>c :Commits <CR>
map <Leader>ur :History <CR>
imap <C-f> <plug>(fzf-complete-line)
map <leader>db :bw<cr>

"Easy align config
vmap <Enter> <Plug>(EasyAlign)

" NERDtree
map <silent><leader>n :NERDTreeToggle<CR>
map <silent><leader>- :NERDTreeFind<cr>
let NERDTreeShowHidden=0
let g:nerdtree_tabs_focus_on_files = 1

" Make nerdtree look nice
let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" close NERDTree after a file is opened
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

let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='dracula'

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
map <C-P> :FZF<CR>

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

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

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

" let g:lengthmatters_on_by_default = 1
" let g:lengthmatters_start_at_column = 81
"
"
" Gitgutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

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

let g:rspec_command = 'call Send_to_Tmux("\RAILS_ENV=test bundle exec rspec {spec}\n")'

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>r :call RunAllSpecs()<CR>

noremap ; :

" Write this in your vimrc file
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

nnoremap <Leader>: :%s/:\([^ ]*\)\(\s*\)=>/\1:/gc<CR>

nnoremap <Leader>{ :%s/{\([^ ]\)/{ \1/gc<CR>
nnoremap <Leader>} :%s/\([^ ]\)}/\1 }/gc<CR>

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
