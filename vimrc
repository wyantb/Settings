" The basics
set nocompatible
syntax on
set number

" Easier to access than the default \
let mapleader = " "

" Search stuffs
set hlsearch    " highlight searches
set incsearch   " do incremental searching
set showmatch   " jump to matches when entering regexp
set ignorecase  " ignore case when searching
set smartcase   " no ignorecase if Uppercase char present

" Clear highlighted search when redrawing screen, without moving cursor
nnoremap <CR> :nohls<CR>

" Saving as sudo if I forget to start as sudo
cmap w!! w !sudo tee > /dev/null %

" Backup files in Vim have never helped me, only annoyed, disable them
set nobackup
set noswapfile

" With enough plugins and macros, not redrawing while in progress really does
" help
set lazyredraw

set visualbell t_vb = " turn off error beep/flash
set novisualbell      " turn off visual bell

set undolevels=200

" Highlights line#, underlines line @ cursor
set cursorline

" So you want spaces, not tabs?
function! SpaceTab()
  set nopaste
  set autoindent
  set softtabstop=2

  set expandtab
  set ts=2
  set sw=2
endfunction
command! SpaceTab call SpaceTab()
command! TwoSpace call SpaceTab()

" Four spaces, not tabs, not 2, 4!
function! FourSpace()
  set nopaste
  set autoindent
  set softtabstop=4

  set expandtab
  set ts=4
  set sw=4
endfunction
command! FourSpace call FourSpace()

" So you want tabs, not spaces?
function! RealTab()
  set nopaste
  set autoindent
  set softtabstop=0

  set noexpandtab
  set ts=2
  set sw=2
endfunction
command! RealTab call RealTab()

" syntax of these languages is fussy over tabs Vs spaces
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

command! FormatJSON %!python -m json.tool

" Do it manually to start
set autoindent
set expandtab
set softtabstop=4
set ts=4
set sw=4

" Make backspance handle everything it should
set backspace=indent,eol,start

" Show chars in place of normal tabs
set list listchars=tab:→\ ,trail:·

" Scroll padding
set scrolloff=5

" Vim 7.4 combined nu/rnu behavior wins over toggling
set number
set relativenumber

" And when we leave buffers, just keep the numbers absolute
au BufEnter * set rnu
au BufLeave * set nornu

set foldmethod=manual

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

" Reload vimrc
map <Leader>v :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo '\nvimrc reloaded'"<CR>

" Load NeoBundle - https://github.com/Shougo/neobundle.vim
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'  " NeoBundle itself

" Popup as you go autocomplete
NeoBundle 'Valloric/YouCompleteMe'

" Snippets, snippets, snippets
NeoBundle 'SirVer/ultisnips'
" Overrides...executing a command and returning to insert?  don't care
let g:UltiSnipsExpandTrigger="<C-o>"
let g:UltiSnipsJumpForwardTrigger="<C-o>"
let g:UltiSnipsEditSplit="vertical"
" This...somehow manages to avoid conflict with <BS>.  Sweetness.
let g:UltiSnipsJumpBackwardTrigger="<C-h>"
let g:UltiSnipsSnippetsDir=$HOME."/.dotfiles/snippets"
let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME."/.dotfiles/snippets"]


" Better basic syntax for javascript
NeoBundle 'jelera/vim-javascript-syntax'
" And better indentation, highlighting
NeoBundle 'pangloss/vim-javascript'
" Syntax for mustache too
NeoBundle 'juvenn/mustache.vim'

" Syntax highlight for markdown files
NeoBundle 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1

" http://ternjs.net/ explains better than I can
NeoBundle 'marijnh/tern_for_vim'
nnoremap <Leader>g :TernDef<CR>
nnoremap <Leader>r :TernRefs<CR>

" Allows for repeating of plugin movement keys (sneak, surround)
NeoBundle 'tpope/vim-repeat'

" A good medium range movement key (replaces 's')
NeoBundle 'justinmk/vim-sneak'
let g:sneak#streak = 1
" nmap s :redr<CR><Plug>(SneakStreak)
" nmap S :redr<CR><Plug>(SneakStreakBackward)

" Replaces s with the 'surround' movement
NeoBundle 'tpope/vim-surround'

" I like :Gblame
NeoBundle 'tpope/vim-fugitive'

" A few small supplements to netrw
"  Try '-', for example, to open to current file/dir in netrw
NeoBundle 'tpope/vim-vinegar'

" Ctrl-direction can navigate either vim or tmux splits
NeoBundle 'christoomey/vim-tmux-navigator'

" CtrlP - Awesome show-as-you-type file searching
NeoBundle 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules|yuidoc|projects\/war\/war|projects\/pages\/reports|javascripts-min|javascripts-prod|javascripts-min-prod|3rdparty|swagger_scripts|licenses|classes|assets\/dist|projects\/adminwar\/war)$',
  \ 'file': '\v\.(exe|so|dll|class|orig|swp)$',
  \ 'link': '',
  \ }

" My colorscheme
"  forked from: NeoBundle 'nielsmadan/harlequin'
NeoBundle 'wyantb/harlequin'

" Colors!
"  To experiment, try tabbing through - :color [Tab][Tab][Tab] (etc)
" color slate " what I used before 256 colors
set t_Co=256
set background=dark
color harlequin-wyantb

" Required by NeoBundle
filetype plugin indent on

" Empty out trailing whitespace on save (nice w/ my snippets that may introduce
" spaces)
function! TrimTrailingWhitespace()
    " Remembering cursor location courtesy of
    " http://unix.stackexchange.com/a/75438
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e       " clear out whitespace (possibly moving cursor)
    call cursor(l, c) " and go back to original pos
:endfunction
command! TrimTrailingWhitespace call TrimTrailingWhitespace()
autocmd FileType c,cpp,java,php,javascript,html autocmd BufWritePre <buffer> :call TrimTrailingWhitespace()

" Experimental and various commands to remember

command! RemoveDups :g/^\(.*\)$\n\1$/d
" :sort u - sorts all the lines in the current file
"   http://vim.wikia.com/wiki/Uniq_-_Removing_duplicate_lines

" vnew - opens a new buffer, vertically split from current one

" TODO these don't work.  Snippets instead?
" Inspired by http://oli.me.uk/2013/06/29/equipping-vim-for-javascript
" What do these two do?  Basically, type something such as {}, which should
"  get content in the middle.  C-k and bam, spaced according to your normal
"  indenting and has a semicolon after it.
"  (Note: requires exact cursor placement)
" Overrides...entering a digraph?  I may regret this someday
" inoremap <Ctrl-k> <Esc>i<CR><Esc>A;<Esc>O
" Overrides...going to normal mode?  Don't care
" inoremap <Ctrl-l> <Esc>i<CR><Esc>O

