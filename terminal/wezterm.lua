-- https://wezfurlong.org/wezterm/config/files.html
local wezterm = require 'wezterm';
return {
  color_scheme = "Gruvbox Dark",
  enable_tab_bar = false,
  font = wezterm.font({"FiraCode Nerd Font"}),
  font_dirs = {"fonts"},
  font_locator = "ConfigDirsOnly",
  font_size = 14,
  window_decorations = "RESIZE",
}
