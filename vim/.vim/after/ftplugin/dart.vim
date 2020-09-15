function! s:CodeActionFromSelected(type)
  call CocAction('codeAction', a:type, g:nextCodeAction)
endfunction

function! s:RunCodeAction(action)
  let g:nextCodeAction=a:action
  set operatorfunc=s:CodeActionFromSelected
  normal g@iw
endfunction

nnoremap <buffer> <silent> <leader>fww :call <SID>RunCodeAction('Wrap with Container')<cr>viw
nnoremap <buffer> <silent> <leader>frw :call <SID>RunCodeAction('Remove this widget')<cr>
nnoremap <buffer> <silent> <leader>fdw :call <SID>RunCodeAction('Delete this widget')<cr>
nnoremap <buffer> <silent> <leader>fwr :call <SID>RunCodeAction('Wrap with Row')<cr>
nnoremap <buffer> <silent> <leader>fwr :call <SID>RunCodeAction('Wrap with Row')<cr>
nnoremap <buffer> <silent> <leader>fwc :call <SID>RunCodeAction('Wrap with Column')<cr>
nnoremap <buffer> <silent> <leader>fwb :call <SID>RunCodeAction('Wrap with StreamBuilder')<cr>ct(Builder<esc>jddf,dt)
nnoremap <buffer> <silent> <leader>fmd :call <SID>RunCodeAction('Move widget down')<cr>
nnoremap <buffer> <silent> <leader>fmu :call <SID>RunCodeAction('Move widget up')<cr>

let $FZF_DEFAULT_COMMAND=g:fzf_default_command . ' --exclude "**/*.g.dart" --exclude "**/*.chopper.dart" --exclude "android/**/*" --exclude "ios/**/*"'

let g:dart_format_on_save = 1
let g:dart_style_guide = 2
let g:lsc_server_commands = {'dart': 'dart_language_server'}
let g:lsc_auto_map = v:true
let g:dartfmt_options = ['--fix', '-l 100']
