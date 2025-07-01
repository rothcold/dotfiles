-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font("Maple Mono")
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.color_scheme = "Catppuccin Mocha"

config.hide_tab_bar_if_only_one_tab = true

config.enable_wayland = false

-- and finally, return the configuration to wezterm
return config
