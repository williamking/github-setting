filetype plugin indent on
syntax enable
syntax on
set tabstop=4
set number
set ruler
set t_Co=256
set cursorline
set cursorcolumn
autocmd VimEnter * NERDTree
" 设置NerdTree
map <F2> :NERDTreeMirror<CR>
map <F2> :NERDTreeToggle<CR>
map  :silent! NERDTreeToggle
call pathogen#infect()
set cindent
set expandtab
set shiftwidth=4
"powerline {
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'
"}
let NERDTreeShowBookmarks=1
autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  
 
highlight CursorLine cterm=none ctermbg=236
highlight CursorColumn cterm=none ctermbg=236

" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_key='g<C-n>'
let g:multi_cursor_start_word_key='<C-n>'
 
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
"""定义函数SetTitle，自动插入文件头 
function! SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: william") 
        call append(line(".")+2, "    > Mail: williamjwking@gmail.com") 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if &filetype == 'js'
        call append(line("."). "    > File name: ".expand("%"))
        call append(line(".")+1, "    > Author: william")
        call append(line(".")+2, "    > Mail: williamjwking@gmail.com")
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunction

"JavaBrowser
let Javabrowser_Use_Icon = 1
let JavaBrowser_Use_Highlight_Tag = 1

map <F10> :JavaBrowser<CR> 
imap <F10> <ESC><F11>

setlocal omnifunc=javacomplete#Complete 
" Only do this part when compiled with support for autocommands. 
if has("autocmd") 
   autocmd Filetype java setlocal omnifunc=javacomplete#Complete 
endif
