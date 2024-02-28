return {
	'rmagatti/auto-session',
	config = function()
		require("auto-session").setup({})
		require("telescope").load_extension "session-lens"
		vim.keymap.set("n", "<leader>sl", "<cmd>Telescope session-lens<cr>", { desc = "Session List" })
		vim.keymap.set("n", "<leader>sr", "<cmd>SessionRestore<cr>", { desc = "Session Restore" })
		vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<cr>", { desc = "Session Save" })
	end
}
