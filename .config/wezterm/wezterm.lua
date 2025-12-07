-- Pull in the wezterm API
local wezterm = require('wezterm')

-- This will hold the configuration.
local config = wezterm.config_builder()
local action = wezterm.action

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 96
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 14
config.color_scheme = 'Tokyo Night Moon'
-- config.color_scheme = "Gruvbox Dark (Gogh)"
-- config.color_scheme = "Catppuccin Macchiato"
-- config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = "flexoki-dark"

config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = 'RESIZE'

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
-- config.keys = {}
-- for key, direction in pairs({ 'j', 'k', 'h', 'l' },
-- 	                    { 'Down', 'Up', 'Left', 'Right' }) do
--   table.insert(keys, {
--     key = key,
--     mods = 'LEADER',
--     action = wezterm.action.ActivatePaneDirection(direction)
--   })
-- end

-- setup ssh channel
config.ssh_domains = wezterm.default_ssh_domains()
config.keys = {
  { key = 'a', mods = 'LEADER', action = action.AttachDomain 'SSHMUX:omeda' },
  -- Detaches the domain associated with the current pane
  {
    key = 'd',
    mods = 'LEADER',
    action = action.DetachDomain 'CurrentPaneDomain',
  },
  -- Detaches the "devhost" domain
  -- {
    -- key = 'e',
    -- mods = 'LEADER',
    -- action = action.DetachDomain { DomainName = 'devhost' },
  -- },
}


-- Finally, return the configuration to wezterm:
return config
