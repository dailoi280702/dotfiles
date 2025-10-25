local M = {}
M.__index = M

local timer = nil
local config = nil

require("hs.fs")
require("hs.timer")
require("hs.alert")
require("hs.notify")

local function expandTilde(path)
	if path:sub(1, 1) == "~" then
		local homeDir = os.getenv("HOME")
		if homeDir then
			return homeDir .. path:sub(2)
		end
	end
	return path
end

local function listDirContents(path)
	local result = hs.execute("/bin/ls -A '" .. path:gsub("'", "'\\''") .. "'")

	if result and #result > 0 then
		local names = {}
		for name in result:gmatch("([^\n]+)") do
			local trimmed_name = name:gsub("^%s*(.-)%s*$", "%1")
			if trimmed_name ~= "" then
				table.insert(names, trimmed_name)
			end
		end
		return names
	end
	return {}
end

local function deleteItem(filePath, isDirectory, isNonEmpty)
	local pathEscaped = filePath:gsub("'", "'\\''")
	local success = false

	if isDirectory then
		if isNonEmpty then
			local rmrf_output = hs.execute("/bin/rm -rf '" .. pathEscaped .. "'")
			success = (#rmrf_output == 0)
		else
			local rmdir_output = hs.execute("/bin/rmdir '" .. pathEscaped .. "'")
			success = (#rmdir_output == 0)
		end
		return success, true
	else
		local err
		success, err = os.remove(filePath)

		if not success and err and err:find("Directory not empty") then
			return deleteItem(filePath, true, true)
		end
		return success, false
	end
end

function M:run()
	local downloadsPath = config.path
	local now = os.time()
	local filesDeleted = 0
	local foldersDeleted = 0
	local ageThresholdSeconds = config.age

	local fileNames = listDirContents(downloadsPath)

	if not fileNames or type(fileNames) ~= "table" then
		return
	end

	for _, fileName in ipairs(fileNames) do
		if fileName == "" then
			goto continue_loop
		end

		local filePath = downloadsPath .. fileName
		local attributes = hs.fs.attributes(filePath)

		if not attributes then
			goto continue_loop
		end

		local fileTime = attributes.creation

		if not fileTime then
			fileTime = attributes.modification
			if not fileTime then
				goto continue_loop
			end
		end

		local fileAge = now - fileTime

		if fileAge > ageThresholdSeconds then
			local isDirectory = attributes.type == "directory"
			local isNonEmpty = false

			if isDirectory then
				local dirContents = listDirContents(filePath)
				isNonEmpty = #dirContents > 0
			end

			local success, wasFolder = deleteItem(filePath, isDirectory, isNonEmpty)

			if success then
				if wasFolder then
					foldersDeleted = foldersDeleted + 1
				else
					filesDeleted = filesDeleted + 1
				end
			end
		end

		::continue_loop::
	end

	local totalDeleted = filesDeleted + foldersDeleted

	if totalDeleted > 0 then
		local summaryText = ""
		if filesDeleted > 0 then
			summaryText = summaryText .. filesDeleted .. " old file(s). "
		end
		if foldersDeleted > 0 then
			summaryText = summaryText .. foldersDeleted .. " old folder(s) deleted. "
		end

		hs.notify
			.new({
				title = "Downloads Cleanup Complete",
				informativeText = summaryText,
			})
			:send()
	end
end

function M:init_actual(userConfig)
	userConfig = userConfig or {}

	config = {
		age = userConfig.age or 1800,
		path = userConfig.path or "~/Downloads/",
		scheduleInterval = userConfig.scheduleInterval or 3600, -- Default check every hour
	}

	local t = nil

	if t then
		t:stop()
	end

	config.path = expandTilde(config.path)

	if config.path:sub(-1) ~= "/" then
		config.path = config.path .. "/"
	end

	if config.scheduleInterval > 0 then
		M:run()

		t = hs.timer.doEvery(config.scheduleInterval, function()
			M:run()
		end)
	end

	return self
end

function M.init(...)
	local userConfig = select(1, ...)

	if userConfig and type(userConfig) == "table" then
		return M:init_actual(userConfig)
	else
		return M:init_actual(select(2, ...))
	end
end

return M
