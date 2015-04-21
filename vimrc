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



Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-haystack'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-vinegar'
Plug 'justincampbell/vim-railscasts'

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

" Extras originally from TPope's sensible-vim, found in sheerun/vimrc
" Y yanks from the cursor to the end of line as expected. See :help Y.
nnoremap Y y$

" My own keymappings
nnoremap gO mzO<Esc>`z
nnoremap go mzo<Esc>`z
