-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()


wezterm.on("gui-startup", function()	
	local screen = wezterm.gui.screens().main	
	local width, height = screen.width * 0.4, screen.height * 0.45
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {
		position = { x = (screen.width - width) / 2, y = (screen.height - height) / 2 + screen.height * 0.1 },
	})
	-- window:gui_window():maximize()
	window:gui_window():set_inner_size(width, height)
end)

config.colors = {  
  foreground = '#dcdcdc',  
  background = '#1d1d1d',
  cursor_bg = '#d5d5d5',  
  cursor_fg = '#282828',
  selection_fg = '#000000',  
  selection_bg = '#c3c2c3',

  ansi = {
    '#000000',
    '#e46d63',
    '#58c18f',
    '#e9e64d',
    '#77abd9',
    '#d38dd9',
    '#60c1de',
    '#eaeaea',
  },
  brights = {
    '#656565',
    '#e46d63',
    '#58c18f',
    '#e9e64d',
    '#77abd9',
    '#d38dd9',
    '#60c1de',
    '#eaeaea',
  } 
}

config.default_cursor_style = 'SteadyBar'

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

config.font_size = 13.0

config.font = wezterm.font 'Droid Sans Mono for Powerline'

-- and finally, return the configuration to wezterm
return config