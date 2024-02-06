local enable_ai = function()
	local current_dir = vim.fn.getcwd()
	local home_dir = os.getenv("HOME") or os.getenv("USERPROFILE")
	local code_path = home_dir .. "/code"

	-- if git repo is filed under ~/code/work/private, do not allow AI
	local private_path = code_path .. "/work/private"
	local is_code_private = string.find(current_dir, private_path) == 1

	if is_code_private then
		return false
	else
		return true
	end
end
function fg(name)
	---@type {foreground?:number}?
	---@diagnostic disable-next-line: deprecated
	local hl = vim.api.nvim_get_hl and vim.api.nvim_get_hl(0, { name = name }) or vim.api.nvim_get_hl_by_name(name, true)
	---@diagnostic disable-next-line: undefined-field
	local fg = hl and (hl.fg or hl.foreground)
	return fg and { fg = string.format("#%06x", fg) } or nil
end

return {

	-- custom config which piggybacks on the copilot extras in lazy.lua.
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})

			-- disable copilot if we are in a private project
			if not enable_ai() then
				vim.cmd("Copilot disable")
			end
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end
	},

}
