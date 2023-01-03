local builtin = require('telescope.builtin')
local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")

vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc="Find Files"})
vim.keymap.set('n', '<leader>fw', builtin.quickfix, {desc="Quickfix"})
vim.keymap.set('n', '<leader>fl', builtin.loclist, {desc="Loclist"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc="Grep"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc="Buffers"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc="Help"})
vim.keymap.set('n', '<leader>fm', builtin.keymaps, {desc="Keymaps"})
vim.keymap.set('n', '<leader>fM', builtin.marks, {desc="Marks"})
vim.keymap.set('n', '<leader>fj', builtin.jumplist, {desc="Jumps"})
vim.keymap.set('n', '<leader>fy', telescope.extensions.neoclip.default, {desc="Yanks"})
vim.keymap.set('n', '<leader>f:', builtin.command_history, {desc="Command history"})
vim.keymap.set('n', '<leader>f/', builtin.search_history, {desc="Search history"})
vim.keymap.set('n', '<leader>fh', builtin.oldfiles, {desc="File history"})
vim.keymap.set('n', '<leader>f_', builtin.builtin, {desc="Providers"})

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
}
