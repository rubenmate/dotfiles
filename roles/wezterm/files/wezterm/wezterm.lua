-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end
config.set_environment_variables = {
	TERMINFO_DIRS = "/home/user/.nix-profile/share/terminfo",
	WSLENV = "TERMINFO_DIRS",
}
local gpus = wezterm.gui.enumerate_gpus()

config.webgpu_preferred_adapter = gpus[1]
config.front_end = "WebGpu"

config.term = "wezterm"

config.color_scheme_dirs = { "/colors" } -- In windows this folder should have the colorscheme and be in the same dir as the exe
config.color_scheme = "zenbones"

-- Font
config.font = wezterm.font_with_fallback({ { family = "JetBrains Mono", weight = "Regular" }, { family = "Symbols Nerd Font Mono", scale = 0.75 } })
config.font_size = 18

config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.enable_kitty_keyboard = true

-- and finally, return the configuration to wezterm
return config
