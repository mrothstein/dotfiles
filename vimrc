" Don't try to be vi compatible
set nocompatible

" pathogen needs to run before plugin indent on 
execute pathogen#infect()

filetype plugin indent on
syntax on
filetype off 

if has("gui_running")
  set lines=65 columns=200
  colorscheme elflord
  set guifont=Monaco\ 11
endif

let mapleader=','
set wildmenu
set wildmode=list:longest

" Turn on line numbers
set number

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Turn off error bells
set noerrorbells

" Searching
"nnoremap / /\v
"vnoremap / /\v
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
"set backupdir=~/.vim/backup/
"set undodir=~/.vim/undo/

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

"autocmd BufNewFile *.pl 0r ~/.vim/skeletons/skeleton.pl autocmd FileType perl nnoremap <buffer> <mapleader>c I#<esc> 
"remove white spaces on read and write of file 
"autocmd Filetype perl autocmd BufWritePre,BufRead <buffer> StripWhitespace 
"turn off better whitespace for log files 
"let g:better_whitespace_filetypes_blacklist=['*.log']

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
