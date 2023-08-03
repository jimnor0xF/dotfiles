local telescope = require('telescope')
  telescope.setup{
    pickers = {
      find_files = {
        find_command = {'rg', '--files', '--hidden', '-g', '!.git', '--ignore-file', '$HOME/.config/nvim/after/plugin/.rgignore'},
      }
  }
}


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

