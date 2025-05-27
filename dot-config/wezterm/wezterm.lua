-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.enable_tab_bar = false

config.font_size = 10
config.font = wezterm.font('Hack')
config.color_scheme = 'GruvboxDark'

return config
