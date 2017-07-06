" Don't try to be vi compatible
set nocompatible

" pathogen needs to run before plugin indent on
execute pathogen#infect()
filetype plugin indent on
filetype off

colorscheme peachpuff

let mapleader=','
set wildmenu
set wildmode=list:longest

" Whitespace plugin config
noremap <leader>ws :StripWhitespace<cr>
let g:better_whitespace_filetypes_blacklist=['log']

" Turn on line numbers
set number

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Turn off error bells
set noerrorbells

set smartcase
set showmatch
set showcmd
map <leader><space> :let @/=''<cr> " clear search

set expandtab
set ignorecase
set shiftwidth=2
set softtabstop=2
set backspace=2
set smartindent
set directory=~/.vim/swapfiles//
set backupdir=~/.vim/backup/
"set undodir=~/.vim/undo/

" Tags
set tags=./tags;.tags;

inoremap jk <esc>
noremap <leader>f <c-f>
noremap <leader>r <c-b>
noremap <leader>w <c-w>w
noremap <leader>bn :bn<cr>
" Source the vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" Edit the vimrc file
nnoremap <leader>ev :vsp $MYVIMRC<cr>
" Edit from directory of current file
nnoremap <leader>e :e <C-R>=expand("%:p:h")."/"<cr>
nnoremap <leader>s :vsp <C-R>=expand("%:p:h")."/"<cr>
cabbr <expr> %% expand('%:p:h')
nnoremap tt :tabn<cr>
nnoremap <leader>cn :cnext<cr>
nnoremap <leader>sb :vsp<cr>:b
nnoremap :small :set columns=100<cr> :set lines=51<cr>
" Set filetype to cpp (for cpp files not ending in .cpp or .hpp)
nnoremap <leader>cpp :set filetype=cpp<cr>
nnoremap <leader>rby :set filetype=cpp<cr>

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

syntax on
