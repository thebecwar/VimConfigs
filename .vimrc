" Required for Vundle
set nocompatible
filetype off

let mapleader = "\<Tab>"
let maplocalleader = "\<Tab>"

" Watch for changes outside the environment
set autoread

set termguicolors
set encoding=utf-8

"initialize vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/plugins')
" Let Vundle manage vundle (required)
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'ryanoasis/vim-webdevicons'
Plugin 'henrik/vim-indexed-search'
Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'groenewege/vim-less'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'digitaltoad/vim-jade'
Plugin 'fidian/hexmode'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'gabrielelana/vim-markdown'
Plugin 'vim-utils/vim-interruptless'
Plugin 'dense-analysis/ale'
Plugin 'stephenway/postcss.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'hashivim/vim-terraform'
Plugin 'mhinz/vim-mix-format'
Plugin 'ervandew/supertab' 
Plugin 'diepm/vim-rest-console'
Plugin 'tpope/vim-obsession'
Plugin 'mhinz/vim-startify'
Plugin 'frioux/vim-regedit'
Plugin 'Konfekt/FastFold'
Plugin 'mbbill/undotree'
" Plug 'Valloric/YouCompleteMe'
" UI

" Colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasiser/vim-code-dark'

call vundle#end()
filetype plugin indent on


" Configure NerdTree
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
\ }
let NERDTreeShowHidden = 1
" NERDTreeFixes
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_autoclose = 1
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_synchronize_view = 1
let g:NERDTreeNodeDelimiter = "\u00a0"

"Airline
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols = {}
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#buffer_nr_show = 1

"vim-javascript
let g:javascript_plugin_jsdoc = 1
set foldlevelstart=99

"FastFold
augroup languageFolding
    autocmd!
    autocmd FileType json set foldmethod=syntax
    autocmd FileType javascript set foldmethod=syntax
    autocmd FileType yaml set foldmethod=syntax
augroup END
let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1

"vim-jsdoc
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_return = 1 "Add the @return tag.
nnoremap <leader>d :JsDoc<CR>

" gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_escape_grep = 1
augroup gitguttter
  autocmd!
  autocmd BufWritePost * GitGutter
augroup END

