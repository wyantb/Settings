" The basics
set nocompatible
syntax on
set number

" Colors!
"  To experiment, try tabbing through - :color [Tab][Tab][Tab] (etc)
color slate

" Search stuffs
set hlsearch    " highlight searches
set incsearch   " do incremental searching
set showmatch   " jump to matches when entering regexp
set ignorecase  " ignore case when searching
set smartcase   " no ignorecase if Uppercase char present

" Enter clears highlighted search
nnoremap <CR> :nohls<CR>/<BS>

set visualbell t_vb = " turn off error beep/flash
set novisualbell      " turn off visual bell

set undolevels=200

" Highlights line#, underlines line @ cursor
set cursorline

" Easier to access than the default \
let mapleader = " "

" So you want spaces, not tabs?
function SpaceTab()
  set nopaste
  set autoindent
  set softtabstop=2

  set expandtab
  set ts=2
  set sw=2
endfunction
command SpaceTab call SpaceTab()
command TwoSpace call SpaceTab()

" Four spaces, not tabs, not 2, 4!
function FourSpace()
  set nopaste
  set autoindent
  set softtabstop=4

  set expandtab
  set ts=4
  set sw=4
endfunction
command FourSpace call FourSpace()

" So you want tabs, not spaces?
function RealTab()
  set nopaste
  set autoindent
  set softtabstop=0

  set noexpandtab
  set ts=2
  set sw=2
endfunction
command RealTab call RealTab()

" Do it manually to start
set autoindent
set expandtab
set softtabstop=4
set ts=4
set sw=4

" Make backspance handle everything it should
set backspace=indent,eol,start

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Modified up/down on wrapped lines
nnoremap j gj
nnoremap k gk

" Show chars in place of normal tabs
set list listchars=tab:→\ ,trail:·

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

" Thank you Reddit
"   http://www.reddit.com/r/vim/comments/1kgx0q/status_line_in_vim/cbp0uly
" See also :help statusline
set laststatus=2               " Always display a statusline
set statusline=%<\             " begins with whitespace
set statusline+=%t             " filename
set statusline+=\              " whitespace
set statusline+=%m             " modified
set statusline+=%r             " read-only
set statusline+=%y             " filetype
set statusline+=%w             " preview
set statusline+=%=             " split
set statusline+=Col:\ \%c      " column number
set statusline+=\              " whitespace
set statusline+=Lin:\ \%l\/\%L " line number/total
set statusline+=\              " ends with whitespace

" Load NeoBundle - https://github.com/Shougo/neobundle.vim
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'  " NeoBundle itself

" Better basic syntax for javascript
NeoBundle 'jelera/vim-javascript-syntax'

" http://ternjs.net/ explains better than I can
NeoBundle 'marijnh/tern_for_vim'
nnoremap <Leader>g :TernDef<CR>
nnoremap <Leader>r :TernRefs<CR>

" CtrlP - Awesome show-as-you-type file searching
NeoBundle 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules|yuidoc|projects\/war\/war|reports)$',
  \ 'file': '\v\.(exe|so|dll|class)$',
  \ 'link': '',
  \ }
nnoremap <C-N> :CtrlPMixed<CR>

" Required by NeoBundle
filetype plugin indent on

" Experimental and various commands to remember

command RemoveDups :g/^\(.*\)$\n\1$/d
" :sort u - sorts all the lines in the current file
"   http://vim.wikia.com/wiki/Uniq_-_Removing_duplicate_lines

" vnew - opens a new buffer, vertically split from current one

