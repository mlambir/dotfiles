local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = wezterm.config_builder()
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 13.0
config.color_scheme = "Hybrid"
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.tab_bar_at_bottom = true

config.colors = {
	selection_bg = "#b7bcba",
	selection_fg = "#161719",
}


local act = wezterm.action

local function isViProcess(pane)
	-- get_foreground_process_name On Linux, macOS and Windows,
	-- the process can be queried to determine this path. Other operating systems
	-- (notably, FreeBSD and other unix systems) are not currently supported
	return pane:get_foreground_process_name():find('n?vim') ~= nil
	-- return pane:get_title():find("n?vim") ~= nil
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
	if isViProcess(pane) then
		window:perform_action(
		-- This should match the keybinds you set in Neovim.
			act.SendKey({ key = vim_direction, mods = 'CTRL' }),
			pane
		)
	else
		window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
	end
end

wezterm.on('ActivatePaneDirection-right', function(window, pane)
	conditionalActivatePane(window, pane, 'Right', 'l')
end)
wezterm.on('ActivatePaneDirection-left', function(window, pane)
	conditionalActivatePane(window, pane, 'Left', 'h')
end)
wezterm.on('ActivatePaneDirection-up', function(window, pane)
	conditionalActivatePane(window, pane, 'Up', 'k')
end)
wezterm.on('ActivatePaneDirection-down', function(window, pane)
	conditionalActivatePane(window, pane, 'Down', 'j')
end)

config.keys = {
	{
		key = "|",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{ key = 'h', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-left') },
	{ key = 'j', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-down') },
	{ key = 'k', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-up') },
	{ key = 'l', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-right') },
}

return config
