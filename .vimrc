" have pathogen load all plugins
call pathogen#runtime_append_all_bundles()

" Filetype stuff
filetype on
filetype plugin on
filetype indent on

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set smartindent
set expandtab

" set the search scan to wrap lines
set wrapscan

" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" Make command line two lines high
set ch=2

" set visual bell -- i hate that damned beeping
set vb

" make backspace work as expected
set backspace=2

" allow buffers to have unsaved changes
set hidden

" Set the status line the way i like it
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]\ %{fugitive#statusline()}

" use :w!! to sudo save a file
cmap w!! %!sudo tee > /dev/null %

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2


" This is the timeout used while waiting for user input on a multi-keyed macro
" or while just sitting and waiting for another key to be pressed measured
" in milliseconds.
set timeoutlen=500

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8


" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" disable vi compatibility
set nocompatible

" make sure syntax highlighting is on
syntax on

" Set 7 lines to the curors - when moving vertical..
set so=7

" show what mode we're in
set showmode

" Make the command-line completion better
set wildmenu

" Make default register the system clipboard
set clipboard=unnamed

" PHP-specific stuff
let php_sql_query=1                                                                                        
let php_htmlInStrings=1
let php_parent_error_close = 1
let php_parent_error_open = 1
"let php_folding = 1
autocmd BufWrite *.php :%s/[ \t\r]\+$//e
autocmd BufWrite *.phtml :%s/[ \t\r]\+$//e
inoremap <C-l> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-l> :call PhpDocSingle()<CR>
vnoremap <C-l> :call PhpDocRange()<CR> 

" highlight the current line
set cursorline

" show line numbers and make them a tolerable color
set number
" highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" cool thing to show what you're replacing
set cpoptions+=$

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving
nmap <leader>w :w!<cr>

" close a buffer
nmap <leader>q :Bclose<cr>
nmap <C-x> :Bclose<CR>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vim/.vimrc<cr>

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

" When vimrc is edited, reload it
"autocmd! bufwritepost .vimrc source ~/.vim/.vimrc

" omni completion
set ofu=syntaxcomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

colorscheme lucius
set guifont=Monospace\ 9

"set guioptions-=l
set guioptions-=b
set guioptions-=r
set guioptions-=T  "remove toolbar

set textwidth=120

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=100 columns=171
endif

" Intelligent tab completion
inoremap <silent> <Tab> <C-r>=<SID>InsertTabWrapper(1)<CR>
inoremap <silent> <S-Tab> <C-r>=<SID>InsertTabWrapper(-1)<CR>
function! <SID>InsertTabWrapper(direction)
  let idx = col('.') - 1
  let str = getline('.')
  if a:direction > 0 && idx >= 2 && str[idx - 1] == ' '
        \&& str[idx - 2] =~? '[a-z]'
    if &softtabstop && idx % &softtabstop == 0
      return "\<BS>\<Tab>\<Tab>"
    else
      return "\<BS>\<Tab>"
    endif
  elseif idx == 0 || str[idx - 1] !~? '[a-z]'
    return "\<Tab>"
  elseif a:direction > 0
    return "\<C-p>"
  else
    return "\<C-n>"
  endif
endfunction


"-----------------------------------------------------------------------------
" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
" Toggle the NERD Tree on an off with F7
nmap <F7> :NERDTreeToggle<CR>

" Close the NERD Tree with Shift-F7
nmap <S-F7> :NERDTreeClose<CR>


" Store the bookmarks file in perforce
"let NERDTreeBookmarksFile="~/.vim/NERDTreeBookmarks"

" Show the bookmarks table on startup
"let NERDTreeShowBookmarks=1

let NERDTreeShowHidden=1
let NERDTreeIgnore=['\._git$', '\._gitignore$']

" Auto open nerdTree where i want...
autocmd VimEnter * cd /srv/dropbox
autocmd VimEnter * NERDTree
autocmd VimEnter * Alias git Git
autocmd VimEnter * wincmd p

"-----------------------------------------------------------------------------
" Tabbar Plugin Settings
"-----------------------------------------------------------------------------
" Yup, I don't like this one either
"let loaded_minibufexplorer = 1
nmap <F8> :MiniBufEpl<CR>
let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
let g:miniBufExplModSelTarget = 1 " If you use other explorers like TagList you can (As of 6.2.8) set it at 1:
let g:miniBufExplUseSingleClick = 1 " If you would like to single click on tabs rather than double clicking on them to goto the selected buffer. 
let g:miniBufExplMaxSize = 3 " <max lines: defualt 0> setting this to 0 will mean the window gets as big as needed to fit all your buffers. 

autocmd BufRead,BufNew,BufWritePost,CursorMovedI,CursorMoved * UMiniBufExplorer


map <leader>u :TMiniBufExplorer<cr>:TMiniBufExplorer<cr>

" I like it like irssi
set switchbuf=usetab
map <C-p> :bprev<CR>
map <C-n> :bnext<CR>
"-----------------------
" Taglist
" ----------------------
nmap <F6> :TlistToggle<CR>
let g:Tlist_Use_Right_Window=1
let g:Tlist_Show_One_File=1

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>


" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction



function! ToggleWrap()
    set wrap!
    echo &wrap ? 'wrap' : 'nowrap'
endfunc

"F12 toggles wrap (Thanks to Alexandre Moreira)
nnoremap <silent> <F12>      :call ToggleWrap()<CR>
vnoremap <silent> <F12> <C-C>:call ToggleWrap()<CR>
inoremap <silent> <F12> <C-O>:call ToggleWrap()<CR>


function! ToggleHorizontalScrollbar()
    "set guioptions+=b
    if &go =~# "b"
        set go-=b
    else
        set go+=b
    endif
endfunc

function! ToggleHorizontalScrollbar_setKeys()
    "Shift+F12 toggles the horizontal scrollbar
    nnoremap <silent> <S-F12>      :call ToggleHorizontalScrollbar()<CR>
    vnoremap <silent> <S-F12> <C-C>:call ToggleHorizontalScrollbar()<CR>
    inoremap <silent> <S-F12> <C-O>:call ToggleHorizontalScrollbar()<CR>
endfunc

au GUIEnter * call ToggleHorizontalScrollbar_setKeys()
