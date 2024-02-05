return
{
	'creativenull/efmls-configs-nvim',
	dependencies = { 'neovim/nvim-lspconfig' },
	config = function()
		local languages = require('efmls-configs.defaults').languages()
		local efmls_config = {
			filetypes = vim.tbl_keys(languages),
			settings = {
				rootMarkers = { '.git/' },
				languages = languages,
			},
			init_options = {
				documentFormatting = true,
				documentRangeFormatting = true,
			},
		}

		require('lspconfig').efm.setup(vim.tbl_extend('force', efmls_config, {}))
	end
}
