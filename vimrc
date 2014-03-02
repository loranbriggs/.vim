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
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'

filetype plugin indent on     " required for vundle

" ##### End Vundle #####

set number

" change the mapleader from \ to ,
let mapleader=","
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set ruler         " show line and column
set tabstop=2     " a tab is x spaces
set shiftwidth=2  " number of spaces to use for autoindenting
set expandtab     " use spaes instead of tabs
set autoindent
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
function! Tabwidth4()
    set tabstop=4
    set shiftwidth=4
endfunction
function! Tabwidth2()
    set tabstop=2
    set shiftwidth=2
endfunction
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set wildignore=*.swp,*.bak,*.pyc,*.class
set noerrorbells  " don't beep
set nobackup

set colorcolumn=80 " indicates 80 character wide
" highlight ColorColumn guibg=firebrick

set lines=40 columns=85
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
nnoremap ;
" map double colong to Esc
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

"##############################################################################
" Smart tab completion
"##############################################################################
function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>

"##############################################################################
" Syntax Highlighting
"##############################################################################

au BufNewFile,BufRead *.ejs set filetype=js
au BufNewFile,BufRead *.ejs set filetype=html

" open NERD tree on start up, switch to main window
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

"##############################################################################
" Easier split navigation
"##############################################################################

" Use ctrl-[hjkl] to select the active split
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>
