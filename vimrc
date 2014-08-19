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

" Somewhat destructive, but I don't use marks, so I think I can afford making
" jumps to marks a little bit more keypress to get to
nnoremap ' :
vnoremap ' :
nnoremap <Leader>' '
vnoremap <Leader>' '

nnoremap <Leader>m @@

" Make yank behavior more consistent with D, C
map Y y$

" Undo all changes to one line...why?  Try to map to something useful
nmap U <nop>

" I have never used Ex mode, and likely never will.  Type in commands with no
" feedback?  Try to map to something useful.
nmap Q <nop>
nmap gQ <nop>

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
NeoBundle 'mustache/vim-mustache-handlebars'

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

" Let's make custom text objects
NeoBundle 'kana/vim-textobj-user'

" try: cic, dac, daC (aC includes whitespace)
NeoBundle 'glts/vim-textobj-comment'
" try: ci_, da_
NeoBundle 'lucapette/vim-textobj-underscore'
" i, a, for function params
NeoBundle 'sgur/vim-textobj-parameter'
" i/ a/ for the last search (remember dot formula: n. n. n.)
NeoBundle 'kana/vim-textobj-lastpat'
" ie ae for whole buffer - hey, ya never know...
NeoBundle 'kana/vim-textobj-entire'

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

" --------------------------------------------------------------------
" From Salman: possibly experimental/stuff I don't actually want to use
" --------------------------------------------------------------------

" e.g. gpi' replaces contents of quote with sys clipboard
function! PasteOverMotion( type )
  let command = ":\<c-u>set paste\<cr>gv\"_c\<c-r>+\<esc>:set nopaste\<cr>"
  if ( len( a:type ) == 1 )
    silent execute "normal! " . command
  else
    if ( a:type == 'line' )
      silent execute "normal! '[V']" . command
    elseif ( a:type == 'block' )
      " This is not likely as it can only happen from visual mode, for which the mapping isn't defined anyway
      silent execute "normal! `[\<c-v>`]" . command
    else
      silent exe "normal! `[v`]" . command
    endif
  endif
endfunction
nmap <silent> gp :set opfunc=PasteOverMotion<cr>g@
vmap <silent> gp :<c-u>call PasteOverMotion( visualmode() )<CR" Escapes the input string so it's safe for use in a search.

" For example:  echo MakeSafeForSearch( 'a b[]' ) results in 'a\_s\+b\[\]' (without the quotes).
function! MakeSafeForSearch( input )
  return substitute( escape( a:input, '$*^[]~\/.' ), '\_s\+', '\\_s\\+', 'g' )
endfunction

" Sets the search register and adds the value that was set to the search command's history.
function! SetSearchRegister( value )
  let @/ = a:value
  call histadd( '/', a:value )
  call HighlightSearchResults()
endfunction

" This is a function that will turn on the highlighting of search results IF 'hlsearch' is set but temporarily disabled through a call to :nohlsearch.
" May 24, 2011: it doesn't actually work... Can't really be done from a function, apparently, though a command can.
function! HighlightSearchResults()
  if ( &hlsearch )
    set hlsearch
  endif
endfunction

" Defines an operator (<Leader>/) that will search for the specified text.
function! SetSearch( type )
  let saveZ      = @z
  if a:type == 'line'
    '[,']yank z
  elseif a:type == 'block'
    " This is not likely as it can only happen from visual mode, for which the mapping isn't defined anyway
    execute "normal! `[\<c-v>`]\"zy"
  else
    normal! `[v`]"zy
  endif
  call SetSearchRegister( MakeSafeForSearch( @z ) )
  let @z = saveZ
  set hlsearch
endfunction
nnoremap <leader>/ :set opfunc=SetSearch<cr>g@

" Sometimes, you want to copy/paste code for people, that's indented.  Use
" this - <Leader>y - instead of "+y, to include in the clipboard the text with
" common whitespace stripped (bonus: less characters to type)
function! CopyWithoutIndent( type )
  if ( len( a:type ) == 1 )
    let lineStart = line( "'<" )
    let lineEnd   = line( "'>" )
  else
    let lineStart = line( "'[" )
    let lineEnd   = line( "']" )
  endif
  let lowIndent = indent( lineStart )
  for i in range( lineStart + 1, lineEnd )
    " Ignore completely blank lines.
    if ( getline( i ) =~ '^\s*$' )
      continue
    endif
    if ( indent( i ) < lowIndent )
      let lowIndent = indent( i )
    endif
  endfor
  let result = []
  for i in range( lineStart, lineEnd )
    call add( result, substitute( getline( i ), '^ \{' . lowIndent . '}', '', '' ) )
  endfor
  let @+ = join( result, "\<NL>" )
endfunction
"nmap <silent> gy :set opfunc=CopyWithoutIndent<cr>g@
"vmap <silent> gy :<c-u>call CopyWithoutIndent( visualmode() )<CR>
nmap <silent> <Leader>y :set opfunc=CopyWithoutIndent<cr>g@
vmap <silent> <Leader>y :<c-u>call CopyWithoutIndent( visualmode() )<CR>
