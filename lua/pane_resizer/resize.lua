-- resize.lua
-- Contains the core logic for resizing Neovim panes based on focus and configuration

local api = vim.api
local config = require("pane_resizer.config")
local utils = require("pane_resizer.utils")

local M = {}

-- Main function: resizes only the focused window,
-- while preserving fixed widths for excluded or disabled panes
function M.resize_focused_pane()
	if not config.enabled then
		return
	end

	local current_win = api.nvim_get_current_win()
	if utils.should_exclude_window(current_win) then
		return
	end

	local all_wins = api.nvim_tabpage_list_wins(0)
	local resizable_wins = {}
	local width_fixed = 0

	for _, win in ipairs(all_wins) do
		if utils.should_exclude_window(win) then
			goto continue
		end

		local buf = api.nvim_win_get_buf(win)

		-- Fixed width for NvimTree
		if utils.is_buffer_name(win, "NvimTree_") then
			api.nvim_win_set_width(win, config.NVIMTREE_WIDTH)
			width_fixed = width_fixed + config.NVIMTREE_WIDTH
			goto continue
		end

		-- Disabled buffers: apply saved width and exclude from layout
		local disabled_width = config.disabled_buffers[buf]
		if disabled_width then
			api.nvim_win_set_width(win, disabled_width)
			width_fixed = width_fixed + disabled_width
			goto continue
		end

		table.insert(resizable_wins, win)
		::continue::
	end

	local current_buf = api.nvim_win_get_buf(current_win)

	-- If the focused buffer is disabled, no resize should be applied
	if config.disabled_buffers[current_buf] then
		return
	end

	local total_width = vim.o.columns
	local remaining_width = total_width - width_fixed

	local focused_width = math.floor(remaining_width * config.FOCUSED_WIDTH_PERCENTAGE)
	local other_width = math.floor((remaining_width - focused_width) / math.max(#resizable_wins - 1, 1))

	for _, win in ipairs(resizable_wins) do
		if win == current_win then
			api.nvim_win_set_width(win, focused_width)
		else
			api.nvim_win_set_width(win, other_width)
		end
	end
end

return M
