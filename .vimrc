
" The basics
filetype plugin on
syntax on
set number
set hlsearch
set nocompatible

set undolevels=200

" So you want spaces, not tabs?
function SpaceTab()
  set expandtab
  set ts=2
  set sw=2
endfunction
command SpaceTab call SpaceTab()
command TwoSpace call SpaceTab()

" Do it manually to start
set expandtab
set ts=2
set sw=2

" Four spaces, not tabs, not 2, 4!
function FourSpace()
  set expandtab
  set ts=4
  set sw=4
endfunction
command FourSpace call FourSpace()

" So you want tabs, not spaces?
function RealTab()
  set noexpandtab
  set ts=2
  set sw=2
endfunction
command RealTab call RealTab()

" Do good things with newlines
"  But only so good - see previous 4 functions
set autoindent
set smartindent

" Delete indents, eol, start
set bs=2

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Better up/down on wrapped lines
nnoremap j gj
nnoremap k gk

" Easy way to <Esc>
inoremap jk <Esc>
inoremap kj <Esc>

" Enter clears highlighted search
nnoremap <CR> :nohls<CR>/<BS>

" Show chars in place of normal tabs
set list listchars=tab:→\ ,trail:·

" Consider
" highlight SpecialKey term=standout ctermbg=yellow guibg=yellow

" Scroll padding
set scrolloff=5

" Use Ctrl+p to swap rnu/nu
function! g:ToggleNuMode()
  if &nu == 1
    set rnu
  else
    set nu
  endif
endfunction
nnoremap <silent><Tab> :call g:ToggleNuMode()<cr>

" Navigation keys will wrap around lines
set whichwrap+=<,>,h,l,[,]

" Helper for switching between active buffers
nnoremap <C-N> :buffers<CR>:buffer<Space>
