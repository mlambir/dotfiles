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
