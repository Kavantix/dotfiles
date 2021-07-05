" Coc mappings --------------------------------------------------------

" Enable airline integration
let g:airline#extensions#coc#enabled = 0

" Map diagnostics
nmap <silent> <leader>d :CocList diagnostics<cr>

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

augroup holdgroup
  autocmd!
  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')
  " autocmd CursorHold * echo "cursor hold"
  " autocmd CursorMoved * silent call CocActionAsync('highlight')
  " autocmd CursorMoved * echo "cursor mode"
augroup END

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Give more space for displaying messages.
" set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
" nmap <leader>. <Plug>(coc-codeaction)
nmap <leader>. :CocAction<cr>
nmap <leader>, :CocCommand<cr>
" Apply AutoFix to problem on the current line.
nmap <leader>gf  <Plug>(coc-fix-current)

" enter for pair brackets
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> <leader>p :call CocActionAsync('showSignatureHelp')<cr>

augroup coc_group
  autocmd!
  " Setup formatexpr specified filetype(s).
  " autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
function! ShowSignature()
    call CocActionAsync('showSignatureHelp')
	 return ""
endfunction
" inoremap <silent> <expr> <C-,><C-p> ShowSignature()

" set error/warning highlight colors
set termguicolors

" ---------------------------------------------------------------------


" let g:current_function = ''
" autocmd CursorHold * silent let g:current_function = CocAction('getCurrentFunctionSymbol')
" let g:airline_section_y = '%{g:current_function}'
let g:airline_section_y = '%{coc#status()}'
" set statusline+=%{coc#status()}


" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']

let g:coc_snippet_next='<TAB>'
let g:coc_snippet_prev='<S-TAB>'

