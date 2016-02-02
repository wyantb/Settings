set nocompatible              " be iMproved, required

" Easier to access than the default \
let mapleader = " "

" required, before bundle
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Comment things out, e.g. with gcc motion
Plugin 'tpope/vim-commentary'

" Popup as you go autocomplete
Plugin 'Valloric/YouCompleteMe'

" Snippets, snippets, snippets
Plugin 'SirVer/ultisnips'
" Overrides...executing a command and returning to insert?  don't care
let g:UltiSnipsExpandTrigger="<C-o>"
let g:UltiSnipsJumpForwardTrigger="<C-o>"
let g:UltiSnipsEditSplit="vertical"
" This...somehow manages to avoid conflict with <BS>.  Sweetness.
let g:UltiSnipsJumpBackwardTrigger="<C-h>"
let g:UltiSnipsSnippetsDir=$HOME."/.dotfiles/snippets"
let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME."/.dotfiles/snippets"]

" Better basic syntax for javascript
Plugin 'jelera/vim-javascript-syntax'
" And better indentation, highlighting
Plugin 'pangloss/vim-javascript'
" Syntax for mustache too
Plugin 'mustache/vim-mustache-handlebars'

" Syntax highlight for markdown files
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1

" http://ternjs.net/ explains better than I can
Plugin 'marijnh/tern_for_vim'
nnoremap <Leader>g :TernDef<CR>
nnoremap <Leader>r :TernRefs<CR>

" Allows for repeating of plugin movement keys (sneak, surround)
Plugin 'tpope/vim-repeat'

" A good medium range movement key (replaces 's')
Plugin 'justinmk/vim-sneak'
let g:sneak#streak = 1
" nmap s :redr<CR><Plug>(SneakStreak)
" nmap S :redr<CR><Plug>(SneakStreakBackward)

" Replaces s with the 'surround' movement
Plugin 'tpope/vim-surround'

" I like :Gblame
Plugin 'tpope/vim-fugitive'

" A few small supplements to netrw
"  Try '-', for example, to open to current file/dir in netrw
Plugin 'tpope/vim-vinegar'

" Ctrl-direction can navigate either vim or tmux splits
Plugin 'christoomey/vim-tmux-navigator'

" CtrlP - Awesome show-as-you-type file searching
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules|yuidoc|projects\/war\/war|projects\/pages\/reports|javascripts-min|javascripts-prod|javascripts-min-prod|3rdparty|swagger_scripts|licenses|classes|assets\/dist|projects\/adminwar\/war)$',
  \ 'file': '\v\.(exe|so|dll|class|orig|swp)$',
  \ 'link': '',
  \ }

" Faster CtrlP matching
" http://blog.patspam.com/2014/super-fast-ctrlp
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore node_modules
      \ --ignore .class
      \ -g ""'

" Faster CtrlP matching
Plugin 'FelikZ/ctrlp-py-matcher'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" My colorscheme
"  forked from: Plugin 'nielsmadan/harlequin'
Plugin 'wyantb/harlequin'

" Handy dealing with minified files from a random source
Plugin 'tony/vim-jsbeautify'
command! JsBeautify call JsBeautify()

" Let's make custom text objects
Plugin 'kana/vim-textobj-user'

" try: cic, dac, daC (aC includes whitespace)
Plugin 'glts/vim-textobj-comment'
" try: ci_, da_
Plugin 'lucapette/vim-textobj-underscore'
" i, a, for function params
Plugin 'sgur/vim-textobj-parameter'
" i/ a/ for the last search (remember dot formula: n. n. n.)
Plugin 'kana/vim-textobj-lastpat'
" ie ae for whole buffer - hey, ya never know...
Plugin 'kana/vim-textobj-entire'


" highligts best letters for fFtT on the current line
Plugin 'unblevable/quick-scope'

" Language specific bits, otherwise uninteresting
Plugin 'groenewege/vim-less'
Plugin 'jnwhiteh/vim-golang'
Plugin 'Blackrush/vim-gocode'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" The basics
set nocompatible
syntax on
set number
" nvim has mouse behaviors enabled; I honestly don't use mouse for vim, would
" prefer the default gnome-terminal behavior (to e.g. let my copy/paste stuff
" from the statusline)
set mouse=

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

" syntax of these languages is fussy over tabs vs spaces
autocmd FileType make setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType go   setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Sometimes, you have some insane file that you need to open, and you really,
" really don't want syntax highlighting and stuff hosing your system
function! OptimizeSpeed()
  setlocal syntax=
  setlocal nohlsearch
  setlocal t_Co=0
  if g:qs_enable
    QuickScopeToggle
  endif
endfunction
function! OptimizeDefault()
  syntax on
  set hlsearch
  set t_Co=256
  if !g:qs_enable
    QuickScopeToggle
  endif
endfunction
command! OptimizeSpeed call OptimizeSpeed()
command! OptimizeDefault call OptimizeDefault()

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

