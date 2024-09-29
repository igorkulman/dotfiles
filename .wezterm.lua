local wezterm = require 'wezterm'

local config = wezterm.config_builder()

wezterm.on("gui-startup", function()	
	local screen = wezterm.gui.screens().main	
	local width, height = screen.width * 0.4, screen.height * 0.45
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {
		position = { x = (screen.width - width) / 2, y = (screen.height - height) / 2 + screen.height * 0.1 },
	})	
	window:gui_window():set_inner_size(width, height)
end)

-- download from https://github.com/igorkulman/wezterm-vscode-theme
config.color_scheme = 'vscode'

config.default_cursor_style = 'SteadyBar'

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

config.font_size = 13.0

-- brew install font-droid-sans-mono-for-powerline
config.font = wezterm.font 'Droid Sans Mono for Powerline'
return config