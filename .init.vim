call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'junegunn/vim-easy-align'
Plug 'gregsexton/MatchTag'
Plug 'vim-ruby/vim-ruby'
Plug 'Yggdroot/indentLine'
Plug 'kchmck/vim-coffee-script'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'scrooloose/nerdtree'
Plug 'ruanyl/vim-gh-line'
Plug 'tpope/vim-unimpaired'
Plug 'ck3g/vim-change-hash-syntax'
Plug 'FooSoft/vim-argwrap'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-haml'
Plug 'dense-analysis/ale'
Plug 'wakatime/vim-wakatime'
Plug 'rhysd/clever-f.vim'
Plug 'tpope/vim-rhubarb'
Plug 'rakr/vim-one'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'fvictorio/vim-extract-variable'
Plug 'hashivim/vim-terraform'
Plug 'ekalinin/Dockerfile.vim'
Plug 'f-person/git-blame.nvim'
Plug 'kdheepak/lazygit.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'elixir-editors/vim-elixir'
Plug 'slim-template/vim-slim'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-mix-format'

" autocomplete
Plug 'sirver/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Elixir
Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'mhinz/vim-mix-format'

" typing
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'

" syntax
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'norcalli/nvim-colorizer.lua'

" Themes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'lifepillar/vim-solarized8'

" Tmux
Plug 'christoomey/vim-tmux-navigator'

" Markdown
Plug 'tpope/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

syntax enable

set background=dark
" autocmd vimenter * ++nested colorscheme solarized8
colorscheme dracula

" colorscheme gruvbox
" let g:gruvbox_contrast_dark = "hard"

highlight Normal ctermbg=NONE

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

" default updatetime 4000ms is not good for async update
" vim-signify
set updatetime=300

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" always show signcolumns
set signcolumn=yes

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

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" coc
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-pairs'
      \ ]

autocmd FileType scss setl iskeyword+=@-@

let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<C-_>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

map <C-P> :FZF<CR>
map <Leader>b :Buffers <CR>
map <Leader>t :BTags <CR>
map <Leader>h :History <CR>
imap <C-f> <plug>(fzf-complete-line)

" HTML, JSX
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'

"Easy align config
vmap <Enter> <Plug>(EasyAlign)

" NERDtree
map <silent><leader>n :NERDTreeToggle<CR>
map <silent><leader>- :NERDTreeFind<cr>
let g:nerdtree_tabs_focus_on_files = 1

let g:NERDTreeWinSize=35
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 30
let g:NERDTreeQuitOnOpen=0
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$']

let $FZF_DEFAULT_OPTS='--layout=reverse'

" setup mapping to call :LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>

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

let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

noremap K :Rg! <C-r>=expand('<cword>')<CR><CR>
nnoremap \ :Rg<SPACE>

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

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

let g:lightline = {
  \   'colorscheme': 'one',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
	\   'component': {
	\     'lineinfo': '√ì√á¬∞ %3l:%-2v',
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
let g:ale_lint_on_text_changed = 1

let g:ale_fixers = { 'elixir': ['mix_format'] }

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>


lua <<EOF
require('lualine').setup({
options = { theme = 'dracula' }
})
EOF