" Somewhat destructive, but I don't use marks much, so I think I can afford making
" jumps to marks a little bit more keypress to get to
nnoremap ' :
vnoremap ' :
nnoremap <Leader>' '
vnoremap <Leader>' '

" Setting some automatic Marks for different filetypes
" Thanks https://www.reddit.com/r/vim/comments/41wgqf
autocmd BufLeave *.css,*.less,*scss       normal! mC
autocmd BufLeave *.html,*.hbr,*.hbs       normal! mH
autocmd BufLeave *.js                     normal! mJ
autocmd BufLeave Gruntfile.js             normal! mG
autocmd BufLeave *.xml                    normal! mX
autocmd BufLeave build.xml                normal! mB
autocmd BufLeave *.properties             normal! mP
autocmd BufLeave vimrc,*.vim              normal! mR
autocmd BufLeave *.java                   normal! mV

" Easier trigger for repeating previously-used macro
nnoremap <Leader>m @@

" Make yank behavior more consistent with D, C
map Y y$

" Undo all changes to one line...why?  Try to map to something useful
nmap U <nop>

" I have never used Ex mode, and likely never will.  Type in commands with no
" feedback?  Try to map to something useful.
nmap Q <nop>
nmap gQ <nop>

" Colors!
"  To experiment, try tabbing through - :color [Tab][Tab][Tab] (etc)
" color slate " what I used before 256 colors
set t_Co=256
set background=dark
color harlequin-wyantb

" Empty out trailing whitespace on save (nice w/ my snippets that may introduce
" spaces)
function! TrimTrailingWhitespace()
    " Remembering cursor location courtesy of
    " http://unix.stackexchange.com/a/75438
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e       " clear out whitespace (possibly moving cursor)
    call cursor(l, c) " and go back to original pos
endfunction
command! TrimTrailingWhitespace call TrimTrailingWhitespace()
autocmd FileType c,cpp,java,php,javascript,html,less autocmd BufWritePre <buffer> :call TrimTrailingWhitespace()

" Experimental and various commands to remember

command! RemoveDups :g/^\(.*\)$\n\1$/d
" :sort u - sorts all the lines in the current file
"   http://vim.wikia.com/wiki/Uniq_-_Removing_duplicate_lines

" --------------------------------------------------------------------
" From Salman: possibly experimental/stuff I don't actually want to use
" --------------------------------------------------------------------

" Returns a dictionary that can be passed to functions#RestoreMarks to restore the specified marks. For example, calling with "<>" can be used to save and
" restore the visual mode marks.
"
" Unused marks return [ 0, 0, 0, 0 ] which will delete them when next passed to functions#RestoreMarks, which seems correct. To ignore unused marks, pass in 1
" for the optional argument. Note that ignoring unused marks will not delete them when they are next restored.
function! SaveMarks( marks, ... )
  let marks             = substitute( a:marks, '\s\+', '', 'g' )
  let ignoreUnusedMarks = exists( "a:1" ) ? a:1 : 0
  let result = {}
  let i      = 0
  while ( i < len( marks ) )
    let mark    = marks[ i ]
    let markPos = getpos( "'" . mark )
    if ( !ignoreUnusedMarks || markPos != [ 0, 0, 0, 0 ] )
      let result[ mark ] = getpos( "'" . mark )
    endif
    let i += 1
  endwhile
  return result
endfunction
function! RestoreMarks( markDictionary )
  for mark in keys( a:markDictionary )
    let coordinates = a:markDictionary[ mark ]
    call setpos( "'" . mark, coordinates )
  endfor
endfunction

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
"   See |autocmd-searchpat| I think?  :nohls doesn't play well with this, but
"   if you just have a key that toggles like set hls!, it works out.
function! HighlightSearchResults()
  if ( &hlsearch )
    set hlsearch
  endif
endfunction

" Defines an operator (<Leader>/) that will search for the specified text.
function! SetSearch( type )
  let saveZ      = @z
  let savedMarks = SaveMarks('<>')
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
  call RestoreMarks(savedMarks)
endfunction
nnoremap <leader>/ :set opfunc=SetSearch<cr>g@

" Sometimes, you want to copy/paste code for people, that's indented.  Use
" this - <Leader>y / <Leader>Y - instead of "+y, to include in the clipboard the text with
" common whitespace stripped (bonus: less characters to type)

function! GetLinesWithoutIndent( start, end )
  let lowIndent = indent( a:start )
  for i in range( a:start + 1, a:end )
    " Ignore completely blank lines.
    if ( getline( i ) =~ '^\s*$' )
      continue
    endif
    if ( indent( i ) < lowIndent )
      let lowIndent = indent( i )
    endif
  endfor
  let result = []
  for i in range( a:start, a:end )
    call add( result, substitute( getline( i ), '^ \{' . lowIndent . '}', '', '' ) )
  endfor
  return result
