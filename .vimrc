" Required for Vundle
set nocompatible
filetype off

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
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'nanotech/jellybeans.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'ryanoasis/vim-webdevicons'
Plugin 'eddsteel/vim-vimbrant'
Plugin 'henrik/vim-indexed-search'
Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'groenewege/vim-less'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'digitaltoad/vim-jade'
Plugin 'fidian/hexmode'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'sheerun/vim-polyglot'
" Plug 'joonty/vdebug' " Uncomment when you need dbugger
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'tobyS/vmustache'
Plugin 'fatih/vim-go'
Plugin 'slashmili/alchemist.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'jalvesaq/Nvim-R'
Plugin 'gabrielelana/vim-markdown'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'janko-m/vim-test'
Plugin 'tpope/vim-dispatch'
Plugin 'vim-utils/vim-interruptless'
Plugin 'w0rp/ale'
Plugin 'crusoexia/vim-monokai'
Plugin 'posva/vim-vue'
Plugin 'stephenway/postcss.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'hashivim/vim-terraform'
Plugin 'mhinz/vim-mix-format'
Plugin 'ervandew/supertab'
Plugin 'diepm/vim-rest-console'
Plugin 'tpope/vim-obsession'
Plugin 'frioux/vim-regedit'
" Plug 'Valloric/YouCompleteMe'
" Plug 'ternjs/tern_for_vim' "Once installed: cd ~/.vim/bundle/tern_for_vim/ && npm install
" UI

" Colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasiser/vim-code-dark'


call vundle#end()
filetype plugin indent on

" Configure NerdTree
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "m",
    \ "Staged"    : "s",
    \ "Untracked" : "u",
    \ "Renamed"   : "r",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "x",
    \ "Dirty"     : "d",
    \ "Clean"     : "c",
    \ "Unknown"   : "?"
    \ }
let NERDTreeShowHidden = 0
" NERDTreeFixes
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_autoclose = 1
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_synchronize_view = 1
let g:NERDTreeNodeDelimiter = "\u00a0"

" gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_escape_grep = 1
autocmd BufWritePost * GitGutter

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction


"""""""""""""""""""""""""""""""""
" KEY MAPPINGS
"""""""""""""""""""""""""""""""""

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <C-n> :NERDTreeTabsToggle<CR>

" Fast macro access
map <F1> @w
map <F2> @e
map <F3> @r
map <F4> @t
" HexMode
map <F9> :Hexmode<CR>
" Tagbar
map <F10> :TagbarToggle<CR>
nmap <F11> :GitGutterLineHighlightsToggle<CR>

" fzf file search settings
nmap <C-p> :Files<CR>
nnoremap <C-s> :Rg<Space>



""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
""""""""""""""""""""""""""""""


" move tmp files out to another directory. Double slash is so that the
" files are named with a prefix. (So you can open c:\a.txt and c:\b\a.txt)
set bdir=$HOME/_vimtmp//
set dir=$HOME/_vimtmp//

" Syntax Highlighting
syntax on
colorscheme solarized

" Default Window Sizing
if has("gui_running")
  set lines=38 columns=157
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

