" Automatic installation:
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tyru/open-browser.vim'

Plug 'majutsushi/tagbar'
Plug 'leafgarland/typescript-vim'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'gabrielelana/vim-markdown'
Plug 'houshuang/vim-rename'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'xolox/vim-notes'

Plug 'plasticboy/vim-markdown'
Plug 'low-ghost/nerdtree-fugitive'
Plug 'junegunn/vim-easy-align'

Plug 'Quramy/tsuquyomi'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-jdaddy'
Plug 'sheerun/vim-json'
Plug 'Shougo/vimproc.vim'
" Plug 'dhruvasagar/vim-table-mode'
Plug 'kassio/neoterm'
Plug 'wellle/targets.vim'
Plug 'scrooloose/nerdtree'
Plug 'kana/vim-textobj-entire'
Plug 'Lokaltog/vim-easymotion'
Plug 'kana/vim-textobj-user'

Plug 'airblade/vim-gitgutter'

Plug 'Shougo/unite.vim'
Plug 'xolox/vim-misc'

Plug 'xolox/vim-easytags'

Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-haystack'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
" Plug 'tpope/vim-vinegar'
Plug 'justincampbell/vim-railscasts'
Plug 'airblade/vim-rooter'
Plug 'sjl/vitality.vim'
Plug 'Shougo/neomru.vim'
Plug 'bling/vim-airline'
Plug 'osyo-manga/unite-airline_themes'
Plug 'Shougo/junkfile.vim'
Plug 'Shougo/unite-help'
Plug 'Shougo/unite-outline'
Plug 'tsukkee/unite-tag'
Plug 'ujihisa/unite-colorscheme'
Plug 'kana/vim-textobj-indent'

Plug 'houshuang/vim-arpeggio' " keychord

Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
Plug 'vim-scripts/transpose-words'

Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'

call plug#end()

"                 --------

" Arpeggio chords
function! s:common()
  Arpeggio inoremap jk <Esc>
  Arpeggio xnoremap jk <Esc>
  Arpeggio vnoremap jk <Esc>
  Arpeggio cnoremap jk <Esc>
  Arpeggio tnoremap jk <c-\><c-n>
endfunction
autocmd VimEnter * call s:common()

let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                        \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']

let mapleader=","
let g:easytags_async="true"
" Quickly edit .vimrc - why isn't this working?
nmap <leader>ev :e ~/.vimrc<CR>

" Easyclip
" let g:EasyClipUseSubstituteDefaults = 1
set clipboard=unnamed
" let g:EasyClipUsePasteToggleDefaults = 0
" let g:EasyClipUseCutDefaults = 0
nnoremap M m$
" nmap x <Plug>MoveMotionPlug
" xmap x <Plug>MoveMotionXPlug
" nmap xx <Plug>MoveMotionLinePlug
" Quicker window movement
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
tnoremap <C-Esc> <Esc>
tmap <Esc> <C-\><C-n>
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
tnoremap <C-Left> <c-\><c-n>:tabprevious<CR>
tnoremap <C-Right> <c-\><c-n>:tabnext<CR>
inoremap <C-Left> <esc>:tabprevious<CR>
inoremap <C-Right> <esc>:tabnext<CR>

autocmd BufWinEnter,WinEnter term://* startinsert
set splitbelow
set splitright

" ,+num to change window number
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

let g:airline#extensions#tabline#enabled = 1

nnoremap <Down> <C-d>zz
nnoremap <Up> <C-u>zz
nnoremap <Left> :bprevious<CR>
nnoremap <Right> :bnext<CR>


" Formatting a paragraph
vmap Q gq
nmap Q gqap

" Stuff left out from vim-sensible
source ~/src/dotfiles/vim-sensible-extended.vim

" Empty line above, below or both, without moving or entering insert-mode
nnoremap gO mzO<Esc>`z
nnoremap go mzo<Esc>`z
nnoremap <A-o> mzO<Esc>`zmzo<Esc>`z

" Buffer menus - TODO find a plugin that does this better? Also use ,b for
" unite
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>

" Colorscheme
colorscheme railscasts

" Fugitive (from
" http://www.reddit.com/r/vim/comments/21f4gm/best_workflow_when_using_fugitive/)
nnoremap <leader>ga :Git add :p:h<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>

" Execute line as vim-script (from
" http://stackoverflow.com/questions/14385998/how-can-i-execute-the-current-line-as-vim-ex-commands)
" nnoremap <F2> :exe getline(".")<CR>
" vnoremap <F2> :<C-w>exe join(getline("'<","'>"),'<Bar>')<CR>


