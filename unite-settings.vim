" Adapted from https://github.com/bling/dotvim/blob/master/vimrc

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" let g:unite_data_directory=s:get_cache_dir('unite')
let g:unite_source_history_yank_enable=1
let g:unite_source_rec_max_cache_files=5000

if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --line-numbers --nogroup -S -C4'
  let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
  let g:unite_source_grep_command='ack'
  let g:unite_source_grep_default_opts='--no-heading --no-color -C4'
  let g:unite_source_grep_recursive_opt=''
endif

function! s:unite_settings()
  nmap <buffer> Q <plug>(unite_exit)
  nmap <buffer> <esc> <plug>(unite_exit)
  imap <buffer> <esc> <plug>(unite_exit)
endfunction
autocmd FileType unite call s:unite_settings()

nmap <space> [unite]
nnoremap [unite] <nop>

nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec/async:! buffer file_mru bookmark<cr><c-u>
nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async:!<cr><c-u>
nnoremap <silent> [unite]e :<C-u>Unite -buffer-name=recent file_mru<cr>
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer file_mru<cr>
nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>
nnoremap <silent> [unite]a :<C-u>Unite -winheight=10 -auto-preview -buffer-name=airline_themes airline_themes<cr>
let g:junkfile#directory="~/tmp"
nnoremap <silent> [unite]j :<C-u>Unite -auto-resize -buffer-name=junk junkfile junkfile/new<cr>
nnoremap <silent> [unite]h :<C-u>Unite -auto-resize -buffer-name=help help<cr>
nnoremap <silent> [unite]o :<C-u>Unite -auto-resize -buffer-name=outline outline<cr>
nnoremap <silent> [unite]t :<C-u>Unite -auto-resize -buffer-name=tag tag tag/file<cr>
nnoremap <silent> [unite]c :<C-u>Unite -winheight=10 -auto-preview -buffer-name=colorschemes colorscheme<cr>

