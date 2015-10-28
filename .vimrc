set nocompatible              " be iMproved, required
filetype off                  " required
"set the runtime path to include Vundle and initialize
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/Emmet.vim'
Plugin 'vim-scripts/WebAPI.vim'
Plugin 'vim-scripts/functionlist.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/cscope.vim'
Plugin 'InfoGeeker/html5.vim'
Plugin 'pangloss/vim-javascript'
"Bundle 'autopreview'  

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line
let g:user_emmet_settings = webapi#json#decode(
\  join(readfile(expand('~/.snippets.json')), "\n"))

set ts=4
set shiftwidth=4
set expandtab
set wrapscan
set number
set backspace=start,indent,eol
set t_Co=256
colorscheme wombat256mod
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

let g:phpqa_codesniffer_autorun = 0
let g:phpqa_messdetector_autorun = 0
map <F2> : Flisttoggle <CR> 

let g:neocomplcache_enable_at_startup = 1

"map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
"imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags
set tags+=./tags
set tags+=~/arm/linux-2.6.24.7/tags 
set tags+=./tags
set tags+=~/arm/linux-2.6.24.7/tags

"-- Taglist setting --
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=1 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Process_File_Always=1 "实时更新tags
let Tlist_Inc_Winwidth=0

"-- Cscope setting --
if has("cscope")
    set csprg=/usr/bin/cscope " 指定用来执行cscope的命令
    set csto=0 " 设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库
    set cst " 同时搜索cscope数据库和标签文件
    set cscopequickfix=s-,c-,d-,i-,t-,e- " 使用QuickFix窗口来显示cscope查找结果
    set nocsverb
    if filereadable("cscope.out") " 若当前目录下存在cscope数据库，添加该数据库到vim
        cs add cscope.out
    elseif $CSCOPE_DB != "" " 否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim
        cs add $CSCOPE_DB
    endif
    set csverb
endif
map <F4> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
imap <F4> <ESC>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>


