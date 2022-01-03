function! s:CodeActionFromSelected(type)
  call CocAction('codeAction', a:type, g:nextCodeAction)
endfunction

function! s:RunCodeAction(action)
  let g:nextCodeAction=a:action
  set operatorfunc=s:CodeActionFromSelected
  normal g@iw
endfunction

nnoremap <buffer> <silent> <leader>fww :call <SID>RunCodeAction('Wrap with SizedBox')<cr>viw
nnoremap <buffer> <silent> <leader>frw :call <SID>RunCodeAction('Remove this widget')<cr>
nnoremap <buffer> <silent> <leader>fdw :call <SID>RunCodeAction('Delete this widget')<cr>
nnoremap <buffer> <silent> <leader>fwr :call <SID>RunCodeAction('Wrap with Row')<cr>
nnoremap <buffer> <silent> <leader>fwr :call <SID>RunCodeAction('Wrap with Row')<cr>
nnoremap <buffer> <silent> <leader>fwc :call <SID>RunCodeAction('Wrap with Column')<cr>
" nnoremap <buffer> <silent> <leader>fwb :call <SID>RunCodeAction('Wrap with Builder')<cr>ct(Builder<esc>jddf,dt)
nnoremap <buffer> <silent> <leader>fwb :call <SID>RunCodeAction('Wrap with Builder')<cr>
nnoremap <buffer> <silent> <leader>fmd :call <SID>RunCodeAction('Move widget down')<cr>
nnoremap <buffer> <silent> <leader>fmu :call <SID>RunCodeAction('Move widget up')<cr>
nnoremap <buffer> <silent> <leader>fegf :call <SID>RunCodeAction('Encapsulate field')<cr>jddjd3jW
nnoremap <buffer> <silent> <leader>fef :call <SID>RunCodeAction('Encapsulate field')<cr>

nnoremap <buffer> <silent> <Leader>o :lua require('kavantix.telescope').find_files_dart()<CR>

if exists(":Run")
else
  command Run CocCommand flutter.run
endif
nnoremap <buffer> <silent> <leader>fR :Run<CR>
nnoremap <buffer> <silent> <leader>fQ :CocCommand flutter.dev.quit<CR>
" let $FZF_DEFAULT_COMMAND=g:fzf_default_command . ' --exclude "**/*.g.dart" --exclude "**/*.chopper.dart" --exclude "android/**/*" --exclude "ios/**/*"'

" if (!exists("g:dart_format_on_save"))
"   let g:dart_format_on_save = 1
" endif
let g:dart_style_guide = 2
let g:lsc_server_commands = {'dart': 'dart_language_server'}
let g:lsc_auto_map = v:true
if (!exists("g:dartfmt_options"))
  let g:dartfmt_options = ['--fix', '-l 80']
endif
