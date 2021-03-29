" Easy moving between windows
" Disabled in favor of moving lines
" noremap <C-H> <C-W>h
tnoremap <C-H> <C-\><C-N><C-W>h
" noremap <C-J> <C-W>j
" noremap <C-K> <C-W>k
" noremap <C-L> <C-W>l
tnoremap <C-L> <C-\><C-N><C-W>l

" NerdTree mappings
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>m :NERDTreeFind<cr>

" FZF mappings
" nnoremap <leader>o :Files<cr>
nnoremap <silent> <Leader>o :lua require('kavantix.telescope').find_files()<CR>
nnoremap <silent> <Leader>fd :lua require('kavantix.telescope').search_dotfiles()<CR>
nnoremap <leader>fg :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>ft :lua require('telescope.builtin').builtin()<CR>
nnoremap <silent> <Leader>go :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>O :Commands<cr>
nnoremap <leader>l :Lines<cr>

" User vim-commentary to comment out lines of code
nnoremap <silent> <leader>/ :Commentary<cr>
vnoremap <silent> <leader>/ :Commentary<cr>

" Easier saving, quitting, reloading and resourcing
nnoremap <silent> <leader>s :update<cr>
nnoremap <silent> <leader>w :bd<cr>
nnoremap <silent> <leader>q :q<cr>
" Scroll up 10 lines when going to bottom of file
nnoremap <silent> <leader>rr :e<cr>
nnoremap <silent> <leader>rs :source %<cr>
nnoremap <silent> <leader>rv :source $MYVIMRC<cr>

" quickfix list movement
nnoremap <C-l> :cnext<cr>
nnoremap <C-h> :cprevious<cr>

" nnoremap G Gzb10<C-E>

" Move line up/down
nnoremap <silent> <c-k> :<C-u>exe 'm -' . (v:count1 + 1)<cr>
nnoremap <silent> <C-j> :<C-u>exe 'm +' . v:count1<cr>
" nnoremap <silent> <C-j> :<C-U>exe 'm +' . v:count1<cr>

" Move visual selection
vmap <expr> <C-h> DVB_Drag('left')
vmap <expr> <C-j> DVB_Drag('down')
vmap <expr> <C-k> DVB_Drag('up')
vmap <expr> <C-l> DVB_Drag('right')

" Duplicate line
" nnoremap <silent> <leader>d :@=':copy . <BAR> exe "+normal " . col . "l" <BAR>' <BAR> let col=virtcol('.') <cr>

function! DeleteHiddenBuffers()
  let tpbl=[]
  let closed = 0
  let skipped = 0
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    if getbufvar(buf, '&mod') == 0
      silent execute 'bwipeout' buf
      let closed += 1
    else
      let skipped += 1
    endif
  endfor
  echo "Closed ".closed." hidden buffers (skipped ".skipped.")"
endfunction

nnoremap <silent> <leader>hd :call DeleteHiddenBuffers()<cr>
nnoremap <silent> <leader>br :checktime<cr>

nnoremap <silent> <leader>tg :FloatermNew --autoclose=2 --width=0.9 --height=0.9 lazygit<cr>
nnoremap <silent> <leader>tt :FloatermToggle<cr>
nnoremap <silent> <leader>tn :FloatermNew --autoclose=2<cr>
nnoremap <silent> <C-T> :FloatermToggle<cr>
tnoremap <silent> <C-T> <C-\><C-N>:FloatermToggle<cr>
