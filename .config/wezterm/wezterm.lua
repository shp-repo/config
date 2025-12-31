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
config.font = wezterm.font('JetBrainsMono Nerd Font', {weight="Light"})
config.font_size = 13
-- config.line_height = 1.1

-- config.color_scheme = 'Tokyo Night Moon'
-- config.color_scheme = "Gruvbox Dark (Gogh)"
config.color_scheme = "Catppuccin Macchiato"
-- config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = "flexoki-dark"

-- config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = 'RESIZE'

config.leader = { key = '\\', mods = 'CTRL', timeout_milliseconds = 1000 }
-- config.keys = {}
-- for key, direction in pairs({ 'j', 'k', 'h', 'l' },
-- 	                    { 'Down', 'Up', 'Left', 'Right' }) do
--   table.insert(keys, {
--     key = key,
--     mods = 'LEADER',
--     action = wezterm.action.ActivatePaneDirection(direction)
--   })
-- end

-- fancy tab bar
config.window_frame = {
  -- The font used in the tab bar.
  -- Roboto Bold is the default; this font is bundled
  -- with wezterm.
  -- Whatever font is selected here, it will have the
  -- main font setting appended to it to pick up any
  -- fallback fonts you may have used there.
  font = wezterm.font { family = 'CaskaydiaCove Nerd Font', weight = 'Bold' },

  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 13.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#333333',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#333333',
}

config.colors = {
  tab_bar = {
    -- The color of the inactive tab bar edge/divider
    inactive_tab_edge = '#575757',
  },
}

wezterm.on(
  'update-right-status',
  function(window, pane)
    window:set_right_status(wezterm.format {
      { Background = { Color = '#2b2042' } },
      { Foreground = { Color = '#c0c0c0' } },
      { Text = '  ' .. window:active_workspace() .. '  '},
      { Text = '  ' .. wezterm.hostname() .. '  ' },
      { Background = { Color = '#1b1032' } },
      { Foreground = { Color = '#808080' } },
      { Text = '  ' .. wezterm.strftime('%a %b %-d %H:%M') .. '  ' },
    })
  end
)

--[[
-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  else
  -- Otherwise, use the title from the active pane in that tab
    return tab_info.active_pane.title
  end
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background = '#0b0022'
    local background = '#1b1032'
    local foreground = '#808080'

    if tab.is_active then
      background = '#2b2042'
      foreground = '#c0c0c0'
    elseif hover then
      background = '#3b3052'
      foreground = '#909090'
    end

    local edge_foreground = background

    local title = tab_title(tab)

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    title = wezterm.truncate_right(title, max_width - 2)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_LEFT_ARROW },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = title },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_RIGHT_ARROW },
    }
  end
)
--]]

-- setup ssh channel
config.ssh_domains = wezterm.default_ssh_domains()

config.keys = {
  { key = 'a',
    mods = 'LEADER',
    action = action.AttachDomain 'SSHMUX:omeda'
  },
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