" ALE
let g:ale_linters = {
\   'javascript': ['tsserver'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\}
let g:ale_completion_enabled=1
set completeopt+=noinsert

let g:solarized_termcolors=256

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction


" VSCode Integration
command! OpenCwdInVSCode execute "silent !code \"" . getcwd() . "\" --goto \"" . expand("%") . ":" . line(".") . ":" . col(".") . "\"" | redraw!

" Terminal spawn commands
command! Cmd execute "silent :term ++close cmd"
command! Wsl execute "silent :term ++close wsl.exe"
command! Pwsh execute "silent :term ++close powershell -ExecutionPolicy Bypass"
command! -nargs=* Mongo execute "silent :term ++close mongo \<args>"
command! W w

function! BnSkipTerm()
  let start_buffer = bufnr('%')
  bn
  while &buftype ==# 'terminal' && bufnr('%') != start_buffer
    bn
  endwhile
endfunction

command! -nargs=1 OpenScratch execute "silent new | setlocal buftype=nofile noswapfile | f <args>"

function! CollapseFunctions()
  %g/function/normal zc
endfunction

command! -nargs=0 BDAll silent bufdo bd

"""""""""""""""""""""""""""""""""
" KEY MAPPINGS
"""""""""""""""""""""""""""""""""

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

noremap <C-n> :NERDTreeTabsToggle<CR>

" Fast macro access
noremap <F1> @q
noremap <F2> @w
noremap <F3> @e
noremap <F4> @r

nnoremap <F5> :OpenCwdInVSCode<CR>
nnoremap <F6> :nohlsearch<CR>
nnoremap <F7> :UndotreeToggle<CR>
nnoremap <F8> :call CollapseFunctions()<CR>

noremap <F9> :TagbarToggle<CR>
nnoremap <F10> :GitGutterLineHighlightsToggle<CR>
noremap <F11> :BDAll<CR>
nnoremap <F12> :OpenScratch temp<CR>

" fzf file search settings
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :GFiles<CR>
nnoremap <C-b> :Gblame<CR>
nnoremap <C-s> :Rg<Space>

" Some cheaty mappings
" nnoremap <C-j> a<CR><esc>$
nnoremap <S-Enter> O<esc>

" Cheap ripoff of the surround plugin
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>
vnoremap <leader>( <esc>`<i(<esc>`>la)<esc>
vnoremap <leader>{ <esc>`<i{<esc>`>la}<esc>
vnoremap <leader>/ di/*  */<esc>2hP
nnoremap <leader>/ I//<esc>

" some helpers for functions
onoremap in( :<C-u>normal! f(vi(<cr>
onoremap il( :<C-u>normal! F(vi(<cr>
onoremap an( :<C-u>normal! f(va(<cr>
onoremap al( :<C-u>normal! F(va(<cr>
onoremap in[ :<C-u>normal! f[vi[<cr>
onoremap il[ :<C-u>normal! F[vi[<cr>
onoremap an[ :<C-u>normal! f[va[<cr>
onoremap al[ :<C-u>normal! F[va[<cr>
onoremap in' :<C-u>normal! f'vi'<cr>
onoremap il' :<C-u>normal! F'vi'<cr>
onoremap an' :<C-u>normal! f'va'<cr>
onoremap al' :<C-u>normal! F'va'<cr>

onoremap in{ :<C-u>execute "normal! /{\rvi{"<cr>
onoremap an{ :<C-u>execute "normal! /{\rva{"<cr>

" Cheap buffer navigation
nnoremap <silent> <leader>bq :bdelete %<CR>
nnoremap <silent> <leader>bh :bprevious<CR>
nnoremap <silent> <leader>bl :call BnSkipTerm()<CR>

" Cheap line movement
nnoremap <leader>- ddp
nnoremap <leader>= ddkP


augroup commentary
    autocmd!
    " Python doesn't actually have multiline comments
    autocmd FileType python vnoremap <buffer> <leader>/ <NOP>
    autocmd FileType python nnoremap <buffer> <leader>/ I#<esc>
augroup end
" I NEED TO BREAK MY BAD HABITS
inoremap <Up> <NOP>
inoremap <Down> <NOP>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
""""""""""""""""""""""""""""""

" set highlighted search mode
set hlsearch

" move tmp files out to another directory. Double slash is so that the
" files are named with a prefix. (So you can open c:\a.txt and c:\b\a.txt)
set bdir=$HOME/_vimtmp//
set dir=$HOME/_vimtmp//

" Syntax Highlighting
syntax on
colorscheme solarized

" Default Window Sizing
if has("gui_running")
    set guifont=Hack_NF:h10:cANSI:qDRAFT
    augroup fullscreen
        autocmd!
        autocmd GUIEnter * simalt ~x
    augroup END
endif

" Make backspace work more 'normally'
set backspace=indent,eol,start

" Use Hybrid numbering while active in normal mode. When in insert, or 
" if the buffer doesn't have focus then use absolute numbering
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" Tabs Suck
set tabstop=4
set shiftwidth=4
set shiftround
set autoindent
set smarttab smartindent
set expandtab

" and now to do some language-specific tab settings
augroup languagetabs
    autocmd!
    autocmd BufRead,BufNewFile *.gyp set filetype=json
    autocmd BufRead,BufNewFile *.gypi set filetype=json

    autocmd FileType json set tabstop=2 shiftwidth=2
    autocmd FileType javascript set tabstop=2 shiftwidth=2
    autocmd FileType yaml set tabstop=2 shiftwidth=2
augroup END


" From Sensible.vim
set wildmenu
set incsearch
if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif

" Is this 1970? Why do I need it to ding.
set visualbell 
set t_vb=
" no really I don't want a freaking bell or a freaking flash
autocmd GUIEnter * set visualbell t_vb=

