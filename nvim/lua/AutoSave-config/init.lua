local autosave = require("auto-save")

autosave.setup({
	enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
	execution_message = {
		message = function() -- message to print on save
			return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
		end,
		dim = 0.18, -- dim the color of `message`
		cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
	},
	trigger_events = { "InsertLeave" }, -- vim events that trigger auto-save. See :h events
	condition = function(buf)
		local fn = vim.fn
		local utils = require("auto-save.utils.data")

		if fn.getbufvar(buf, "&modifiable") == 1 or utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
			return true -- met condition(s), can save
		end
		return false -- can't save
	end,
	write_all_buffers = false, -- write all buffers when the current one meets `condition`
	debounce_delay = 0, -- saves the file at most every `debounce_delay` milliseconds
})
