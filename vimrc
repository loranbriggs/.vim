"##############################################################################
" Set up Vundle
" To install bundles:
"
"   :BundleInstall
"
"##############################################################################
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" Bundles
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'

filetype plugin indent on     " required for vundle

"##############################################################################
" Editor settings
"##############################################################################
set number
let mapleader="," " change the mapleader from \ to ,

set backspace=indent,eol,start  " allow backspacing over in insert mode
set ruler                       " show line and column
set tabstop=2                   " a tab is x spaces
set shiftwidth=2                " number of spaces to use for autoindenting
set expandtab                   " use spaes instead of tabs
set autoindent
set shiftround                  " use multiple of shiftwidth with '<' and '>'
function! Tabwidth4()
    set tabstop=4
    set shiftwidth=4
endfunction
function! Tabwidth2()
    set tabstop=2
    set shiftwidth=2
endfunction
set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search is all lowercase,
set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
set wildignore=*.swp,*.bak,*.pyc,*.class
set noerrorbells                " don't beep
set nobackup

set colorcolumn=80              " indicates 80 character wide

set lines=40 columns=95
set directory=~/tmp/

"##############################################################################
" Color Themes
"##############################################################################

function! LightTheme()
  set background=light
  colorscheme solarized
endfunction

function! DarkTheme()
  colorscheme molokai
  let g:molokai_original = 1
endfunction


"##############################################################################
" GUI settings
"##############################################################################

set mouse=a

if &t_Co >= 256 || has("gui_running")
  " set background=light
  " colorscheme solarized
endif

if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

if has("gui_running")               " Set font if runing in GUI
    if has("gui_macvim")
      set guifont=Courier\ New:h16
    else
      set guifont=Monospace\ 12
      set guioptions-=m               " remove menu
      set guioptions-=T               " remove toolbar
      vnoremap <C-X> "+x
      vnoremap <C-C> "+y
      vnoremap <C-V> "+gP
      noremap <C-Q> <C-V>
      set paste
      vmap <C-v> c<ESC>"+p
      imap <C-v> <ESC>"+pa
    endif
endif

set list
set listchars=tab:>.,trail:!,extends:#,nbsp:!    " shows tabs and trailing sp
autocmd filetype html,xml set listchars-=tab:>.

"##############################################################################
" key maping
"##############################################################################
" map colon(:) to semi-colon(;)
nnoremap ; :
imap ;; <Esc>
imap <S-Tab> <C-d>
nmap <silent> ,/ :nohlsearch<CR>
cmap w!! w !sudo tee % >/dev/null
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
map tt :tabnew<CR>
map td :tabclose<CR>
map th :tabprevious<CR>
map tl :tabnext<CR>
map <leader>f /def<CR>

" pressing < or > will indent/unident
vnoremap < <gv
vnoremap > >gv

" Use ctrl-[hjkl] to select the active split
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

" open NERD tree on start up, switch to main window
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd BufEnter * NERDTreeMirror

