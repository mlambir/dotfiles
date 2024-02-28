return {
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("harpoon").setup({
				global_settings = {
					save_on_toggle = true,
					save_on_change = true,
				},
			})
			local harpoon_ui = require("harpoon.ui")
			local harpoon_mark = require("harpoon.mark")
			vim.keymap.set("n", "<leader><leader>", function() harpoon_ui.toggle_quick_menu() end,
				{ desc = "Harpoon Menu" })
			vim.keymap.set("n", "<leader>ha", function() harpoon_mark.add_file() end, { desc = "[A]dd" })
			vim.keymap.set("n", "<leader>hr", function() harpoon_mark.rm_file() end, { desc = "[R]emove" })
			vim.keymap.set("n", "<leader>hc", function() harpoon_mark.clear_all() end, { desc = "[C]lear" })
			vim.keymap.set("n", "<leader>h1", function() harpoon_ui.nav_file(1) end)
			vim.keymap.set("n", "<leader>h2", function() harpoon_ui.nav_file(2) end)
			vim.keymap.set("n", "<leader>h3", function() harpoon_ui.nav_file(3) end)
			vim.keymap.set("n", "<leader>h4", function() harpoon_ui.nav_file(4) end)
			vim.keymap.set("n", "<leader>h5", function() harpoon_ui.nav_file(5) end)
		end,
	},
}
