"" VUNDLE
set nocompatible	" be iMproved
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
        Plugin 'rhysd/vim-clang-format.git'
        Plugin 'vim-airline/vim-airline-themes'
        Plugin 'Valloric/YouCompleteMe.git'
        Plugin 'SirVer/ultisnips.git'
        Plugin 'Rip-Rip/clang_complete.git'
        Plugin 'Townk/vim-autoclose.git'
        Plugin '907th/vim-auto-save.git'
        Plugin 'honza/vim-snippets.git'
        Plugin 'tomtom/tcomment_vim'
        Plugin 'vim-syntastic/syntastic'
        Plugin 'terryma/vim-multiple-cursors.git'
        Plugin 'VundleVim/Vundle.vim'
        Plugin 'scrooloose/nerdtree.git'
        Plugin 'Xuyuanp/nerdtree-git-plugin'
        Plugin 'vim-airline/vim-airline'
        Plugin 'hdima/python-syntax.git'
        Plugin 'NLKNguyen/papercolor-theme.git'
call vundle#end()
filetype plugin indent on
" clang format
map <C-l> :ClangFormat<CR>

" PaperColor Theme
set t_Co=256
set background=dark
colorscheme PaperColor

let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }

" vim auto-save
let g:auto_save = 1
let g:auto_save_no_updatetime = 1
" let g:auto_save_in_insert_mode = 0

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:ycm_show_diagnostics_ui = 0 " fix YCM & syntastic
" vim-airline
set laststatus=2
let g:airline_theme='powerlineish'

" clang_complete
let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif

" UltiSnips
let g:UltiSnipsSnippetDirectories=["~/.vim/my-snippets"]

" Trigger UltiSnips by <Enter>
let g:UltiSnipsExpandTrigger = "<nop>"
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "\<C-R>=ExpandSnippetOrCarriageReturn()\<CR>" : "\<CR>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" NERDTree
map <C-f> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

function! s:CloseIfOnlyControlWinLeft()
  if winnr("$") != 1
    return
  endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        \ || &buftype == 'quickfix'
    q
  endif
endfunction
augroup CloseIfOnlyControlWinLeft
  au!
  au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END
" comfortable mouse control
function MouseRun()
 	if &mouse=="a"
		:set mouse=""
		echo "unset mouse"
 	else
 		:set mouse=a
		echo "set mouse"
            endif
endfunction
map <C-M> :call MouseRun()<CR>

"" General
set number	                    " Show line numbers
set linebreak	                " Break lines at word (requires Wrap lines)
set showbreak=+++	            " Wrap-broken line prefix
set textwidth=100	            " Line wrap (number of cols)

set hlsearch	                " Highlight all search results
set smartcase	                " Enable smart-case search
set ignorecase	                " Always case-insensitive
set incsearch	                " Searches for strings incrementally

set autoindent	                " Auto-indent new lines
set cindent	                    " Use 'C' style program indenting
set expandtab	                " Use spaces instead of tabs
set shiftwidth=4	            " Number of auto-indent spaces
set smartindent	                " Enable smart-indent
set smarttab	                " Enable smart-tabs
set softtabstop=4	            " Number of spaces per Tab

"" Advanced
syntax on                       " syntax highlight
set whichwrap+=<,>,h,l,[,]      " great wrapping
set completeopt-=preview        " Remove the preview window after autocompletion
set ruler	                    " Show row and column ruler information
set undolevels=1000	            " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour
set encoding=utf-8              " choose encoding
