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

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vim/.vimrc<cr>
" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vim/.vimrc
autocmd! bufwritepost .vimrc NERDTreeToggle|NERDTreeToggle


"""""""" STATUS / COMMAND LINE

" Always put a status line in, even if there is only one window
set laststatus=2

" Make command line two lines high
set ch=2

" Set the status line the way i like it
"set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]\ %{fugitive#statusline()}


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
