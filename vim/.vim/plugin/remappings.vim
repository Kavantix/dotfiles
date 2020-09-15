" Easy moving between windows
" Disabled in favor of moving lines
noremap <C-H> <C-W>h
" noremap <C-J> <C-W>j
" noremap <C-K> <C-W>k
noremap <C-L> <C-W>l

" NerdTree mappings
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>m :NERDTreeFind<cr>

" FZF mappings
nnoremap <leader>o :Files<cr>
nnoremap <leader>O :Commands<cr>
nnoremap <leader>l :Lines<cr>

" User vim-commentary to comment out lines of code
nnoremap <leader>/ :Commentary<cr>

" Easier saving, quitting, reloading and resourcing
nnoremap <silent> <leader>s :update<cr>
nnoremap <silent> <leader>w :bd<cr>
nnoremap <silent> <leader>q :q<cr>
" Scroll up 10 lines when going to bottom of file
nnoremap <silent> <leader>rr :e<cr>
nnoremap <silent> <leader>rs :source %<cr>

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
