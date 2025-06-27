-- config.lua
-- Default configuration settings for Pane Resizer

local M = {}

-- Fixed width for NvimTree sidebar
M.NVIMTREE_WIDTH = 30
-- Percentage of available width assigned to the focused window
M.FOCUSED_WIDTH_PERCENTAGE = 0.7
-- Global enable/disable toggle
M.enabled = true
-- Buffers for which resizing is disabled, with fixed width
M.disabled_buffers = {} -- [bufnr] = fixed_width

return M
