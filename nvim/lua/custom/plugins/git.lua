return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = function()
			require("neogit").setup {}
			vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit" })
			vim.keymap.set("n", "<leader>gc", "<cmd>Neogit commit<cr>", { desc = "Neogit Commit" })
		end,
	}

}
