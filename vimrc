" Automatic installation:
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-jdaddy'
Plug 'sheerun/vim-json'
Plug 'Shougo/vimproc.vim'

Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'

Plug 'Shougo/unite.vim'

Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-haystack'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-vinegar'
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

Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'

call plug#end()

"                 --------

" Leader
let mapleader=","

" Quickly edit .vimrc
" nmap <silent> <leader>ev :e ~/src/dotfiles/vimrc<CR>
" nmap <silent> <leader>sv :so ~/src/dotfiles/vimrc<CR>

" Turn on when pasting text with indent etc
set pastetoggle=<F2>

" Easyclip
" let g:EasyClipUseSubstituteDefaults = 1

" Quicker window movement
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
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

tnoremap <c-a> <c-\><c-n>

" Formatting a paragraph
vmap Q gq
nmap Q gqap

" Stuff left out from vim-sensible
source ~/src/dotfiles/vim-sensible-extended.vim

" My own keymappings
nnoremap gO mzO<Esc>`z
nnoremap go mzo<Esc>`z

" Buffer menus - TODO find a plugin that does this better?
:nnoremap <F5> :buffers<CR>:buffer<Space>
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>

" Colorscheme
colorscheme railscasts

" Fugitive (from
" http://www.reddit.com/r/vim/comments/21f4gm/best_workflow_when_using_fugitive/)
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>

" Execute line as vim-script (from
" http://stackoverflow.com/questions/14385998/how-can-i-execute-the-current-line-as-vim-ex-commands)
" nnoremap <F2> :exe getline(".")<CR>
" vnoremap <F2> :<C-w>exe join(getline("'<","'>"),'<Bar>')<CR>

silent! Glog<CR>:bot copen<CR>

" Unite settings from http://www.codeography.com/2013/06/17/replacing-all-the-things-with-unite-vim.html

let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction
