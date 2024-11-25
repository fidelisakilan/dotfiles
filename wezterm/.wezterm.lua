local wezterm = require "wezterm"

local config = wezterm.config_builder()

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end
local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Catppuccin Mocha'
  else
    return 'Catppuccin Latte'
  end
end
local color_scheme = scheme_for_appearance(get_appearance())

config.native_macos_fullscreen_mode = true
config.color_scheme = color_scheme
config.font = wezterm.font('CaskaydiaCove Nerd Font')
config.font_size = 14
config.use_fancy_tab_bar = false

config.window_padding = {
    bottom = 0,
    top = 0,
    right = 0,
    left = 0,
}

config.window_decorations = 'RESIZE'
return config
