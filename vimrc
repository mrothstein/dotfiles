let g:python_host_prog = 'usr/local/bin/python'
let g:python3_host_prog = 'usr/local/bin/python3'
let g:OmniSharp_server_path = '~/.omnisharp/omnisharp.http-linux-x64/omnisharp/OmniSharp.exe'

if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
  Plug 'junegunn/vim-easy-align'
  Plug 'OmniSharp/omnisharp-vim'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'mhartington/oceanic-next'
  Plug 'ntpeters/vim-better-whitespace'
  call plug#end()
endif

let mapleader=','
inoremap jk <esc>
syntax on

"
" Plugin related configurations
"

" Whitespace plugin (npeters/vim-better-whitespace)
noremap <leader>ws :StripWhitespace<cr>
let g:better_whitespace_enabled=1
let g:better_whitespace_filetypes_blacklist=['log', 'txt']
let g:strip_only_modified_lines=0
let g:current_line_whitespace_disabled_soft=1

" Colorscheme (mhartington/oceanic-next)
colorscheme OceanicNext


" https://github.com/pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1

"
" General Configurations
"

" Simple set commands
set backspace=2
set backupdir=~/.vim/backup/
set directory=~/.vim/swapfiles//
set expandtab
set hidden
set ignorecase
set noerrorbells
set number
set shiftwidth=2
set smartcase
set softtabstop=2
set showmatch
set showcmd
set smartindent
set tags=./tags;.tags;
set wildmenu
set wildmode=list:longest


"
" Remapping
"
nnoremap <leader><space> :let @/=''<cr> " clear search
nnoremap <leader>f <c-f>
nnoremap <leader>r <c-b>
nnoremap <leader>w <c-w>w
nnoremap <leader>bn :bn<cr>
" Source the vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" Edit the vimrc file
nnoremap <leader>ev :e $MYVIMRC<cr>
" Edit from directory of current file
nnoremap <leader>e :e <C-R>=expand("%:p:h")."/"<cr>
nnoremap <leader>s :vsp <C-R>=expand("%:p:h")."/"<cr>
cabbr <expr> %% expand('%:p:h')
nnoremap tt :tabn<cr>
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

