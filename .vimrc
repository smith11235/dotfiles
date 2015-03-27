" turn syntax highlighting on by default
syntax on
" turn on line numbering
set number

" do NOT put a carriage return at the end of the last line! if you are programming
" for the web the default will cause http headers to be sent. that's bad.
set binary noeol

" set auto-indenting on for programming
set ai
set autoindent
set cindent
set expandtab
set shiftwidth=2
set ts=2

" turn off compatibility with the old vi
set nocompatible

" turn on the "visual bell" - which is much quieter than the "audio blink"
set vb

" do not highlight words when searching for them. it's distracting.
set nohlsearch

" automatically show matching brackets. works like it does in bbedit.
set showmatch

" make that backspace key work the way it should
set backspace=indent,eol,start

" ruby indenting
if has("autocmd")
  filetype indent on
endif

" Map tab navigation to mirror cursor navigation
" tab left, similar to 'h: move-let'
nmap <C-h> :tabprevious <cr>
" tab right, similar to 'h: move-let'
nmap <C-l> :tabnext <cr>
