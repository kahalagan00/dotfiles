local wezterm = require "wezterm"
local act = wezterm.action
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return {
  default_domain = "WSL:Ubuntu",

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

  foreground_text_hsb = {
    hue = 1.0,
    saturation = 1.2,
    brightness = 1.5,
  },

  leader = { key = "z", mods = "CTRL", timeout_milliseconds = 1000 },

  color_scheme = 'Dracula',
  font = wezterm.font('Maple Mono NL'),
  font_size = 20.0,

  -- keep default mouse bypass behavior (SHIFT bypasses apps like nvim capturing the mouse)
  -- (this is the default; included here for clarity)
  bypass_mouse_reporting_modifiers = "SHIFT",

  keys = {
    -- Clipboard (defaults, but explicitly here so you definitely have them)
    { key = "c", mods = "CTRL|SHIFT", action = act.CopyTo "Clipboard" },
    { key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom "Clipboard" },

    -- Font zoom (these ARE the real default zoom keys: Ctrl+=, Ctrl+-, Ctrl+0)
    { key = "=", mods = "CTRL",       action = act.IncreaseFontSize },
    { key = "-", mods = "CTRL",       action = act.DecreaseFontSize },
    { key = "0", mods = "CTRL",       action = act.ResetFontSize },
  },

  -- OPTIONAL: Ctrl+Shift+MouseWheel zoom (works even when nvim is capturing the mouse)
  mouse_bindings = {
    {
      event = { Down = { streak = 1, button = { WheelUp = 1 } } },
      mods = "CTRL|SHIFT",
      action = act.IncreaseFontSize,
    },
    {
      event = { Down = { streak = 1, button = { WheelDown = 1 } } },
      mods = "CTRL|SHIFT",
      action = act.DecreaseFontSize,
    },
  },
}
