-- https://wezfurlong.org/wezterm/config/files.html
local wezterm = require 'wezterm';

wezterm.on("format-window-title", function()
  return ""
end)

return {
  color_scheme = "Gruvbox Dark",
  enable_tab_bar = false,
  font = wezterm.font("JetBrainsMono Nerd Font"),
  font_rules = {
    {
      intensity = "Bold",
      font = wezterm.font("JetBrainsMono Nerd Font", {weight="Bold"}),
    },
    {
      italic = true,
      font = wezterm.font("JetBrainsMono Nerd Font", {italic=true}),
    },
    {
      intensity = "Half",
      font = wezterm.font("JetBrainsMono Nerd Font", {weight="Thin"}),
    },
  },
  font_dirs = {"fonts"},
  font_locator = "ConfigDirsOnly",
  font_size = 14,
  initial_cols = 120,
  initial_rows = 35,
  keys = {
    {key="f", mods="SUPER", action="ToggleFullScreen"},
  },
  window_padding = {
    left = 10,
    right = 10,
    top = 0,
    bottom = 0,
  },
  -- window_decorations = "RESIZE",
}
