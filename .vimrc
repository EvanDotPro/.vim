" This is Evan's Vim configuration
" More info may eventually be available at http://www.evan.pro/

" Let's use the sexy lucius color theme
colors lucius

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


"""""""" STATUS / COMMAND LINE

" Always put a status line in, even if there is only one window
set laststatus=2

" Make command line two lines high
set ch=2

" Set the status line the way i like it
"set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]\ %{fugitive#statusline()}
