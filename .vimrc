" The basics
filetype plugin on
syntax on
set number
set hlsearch
set nocompatible

set undolevels=200

" So you want spaces, not tabs?
function SpaceTab()
  set autoindent
  set smartindent

  set expandtab
  set ts=2
  set sw=2
endfunction
command SpaceTab call SpaceTab()
command TwoSpace call SpaceTab()

" Four spaces, not tabs, not 2, 4!
function FourSpace()
  set autoindent
  set smartindent

  set expandtab
  set ts=4
  set sw=4
endfunction
command FourSpace call FourSpace()

" So you want tabs, not spaces?
function RealTab()
  set autoindent
  set smartindent

  set noexpandtab
  set ts=2
  set sw=2
endfunction
command RealTab call RealTab()

function NoTab()
  " Clear out the above automagic
  set noai
  set nosi
endfunction
command NoTab call NoTab()

" Do it manually to start
set autoindent
set smartindent
set expandtab
set ts=4
set sw=4

" Delete indents, eol, start
set bs=2

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Modified up/down on wrapped lines
nnoremap j gj
nnoremap k gk

" Enter clears highlighted search
nnoremap <CR> :nohls<CR>/<BS>

" Show chars in place of normal tabs
set list listchars=tab:→\ ,trail:·

" Consider
" highlight SpecialKey term=standout ctermbg=yellow guibg=yellow

" Scroll padding
set scrolloff=5

" Use Tab to swap rnu/nu
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

highlight Folded ctermbg=darkgray ctermfg=yellow cterm=bold

" Start up pathogen
execute pathogen#infect()

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules|yuidoc|projects\/war\/war|reports)$',
  \ 'file': '\v\.(exe|so|dll|class)$',
  \ 'link': '',
  \ }

" CtrlP  https://github.com/kien/ctrlp.vim
nnoremap <C-N> :CtrlPMixed<CR>

