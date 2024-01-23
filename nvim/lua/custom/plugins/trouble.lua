return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
	},
	config = function()
		require("trouble").setup()
		vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Trouble toggle" })
		vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end,
			{ desc = "Workspace Diagnostics" })
		vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end,
			{ desc = "Document Diagnostics" })
		vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, { desc = "Quickfix" })
		vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = "Loclist" })
		vim.keymap.set("n", "<leader>xn", function() require("trouble").next({skip_groups = true, jump = true}) end, { desc = "Next" })
		vim.keymap.set("n", "<leader>xp", function() require("trouble").previous({skip_groups = true, jump = true}) end, { desc = "Previous" })
		vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end, { desc = "References" })
	end
}
