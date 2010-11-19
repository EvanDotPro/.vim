" This is Evan's Vim configuration
" More info may eventually be available at http://www.evan.pro/

" have pathogen load all plugins
call pathogen#runtime_append_all_bundles()

" Let's use the sexy lucius color theme
colors lucius
set guifont=Monospace\ 9

" Enable loading filetype and indentation plugins
filetype plugin on
filetype indent on

" Omni-competion for all of the languages I use
set ofu=syntaxcomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType phtml set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete

" Improve the omni-completion a bit
set completeopt=longest,menuone
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Turn syntax highlighting on
syntax on

" Make backspace behave as us humans expect it to
set backspace=indent,eol,start

" Use UTF-8 as the default buffer encoding
set enc=utf-8

" Remember up to 100 'colon' commmands and search patterns
set history=100

" Tabs should be 4 spaces please
set tabstop=4
set shiftwidth=4
set smartindent
set expandtab

" set the search scan to wrap lines
set wrapscan

" Enable incremental search
set incsearch

" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" allow buffers to have unsaved changes
set hidden

" Close a bugger
nmap <leader>q :Bclose<cr>

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vim/.vimrc<cr>

autocmd BufWrite * :%s/[ \t\r]\+$//e

" When vimrc is edited, reload it... reload NERDTree to fix color glitch
autocmd! bufwritepost .vimrc NERDTreeToggle|source ~/.vim/.vimrc|NERDTreeToggle

" Highlight the current line
set cursorline

" Show line numbers
set number

" Allow the cursor to go into 'invalid' places
set virtualedit=all

" Cool trick to show what you're replacing/changing
set cpoptions+=$

" Turn off backup stuff
set nobackup
set nowb
set noswapfile

" This shows you what you're doing in a multi-stroke command
set showcmd

" Easy copy and paste
map <leader>v		"+gP
map <leader>c		"+y

" Select all text
nmap <C-a> ggVG

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

"--------------------
" PHP-Specific Stuff
"--------------------
:autocmd FileType php map <C-L> :!php -l %<cr>
set errorformat=%m\ in\ %f\ on\ line\ %l

"-----------------------------------------------------------------------------
" Status and Command Line
"-----------------------------------------------------------------------------
" Always put a status line in, even if there is only one window
set laststatus=2

" Make command line two lines high
set ch=2

" Set the status line the way i like it
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]\ %{fugitive#statusline()}

" Set GUI dimensions
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set guioptions-=T
  set lines=100 columns=171
endif

"-----------------------------------------------------------------------------
" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
" Toggle the NERD Tree on an off with F6
nmap <F6> :NERDTreeToggle<CR>

" Close the NERD Tree with Shift-F6
nmap <S-F6> :NERDTreeClose<CR>

" Store the bookmarks file in perforce
"let NERDTreeBookmarksFile="~/.vim/NERDTreeBookmarks"

" Show the bookmarks table on startup
"let NERDTreeShowBookmarks=1

let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.get$', '\.getempty$'] " this is something custom for me, you can safely remove it

" Auto open nerdTree where i want...
autocmd VimEnter * cd /srv/dropbox
autocmd VimEnter * NERDTree
autocmd VimEnter * Alias git Git
autocmd VimEnter * wincmd p


"------------------
" MiniBufExplorer
"------------------
" make tabs show complete (no broken on two lines)
let g:miniBufExplTabWrap = 1

" If you use other explorers like TagList you can (As of 6.2.8) set it at 1:
let g:miniBufExplModSelTarget = 1

" If you would like to single click on tabs rather than double clicking on them to goto the selected buffer.
let g:miniBufExplUseSingleClick = 1

" <max lines: defualt 0> setting this to 0 will mean the window gets as big as needed to fit all your buffers.
let g:miniBufExplMaxSize = 3

set switchbuf=usetab
map <C-p> :bprev<cr>
map <C-n> :bnext<cr>

" Tweak to make MiniBufExplorer automatically refresh when needed
autocmd BufRead,BufNew,BufWritePost,CursorMovedI,CursorMoved * UMiniBufExplorer
