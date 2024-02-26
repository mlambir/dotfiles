return {
	'nanozuki/tabby.nvim',
	event = 'VimEnter',
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		require('tabby.tabline').use_preset('active_wins_at_tail', {
			theme = {
				fill = 'TabLineFill', -- tabline background
				head = 'TabLine', -- head element highlight
				current_tab = 'TabLineSel', -- current tab label highlight
				tab = 'TabLine', -- other tab label highlight
				win = 'TabLine', -- window highlight
				tail = 'TabLine', -- tail element highlight
			},
			nerdfont = true,    -- whether use nerdfont
			lualine_theme = nil, -- lualine theme name
			-- tab_name = {
			-- 	name_fallback = function(tabid)
			-- 		return tabid
			-- 	end,
			-- },
			buf_name = {
				mode = "tail",
			},

		})
		vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true, desc = "Tab Add" })
		vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true, desc = "Tab Close" })
		vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true, desc = "Tab Only" })
		vim.api.nvim_set_keymap("n", "<leader>tn", ":tabn<CR>", { noremap = true, desc = "Tab Next" })
		vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", { noremap = true, desc = "Tab Previous" })
		vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true, desc = "Tab Move Previous" })
		vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true, desc = "Tab Move Next" })
	end
}
