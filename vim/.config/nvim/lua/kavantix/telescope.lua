local actions = require('telescope.actions')
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
M.search_dotfiles = function()
   require("telescope.builtin").find_files({
      prompt_title = "< dotfiles >",
      cwd = "$HOME/git/dotfiles/",
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
M.git_branches = function() 
   require("telescope.builtin").git_branches({
      attach_mappings = function(prompt_bufnr, map) 
         map('i', '<c-d>', actions.git_delete_branch)
         map('n', '<c-d>', actions.git_delete_branch)
         return true
      end
   })
end

M.find_files = function()
   require('telescope.builtin').find_files({
      hidden = true,
      find_command = {'fd', '--type', 'f', '-H', '--exclude', '.git', '--exclude', '*.png', '--exclude', '*.ttf'},
   })
end

M.find_files_dart = function ()
   require('telescope.builtin').find_files({
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


return M
