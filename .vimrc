" set our tabs to four spaces
set ts=2

set number
" turn syntax highlighting on by default
syntax on

" set auto-indenting on for programming
set ai
set autoindent
set cindent
set shiftwidth=2

" turn off compatibility with the old vi
set nocompatible

" turn on the "visual bell" - which is much quieter than the "audio blink"
set vb

" do not highlight words when searching for them. it's distracting.
set nohlsearch

" automatically show matching brackets. works like it does in bbedit.
set showmatch

" do NOT put a carriage return at the end of the last line! if you are programming
" for the web the default will cause http headers to be sent. that's bad.
set binary noeol

" make that backspace key work the way it should
set backspace=indent,eol,start

" ruby indenting
if has("autocmd")
  filetype indent on
endif

nmap <C-h> :tabprevious <cr>
nmap <C-l> :tabnext <cr>