" Unite settings from http://www.codeography.com/2013/06/17/replacing-all-the-things-with-unite-vim.html

" set g:unite_source_history_yank_enable = 1
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>r :CtrlPMRU<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>t :CtrlPTag<CR>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

nnoremap <silent> <f9> :call neoterm#repl#line()<cr> 
vnoremap <silent> <f9> :call neoterm#repl#selection()<cr>
set tildeop
let g:rooter_change_directory_for_non_project_files = 1
let g:rooter_silent_chdir = 1
map <F3> ;NERDTreeToggle<CR>
autocmd VimEnter * if !argc() && !exists("s:std_in")| NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd VimEnter * wincmd p

" Easymotion
" nmap s <Plug>(easymotion-s2)
" nmap t <Plug>(easymotion-t2)
" nmap f <Plug>(easymotion-f2)


let g:vitality_fix_focus = 1
:au FocusLost * <Esc> " not implemented in NeoVim yet
:au FocusGained * <Esc>
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?1004h"
    let &t_te = "\e[?1004l" . &t_te
    map <ESC>[O :w<CR>
endif


command! DiffOrig let g:diffline = line('.') | vert new | set bt=nofile | r # | 0d_ | diffthis | :exe "norm! ".g:diffline."G" | wincmd p | diffthis | wincmd p
nnoremap <Leader>do :DiffOrig<cr>
nnoremap <leader>dc :q<cr>:diffoff<cr>:exe "norm! ".g:diffline."G"<cr>
   
map <M-s> :w<kEnter>  "Works in normal mode, must press Esc first"
imap <M-s> <Esc>:w<kEnter>i "Works in insert mode, saves and puts back in insert mode"

" source vimrc on save
augroup vimrc
    au!
    au BufWritePost *vimrc{,.local} if filereadable(expand('%'))|execute 'source ' . expand('%')|endif
augroup END

nnoremap gr :!osascript -e 'tell application "Google Chrome" to tell the active tab of its first window ' -e 'reload' -e 'end tell'<CR><CR>
" nnoremap / :Commentary<CR>
" xnoremap / :Commentary<CR>

" word wrap instead of character wrap
autocmd FileType * set formatoptions+=t

" easy motion TODO this doesn't work very well, figure out how to make it work
" more intuitively
" map <Space> <Plug>(easymotion-prefix)

nnoremap <Space> <C-F>zz
nnoremap <BS> <C-B>zz

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" make a commented copy of lines, above current lines, normal and visual
nnoremap gy yyP:Commentary<CR>j
vnoremap gy yPV`]:Commentary<CR>`]j^

" from http://vim.wikia.com/wiki/Insert_a_single_character
function! RepeatChar(char, count)
   return repeat(a:char, a:count)
 endfunction
 nnoremap s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
 nnoremap S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

nnoremap Q @@
xnoremap Q :normal @@<CR>

" nnoremap <C-d> :vsp<CR><C-w>l <c-\><c-n>:term cd <C-r>=expand("%:p:h")<CR>; /usr/local/bin/fish<CR>
" nnoremap <C-d> :sp<CR><C-w>l <c-\><c-n>:term cd <C-r>=expand("%:p:h")<CR>; /usr/local/bin/fish<CR>
nnoremap <C-d> :vsp<CR>:term cd <C-r>=expand("%:p:h")<CR>; /usr/local/bin/fish<CR>
nnoremap <C-e> :sp<CR>:term cd <C-r>=expand("%:p:h")<CR>; /usr/local/bin/fish<CR>
noremap <C-q> <Esc>:q<CR>
tnoremap <C-q> <C-\><C-n>:q<CR>

nnoremap <silent> ,tl :call neoterm#clear()<cr>
let g:neoterm_clear_cmd = "clear; printf '=%.0s' {1..80}; clear"
let g:neoterm_position = 'vertical'
let g:neoterm_automap_keys = ',tt'

nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f9> :TREPLSend<cr>
vnoremap <silent> <f9> :TREPLSend<cr>
let g:python_host_prog='/usr/local/bin/python'


" auto-google
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" Should be last in file
nnoremap ; :
vnoremap ; :
nnoremap ' ;
nnoremap : ,
nnoremap ; :
vnoremap ; :
nnoremap ' ;
nnoremap : ,
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
