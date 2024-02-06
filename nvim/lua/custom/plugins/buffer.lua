return {
	'j-morano/buffer_manager.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	event = "VeryLazy",
	config = function()
		require("buffer_manager").setup({
			select_menu_item_commands = {
				v = {
					key = "<C-v>",
					command = "vsplit"
				},
				h = {
					key = "<C-h>",
					command = "split"
				}
			},
		})
		vim.keymap.set('n', '<leader>fb', function() require("buffer_manager.ui").toggle_quick_menu() end,
			{ desc = "Buffer Manager" })
	end
}
