"Plugins
call plug#begin()
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sleuth'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'vim-ruby/vim-ruby'
Plug 'ngmy/vim-rubocop' " ruby lint
Plug 'altercation/vim-colors-solarized' "color
Plug 'chriskempson/vim-tomorrow-theme' "color
Plug 'vim-scripts/grep.vim' "search
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'kchmck/vim-coffee-script' " coffescript syntax
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'ntpeters/vim-better-whitespace'
Plug 'gregsexton/MatchTag'
Plug 'cohama/lexima.vim' " plugin for auto-close
Plug 'morhetz/gruvbox' " color
Plug 'gregsexton/gitv'
Plug 'elzr/vim-json'
Plug 'Yggdroot/indentLine'
Plug 'Shougo/neocomplete.vim' "autocompletion
Plug 'bling/vim-airline'
Plug 'jpo/vim-railscasts-theme'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-expand-region'
call plug#end()

set number
set nowrap
set noswapfile
set wildmenu        " visual autocomplete for command menu
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
set ignorecase

if has('gui_running')
" remove gvim menus
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  set guioptions-=M
  set guioptions-=b
  set guioptions-=e
  " set background=light
  colorscheme railscasts
  set guifont=Monaco:h12
endif

" mappings
let mapleader      = ","
let maplocalleader = ","

" Disable arrows
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" git
" status
map <Leader>gs :Gstatus<CR>
" commit
map <Leader>gc :Gcommit<CR>
" diff
map <Leader>gd :Gdiff<CR>
" add current
map <Leader>gw :Gwrite<CR>

" save a file
nnoremap <leader>w :w<CR>
inoremap <leader>w <C-c>:w<CR>

" paste toggle
set pastetoggle=<leader>z

" clone paragrahp with cp
noremap cp yap<S-}>p

"Neocomplete config
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

"Easy align config
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"Fugitive
set diffopt+=vertical

" ctrl-P
nnoremap <Leader>o :CtrlP<CR>
map <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_match_window_bottom   = 0
let g:ctrlp_match_window_reversed = 0

autocmd BufWritePre <buffer> :StripWhitespace

set laststatus=2

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'

" To open a new empty buffer
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

autocmd BufWritePre *.rb,*.erb,*.js,*.css,*.yml,*.rake :%s/\s\+$//e

let g:user_emmet_leader_key='<C-z>'

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

