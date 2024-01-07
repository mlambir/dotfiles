local minifiles_toggle = function()
	if not MiniFiles.close() then MiniFiles.open() end
end
return {
	'echasnovski/mini.nvim',
	version = '*',
	config = function()
		require('mini.basics').setup()
		require('mini.comment').setup()
		require('mini.files').setup({
			mappings = {
				go_in_plus = '<CR>',
			},
		})
		require('mini.jump').setup()
		require('mini.move').setup()

		vim.keymap.set('n', "<leader>e", minifiles_toggle, { desc = "File explorer" })
	end,
}
