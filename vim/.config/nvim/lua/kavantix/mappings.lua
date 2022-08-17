
-- Make Y behave like expected
vim.keymap.set('n', 'Y', 'y$')

-- Center search result when jumping around
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('c', '<enter>', function()
   cmdtype = vim.api.nvim_eval('getcmdtype()')
   if cmdtype == '/' or cmdtype == '?' then
     return "<enter>zz"
   end
   return '<enter>'
end, { expr = true })

-- Make joining lines behave
vim.keymap.set('n', 'J', 'mzJ`z')

-- " NerdTree mappings
-- nnoremap <leader>n :NERDTreeToggle<cr>
-- nnoremap <leader>m :NERDTreeFind<cr>

