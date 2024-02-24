local minifiles_toggle = function()
	if not MiniFiles.close() then MiniFiles.open() end
end
return {
	'echasnovski/mini.nvim',
	version = '*',
	config = function()
		-- require('mini.basics').setup()
		require('mini.ai').setup({ n_lines = 500 })
		require('mini.surround').setup()
		require('mini.move').setup()
	end,
}
