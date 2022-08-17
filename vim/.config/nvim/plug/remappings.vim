" User vim-commentary to comment out lines of code
nnoremap <silent> <leader>/ :Commentary<cr>
vnoremap <silent> <leader>/ :Commentary<cr>

" Easier saving, quitting, reloading and resourcing
nnoremap <silent> <leader>s :update<cr>
nnoremap <silent> <leader>gs :noa update<cr>
nnoremap <silent> <leader>w :bd<cr>
nnoremap <silent> <leader>q :q<cr>
" Scroll up 10 lines when going to bottom of file
nnoremap <silent> <leader>rr :e<cr>
nnoremap <silent> <leader>rs :source %<cr>
nnoremap <silent> <leader>rv :source $MYVIMRC<cr>

" Move between buffers
" nnoremap <S-l> :bn<cr>
nnoremap <silent> H :<C-u>exe 'bp' . v:count1<cr>
nnoremap <silent> L :<C-u>exe 'bn' . v:count1<cr>

" quickfix list movement
nnoremap <C-l> :cnext<cr>zz
nnoremap <C-h> :cprevious<cr>zz

" nnoremap G Gzb10<C-E>

" Move line up/down
nnoremap <silent> <c-k> :<C-u>exe 'm -' . (v:count1 + 1)<cr>==
nnoremap <silent> <C-j> :<C-u>exe 'm +' . v:count1<cr>==
" nnoremap <silent> <C-j> :<C-U>exe 'm +' . v:count1<cr>

" easy base64 encoding/decoding
vnoremap <silent> <leader>46 c<c-r>=trim(system('base64 -d', @"))<cr><esc>
vnoremap <silent> <leader>64 c<c-r>=trim(system('base64', @"))<cr><esc>
nnoremap <silent> <leader>b46 ciW<c-r>=trim(system('base64 -d', @"))<cr><esc>
nnoremap <silent> <leader>b64 ciW<c-r>=trim(system('base64', @"))<cr><esc>

" Move visual selection
vmap <expr> <C-h> DVB_Drag('left')
vmap <expr> <C-j> DVB_Drag('down')
vmap <expr> <C-k> DVB_Drag('up')
vmap <expr> <C-l> DVB_Drag('right')
vnoremap <silent> J :<C-u>exe "'<,'>m '>+" . v:count1<cr>gv=gv
vnoremap <silent> K :<C-u>exe "'<,'>m '<-" . (v:count1 + 1)<cr>gv=gv
vnoremap L >gv
vnoremap H <gv
vnoremap > >gv
vnoremap < <gv

nnoremap <esc><esc> :noh<cr>

" Surround selection with quote/brackets
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>` <esc>`>a`<esc>`<i`<esc>
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>) <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>] <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>
vnoremap <leader>} <esc>`>a}<esc>`<i{<esc>
vnoremap <leader>< <esc>`>a><esc>`<i<<esc>
vnoremap <leader>< <esc>`>a><esc>`<i<<esc>

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
nnoremap <silent> <leader>tn :FloatermNew --autoclose=2 --width=0.9 --height=0.9<cr>
nnoremap <silent> <C-T> :FloatermToggle<cr>
tnoremap <silent> <C-T> <C-\><C-N>:FloatermToggle<cr>

" Support copy to clipboard over ssh
vnoremap <silent> <leader>y :OSCYank<cr>
nmap <leader>y <Plug>OSCYank
