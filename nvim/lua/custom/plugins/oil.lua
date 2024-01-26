return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function ()
	local oil = require("oil")
	oil.setup({
	  keymaps = {
	        ["q"] = "actions.close",
	  }
	})
  	vim.keymap.set('n', "<leader>e", oil.open, {desc = "File Explorer"})
  	vim.keymap.set('n', "<leader>E", function() oil.open(vim.fn.getcwd()) end, {desc = "File Explorer CWD"})
  end
}
