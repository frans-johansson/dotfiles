local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "Alabaster"
config.hide_tab_bar_if_only_one_tab = true
config.keys = {
	{
		key = "s",
		mods = "CTRL|ALT",
		action = wezterm.action.SplitHorizontal,
	},
	{
		key = "v",
		mods = "CTRL|ALT",
		action = wezterm.action.SplitVertical,
	},
	{
		key = "h",
		mods = "CTRL|ALT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "CTRL|ALT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "CTRL|ALT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "CTRL|ALT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
}

return config
