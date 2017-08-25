call plug#begin('~/.config/nvim/plugged')
Plug '29decibel/codeschool-vim-theme'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'FooSoft/vim-argwrap'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ck3g/vim-change-hash-syntax'
Plug 'elixir-lang/vim-elixir'
Plug 'gregsexton/MatchTag'
Plug 'jelera/vim-javascript-syntax'
Plug 'jiangmiao/auto-pairs' " plugin for auto-close
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-gtfo'
Plug 'kana/vim-textobj-user'
Plug 'kchmck/vim-coffee-script'
Plug 'lifepillar/vim-solarized8'
Plug 'mattn/emmet-vim'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'pangloss/vim-javascript'
Plug 'rhysd/clever-f.vim'
Plug 'ruanyl/vim-gh-line'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'w0rp/ale'
Plug 'wakatime/vim-wakatime'
Plug 'wikitopian/hardmode'
" NeoBundle
call plug#end()


syntax enable

colorscheme solarized8_dark

if has("gui_running")
  set background=light
  colorscheme solarized
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set guifont=Inconsolata\ for\ Powerline:h15
  endif
endif

set enc=utf-8

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  set t_ut=
endif

" Basic setiings
highlight Comment gui=italic
highlight Comment cterm=italic
highlight htmlArg gui=italic
highlight htmlArg cterm=italic
set autoread
set clipboard=unnamed " copy to system clipboard
" set ruler
set nowrap         " don't wrap lines
set tabstop=2      " a tab is two spaces
set shiftwidth=2   " an autoindent (with <<) is two spaces
set softtabstop=2  " if we have smart tabs, treat like hard tabs
set expandtab      " Use spaces instead of tabs
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

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

set wildmenu " enhanced command line completion
set showcmd " show incomplete commands

set so=7 " set 7 lines to the cursors - when moving vertical
set scrolloff=3 " lines of text around cursor
set title " set terminal title
let mapleader      = ' '
let maplocalleader = ' '
map <silent><Leader>o :only<CR>

nnoremap <C-t> :Denite file_rec<CR>
nnoremap <Leader>b :Denite buffer<CR>

" Grep
noremap K :DeniteCursorWord grep:.<CR>
nnoremap \ :Denite grep<CR>

" Change mappings.
call denite#custom#map(
      \ 'insert',
      \ '<C-n>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-p>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
\)

"Easy align config
vmap <Enter> <Plug>(EasyAlign)

" NERDtree
map <silent><leader>n :NERDTreeToggle<CR>
map <silent><leader>- :NERDTreeFind<cr>
let NERDTreeShowHidden=0
let g:nerdtree_tabs_focus_on_files = 1

" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
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

if !exists("g:gui_oni")
  autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
endif

set laststatus=2
let g:airline_powerline_fonts = 1

" save a file
nnoremap <silent><Leader>w :w<CR>

" switch between current and last buffer
nmap <leader><tab> <c-^>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

let g:user_emmet_leader_key='<C-Z>'

" Better navigation in long lines
nnoremap j  gj
nnoremap k  gk

nmap <leader>cf <Plug>CtrlSFPrompt
nmap <silent> <BS> :nohlsearch<CR>

" vim-ruby
let ruby_operators    = 1
let ruby_space_errors = 1
let ruby_no_expensive = 1

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

" Sign Column made by solarized color is strange, clear it.
highlight clear SignColumn
" vim-gitgutter will use Sign Column to set its color, reload it.
call gitgutter#highlight#define_highlights()

let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

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

" Gitgutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" ArgWrap
nnoremap <silent> <leader>a :ArgWrap<CR>
let g:argwrap_tail_comma = 1

" Quickly select the text that was just pasted. This allows you to, e.g.,
" indent it after pasting.
noremap gV `[v`]
" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
vnoremap < <gv
vnoremap > >gv

autocmd BufRead,BufNewFile *.axlsx set filetype=ruby
au BufNewFile,BufRead *.arb     set ft=ruby

noremap ; :

" Write this in your vimrc file
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

nnoremap <Leader>: :%s/:\([^ ]*\)\(\s*\)=>/\1:/gc<CR>

nnoremap <Leader>{ :%s/{\([^ ]\)/{ \1/gc<CR>
nnoremap <Leader>} :%s/\([^ ]\)}/\1 }/gc<CR>

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

let g:deoplete#enable_at_startup = 1

let g:solarized_term_italics = 1

let g:gtfo#terminals = { 'mac': 'iterm' }

" Ripgrep command on grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
    \ ['--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