endfunction

function! CopyWithoutIndent( type )
  if ( len( a:type ) == 1 )
    let lineStart = line( "'<" )
    let lineEnd   = line( "'>" )
  else
    let lineStart = line( "'[" )
    let lineEnd   = line( "']" )
  endif
  let result = GetLinesWithoutIndent( lineStart, lineEnd )
  let @+ = join( result, "\<NL>" )
endfunction
nmap <silent> <Leader>y :set opfunc=CopyWithoutIndent<cr>g@
vmap <silent> <Leader>y :<c-u>call CopyWithoutIndent( visualmode() )<CR>

function! CopyFileLinesWithoutIndent( type )
  if ( len( a:type ) == 1 )
    let lineStart = line( "'<" )
    let lineEnd   = line( "'>" )
  else
    let lineStart = line( "'[" )
    let lineEnd   = line( "']" )
  endif
  let info = expand( "%:p" )
  if ( lineEnd - lineStart == 0 )
    let info .= ', line ' . lineStart . ':'
  else
    let info .= ', lines ' . lineStart . '-' . lineEnd . ':'
  endif
  let lines = GetLinesWithoutIndent( lineStart, lineEnd )
  let @+ = join( [ info, "" ] + lines, "\<NL>" )
endfunction
nmap <silent> <Leader>Y :set opfunc=CopyFileLinesWithoutIndent<cr>g@
vmap <silent> <Leader>Y :<c-u>call CopyFileLinesWithoutIndent( visualmode() )<CR>

" From Salman: commands for converting text to have spaces, ALL_CAPS,
" dash-joins, etc

function! CamelizeText( text )
  let result = a:text
  " Make sure it isn't already camel-cased.
  if ( match( result, '[_\- ]' ) >= 0 )
    let result = substitute( tolower( result ), '[_\- ]\([a-z]\)', '\u\1', 'g' )
  endif
  return result
endfunction
" Converts 'anInterestingPhrase' or 'an interesting phrase' to 'AN_INTERESTING_PHRASE'.
function! MakeConstant( text )
  return toupper( substitute( substitute( a:text, '\C\([^A-Z]\)\([A-Z]\)', '\1_\2', 'g' ), '[[:space:]_\-]\+', '_', 'g' ) )
endfunction
function! ManipulateMotion( type, searchString, replacementString )
  if a:type == 'line'
    let command = "S/" . a:searchString . "/" . a:replacementString . "/g"
    silent execute "'[,']" . command
    return
  elseif a:type == 'block'
    " This is not likely as it can only happen from visual mode, for which the mapping isn't defined anyway
    silent exe "normal! `[\<C-V>`]"
  else
    silent exe "normal! `[v`]"
  endif
  execute "normal! \"xc\<c-r>=substitute(@x,'" . a:searchString . "','" . a:replacementString . "','g')\<cr>\<esc>"
endfunction

" From
" the quick red fox jumped over the lazy brown dogs
" To
" theQuickRedFoxJumpedOverTheLazyBrownDogs
function! CamelizeMotion( type )
  call ManipulateMotion( a:type, '.*', '\=CamelizeText(submatch(0))' )
endfunction
nmap <silent> <leader>xa :set opfunc=CamelizeMotion<cr>g@

" From
" the quick red fox jumped over the lazy brown dogs
" To
" TheQuickRedFoxJumpedOverTheLazyBrownDogs
function! CamelizeWithCapitalMotion( type )
  call ManipulateMotion( a:type, '.*', '\=substitute(CamelizeText(submatch(0)), ".", "\\U\\0", "")' )
endfunction
nmap <silent> <leader>xf :set opfunc=CamelizeWithCapitalMotion<cr>g@

" From
" the quick red fox jumped over the lazy brown dogs
" To
" THE_QUICK_RED_FOX_JUMPED_OVER_THE_LAZY_BROWN_DOGS
function! ConstantizeMotion( type )
  call ManipulateMotion( a:type, '.*', '\=MakeConstant(submatch(0))' )
endfunction
nmap <silent> <leader>xo :set opfunc=ConstantizeMotion<cr>g@

" From
" the quick red fox jumped over the lazy brown dogs
" To
" the_quick_red_fox_jumped_over_the_lazy_brown_dogs
function! SnakeCaseMotion( type )
  call ManipulateMotion( a:type, '.*', '\=tolower(MakeConstant(submatch(0)))' )
endfunction
nmap <silent> <leader>xu :set opfunc=SnakeCaseMotion<cr>g@

" From
" TheQuickRedFoxJumpedOverTheLazyBrownDogs
" To
" the quick red fox jumped over the lazy brown dogs
function! WordifyMotion( type )
  call ManipulateMotion( a:type, '.*', '\=tolower(substitute(MakeConstant(submatch(0)), "_", " ", "g"))' )
endfunction
nmap <silent> <leader>xw :set opfunc=WordifyMotion<cr>g@
