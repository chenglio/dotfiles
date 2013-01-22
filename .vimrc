

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" don't be compatible with vi
set nocompatible

set history=50

" set Wrap
set nowrap

" enable number listing
set nu

" set line end to be \n
set ff=unix
set ffs=unix

set makeprg=gmake

" set laststatus=2
set encoding=utf8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable syntax highlighting
syntax enable

" set colorscheme
if has('gui_running')
    colorscheme jellybeans
else
    colorscheme spectro
end


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set vim window width & height
" set lines=50
" set columns=90

" set windows starting position
winpos 200 40

" no annoying error noises
set visualbell 

" try to show at least three lines and two columns of context when
" scrolling
set scrolloff=3
set sidescrolloff=2

" allows to change buffer w/o saving the current
set hidden

" make backspace delete lots of things
set backspace=indent,eol,start

" search options: incremental search, clever case
set incsearch
set ignorecase
set smartcase

" set tab ident
" set tabstop=4
" set shiftwidth=4
" set softtabstop=4
set tabstop=2
set shiftwidth=2
set softtabstop=2

set expandtab
set autoindent
set smartindent

set cursorline
set cursorcolumn

" no toolbar or menu in the GUI, but horizontal scroll
if has('gui_running')
    set guioptions=m        " menubar
    set guioptions-=T       " toolbar
    set guioptions-=l       " lefthand scrollbar always present
    set guioptions-=L       " lefthand scrollbar on v-slit window
    set guioptions-=r       " righthand scrollbar always present
    set guioptions-=R       " righthand scrollbar on v-split window
    set guioptions-=b       " botton scrollbar
"   set guioptions+=h
end


" enable filetype setting
filetype on
if has("autocmd")
   filetype plugin indent on
endif

" set our fonts
" set gfn=Consolas
" set gfn=ProFontWindows:h10
" set gfn=Monaco:h8
set gfn=Bitstream\ Vera\ Sans\ Mono:h10

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" always show current position
"set ruler

" always show status line 
set laststatus=2

" nice status bar
set statusline=
set statusline+=%-3.3n\                     " buffer number
set statusline+=%f\                         " file name
"set statusline+=%y\                         " file type
set statusline+=%([%R%M]%)                  " readonly, modify flags
set statusline+=[%{&encoding}]              " file encoding
set statusline+=[%{&fileformat}]            " file format

"set statusline+=%{&encoding},               " encoding
set statusline+=%=                          " right align
set statusline+=%-10.(%l,%c%V%)\ %<%P       " offset


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set mapping keys
map <F8> <ESC>:set hls!<BAR>set hls?<CR>
map <F2> <ESC>:bp<CR>
map <F3> <ESC>:bn<CR>
map <F4> :Tlist<CR>
nmap <F5> :exec 'vimgrep /\<'.expand('<cword>').'\>/j *'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" create backup
set backup
set bdir=~/.vimbackup

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldnestmax=1
"set foldmethod=indent
set foldmethod=manual

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File extensions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set other file formats
au BufNewFile,BufRead *.mako set filetype=html

"remove trailing blanks on .c .h .cpp files
au FileType c,cpp,h,hpp,py :%s/\s\+$//e

"auto save folding
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

