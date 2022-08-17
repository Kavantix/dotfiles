local actions = require 'telescope.actions'
local builtin = require 'telescope.builtin'

require('telescope').setup {
   defaults = {
      file_sorter = require('telescope.sorters').get_fzy_sorter,
      layout_config = {
         prompt_position = 'top',
      },
      sorting_strategy = 'ascending',
      prompt_prefix = ' >',
      color_devicons = true,
      -- scroll_strategy = 'limit',

      file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

      mappings = {
         i = {
            ["<C-x>"] = false,
            ["<C-q>"] = actions.send_selected_to_qflist,
            ["<C-a>"] = actions.send_to_qflist,
            -- ["<ESC>"] = actions.close,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
         },
      },
   },
   extensions = {
      fzy_native = {
         override_generic_sorter = false,
         override_file_sorter = true,
      }
   }
}

require('telescope').load_extension('fzy_native')

local M = {}
function M.search_dotfiles()
   builtin.find_files({
      prompt_title = "< dotfiles >",
      cwd = "$HOME/git/dotfiles/",
      hidden = true,
   })
end

-- map(mode, key, lua function to call)
--
-- good place to look: telescope.actions (init.lua)
-- lua function to call:  (gets bufnr, not necessarily needed)
--   require('telescope.actions.state').get_selected_entry(bufnr)
--   Actions just take the bufnr and give out information
--   require('telescope.actions').close(bufnr)
--
--   check out telescope.actions for _all the available_ supported
--   actions.
--
--   :h telescope.setup ->
--   :h telescope.builtin ->
--   :h telescope.layout ->
--   :h telescope.actions
--
function M.git_branches() 
   builtin.git_branches({
      attach_mappings = function(prompt_bufnr, map) 
         map('i', '<c-d>', actions.git_delete_branch)
         map('n', '<c-d>', actions.git_delete_branch)
         return true
      end
   })
end

function M.find_files()
   builtin.find_files({
      hidden = true,
      find_command = {'fd', '--type', 'f', '-H', '--exclude', '.git', '--exclude', '*.png', '--exclude', '*.ttf'},
   })
end

function M.find_files_all()
   builtin.find_files({
      hidden = true,
      find_command = {'fd', '--type', 'f', '-H', '--no-ignore', '--exclude', '.git', '--exclude', '*.png', '--exclude', '*.ttf'},
   })
end

function M.find_files_dart()
   builtin.find_files({
      hidden = true,
      find_command = {
         'fd', '--type', 'f', '-H', '--exclude', '.git', '--exclude', '*.png', '--exclude', '*.ttf',
         '--exclude', '**/*.g.dart',
         '--exclude', '**/*.chopper.dart',
         '--exclude', 'android/**/*',
         '--exclude', 'ios/**/*',
      },

   })
end

function M.grep_string()
   builtin.grep_string({
      search = vim.fn.input("Grep For > "),
   })
end

vim.keymap.set('n', '<leader>o', M.find_files, { silent = true, desc = 'Find file' })
vim.keymap.set('n', '<leader>O', M.find_files_all, { silent = true, desc = 'Find file even ignored' })
vim.keymap.set('n', '<leader>fd', M.search_dotfiles, { silent = true, desc = 'Find in dotfiles' })
vim.keymap.set('n', '<leader>rg', M.grep_string, { silent = true, desc = 'Find by string grep' })
vim.keymap.set('n', '<leader>rl', builtin.live_grep, { silent = true, desc = 'Find by live grep' })
vim.keymap.set('n', '<leader>ft', builtin.builtin, { silent = true, desc = 'Find telescope builtin' })
vim.keymap.set('n', '<leader>fc', builtin.commands, { silent = true, desc = 'Find command' })
vim.keymap.set('n', '<leader>f/', builtin.current_buffer_fuzzy_find, { silent = true, desc = 'Find in file' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { silent = true, desc = 'Find keymap' })
vim.keymap.set('n', '<leader>ff', builtin.resume, { silent = true, desc = 'Resume last telescope search' })
vim.keymap.set('n', '<leader>fo', builtin.buffers, { silent = true, desc = 'Find open buffer' })

return M

