return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function ()
	local oil = require("oil")
	oil.setup()
  	vim.keymap.set('n', "<leader>e", oil.toggle_float, {desc = "File Explorer"})
  	vim.keymap.set('n', "<leader>E", function() oil.toggle_float(vim.fn.getcwd()) end, {desc = "File Explorer CWD"})
  end
}
