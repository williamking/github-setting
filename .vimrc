filetype plugin on
syntax enable
syntax on
set tabstop=4
set number:
set ruler
set t_Co=256
set cursorline
set cursorcolumn
autocmd VimEnter * NERDTree
map  :silent! NERDTreeToggle
let NERDTreeShowBookmarks=1
 
highlight CursorLine cterm=none ctermbg=236
highlight CursorColumn cterm=none ctermbg=236
