" configure Vundle
filetype on " without this vim emits a zero exit status, later, because of :ft off
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

" install Vundle bundles
call vundle#begin()
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif
call vundle#end()

" color scheme
syntax enable
syntax on
colorscheme solarized

" settings
set nocompatible
set hidden
set smartindent
set autoindent
set mouse=a
set number                " set line numbers
set relativenumber            " set relative line numbers
set listchars=tab:▸\ ,trail:▫
set list
set ruler
set ignorecase
set smartcase
set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab
set mouse=a
set history=100
filetype indent on
filetype plugin on
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" keybindings
let mapleader = "\<Space>"
inoremap jf <esc>
inoremap fj <esc>
map <Leader>yy obinding.pry<esc>:w<cr>
map <Leader>i mzgg=G`z<cr>
map <C-i> :NERDTreeToggle<CR>
nnoremap <leader><space> :call whitespace#strip_trailing()<CR>
nmap <silent> <leader>r :VroomRunTestFile<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files. Lightning fast and respects
    " .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif
" bind <C-A> to grep word under cursor
nnoremap <C-A> :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
let g:ctrlp_match_window = 'order:ttb,max:20'

" Delete whitespace function
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    "associate the .es6 file extension with JavaScript
    autocmd BufRead,BufNewFile *.es6 setfiletype javascript
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces() " strip trailing whitespace on save"
