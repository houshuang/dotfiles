
" Extras originally from TPope's sensible-vim, found in sheerun/vimrc
" Y yanks from the cursor to the end of line as expected. See :help Y.
nnoremap Y y$
set cursorline

" Keep 8 lines above or below the cursor when scrolling.
set scrolloff=8
 
" Keep 15 columns next to the cursor when scrolling horizontally.
set sidescroll=1
set sidescrolloff=15
 
" If opening buffer, search first in opened windows.
set switchbuf=usetab
 
" Hide buffers instead of asking if to save them.
set hidden
 
" Wrap lines by default
set wrap linebreak
set showbreak=" "
 
" Allow easy navigation between wrapped lines.
vmap j gj
vmap k gk
nmap j gj
nmap k gk
 
" For autocompletion, complete as much as you can.
set wildmode=longest,full
 
" Disable any annoying beeps on errors.
set noerrorbells
set visualbell
 
" Don't parse modelines (google "vim modeline vulnerability").
set nomodeline
 
" Do not fold by default. But if, do it up to 3 levels.
set foldmethod=indent
set foldnestmax=3
set nofoldenable
 
" Enable mouse for scrolling and window resizing.
set mouse=a
 
" Disable swap to prevent annoying messages.
set noswapfile
 
" Save up to 100 marks, enable capital marks.
set viminfo='100,f1
 
" Enable search highlighting.
set hlsearch
 
" Ignore case when searching.
set ignorecase
 
" Show mode in statusbar, not separately.
set noshowmode
 
" Don't ignore case when search has capital letter
" (although also don't ignore case by default).
set smartcase
 
" Use dash as word separator.
set iskeyword+=-
 
" Add gems.tags to files searched for tags.
set tags+=gems.tags
 
" Disable output, vcs, archive, rails, temp and backup files.
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*
 
" Auto center on matched string.
noremap n nzz
noremap N Nzz
 
" Visually select the text that was last edited/pasted (Vimcast#26).
noremap gV `[v`]
 
" Expand %% to path of current buffer in command mode.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
 
" Enable saving by `Ctrl-s`
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>
 
" Use Q to intelligently close a window
" (if there are multiple windows into the same buffer)
" or kill the buffer entirely if it's the last window looking into that buffer.
function! CloseWindowOrKillBuffer()
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))
  if matchstr(expand("%"), 'NERD') == 'NERD'
    wincmd c
    return
  endif
  if number_of_windows_to_this_buffer > 1
    wincmd c
  else
    bdelete
  endif
endfunction
nnoremap <silent> Q :call CloseWindowOrKillBuffer()<CR>
 
" Set window title by default.
set title
 
" Always focus on splited window.
nnoremap <C-w>s <C-w>s<C-w>w
nnoremap <C-w>v <C-w>v<C-w>w
 
" Don't display the intro message on starting Vim.
set shortmess+=I
 
" Use Silver Searcher for CtrlP plugin (if available)
" Fallback to git ls-files for fast listing.
" Because we use fast strategies, disable caching.
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git',
    \ 'cd %s && git ls-files . -co --exclude-standard',
    \ 'find %s -type f' ]
endif
 
" Accept CtrlP selections also with <Space>
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<Space>', '<CR>', '<2-LeftMouse>'],
  \ }
 
" Make sure pasting in visual mode doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
 
" Prevent common mistake of pressing q: instead :q
map q: :q
 
" Make a simple "search" text object.
" http://vim.wikia.com/wiki/Copy_or_change_search_hit
" It allows for replacing search matches with cs and then /././.
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" Keep flags when repeating last substitute command.
nnoremap & :&&<CR>
xnoremap & :&&<CR>
 

