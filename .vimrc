filetype plugin on
syntax enable
syntax on
set tabstop=4
set number
set ruler
set t_Co=256
set cursorline
set cursorcolumn
autocmd VimEnter * NERDTree
map  :silent! NERDTreeToggle
let NERDTreeShowBookmarks=1
autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  
set softtabstop=4 " 统一缩进为4
set autoindent
set cindent " 自动缩进
set langmenu=zh_CN.UTF-8
set helplang=cn " 语言设置
set completeopt=preview,menu " 代码补全
 
highlight CursorLine cterm=none ctermbg=236
highlight CursorColumn cterm=none ctermbg=236

"新建.c,.h,.sh,.java文件，自动插入文件头 
"autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
"""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    "    if &filetype == 'sh' 
    "            call
    "            setline(1,"\#########################################################################") 
    "                    call append(line("."), "\# File Name: ".expand("%")) 
    "                            call append(line(".")+1, "\# Author: william") 
    "                                    call append(line(".")+2, "\# mail:
    "                                    williamjwking@gmail.com") 
    "                                            call append(line(".")+3, "\#
    "                                            Created Time:
    "                                            ".strftime("%c")) 
    "                                                    call
    "                                                    append(line(".")+4,
    "                                                    "\#########################################################################") 
    "                                                            call
    "                                                            append(line(".")+5,
    "                                                            "\#!/bin/bash") 
    "                                                                    call
    "                                                                    append(line(".")+6,
    "                                                                    "") 
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: william") 
        call append(line(".")+2, "    > Mail: williamjwking@gmail.com ") 
        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
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
    "新建文件后，自动定位到文件末尾
    "    autocmd BufNewFile * normal G
endfunc 
