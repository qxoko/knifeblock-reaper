-- saves all markers in a project to a file
-- named 'markers.csv' in the project's
-- directory

-- warning: may throw an error if the project is
-- not yet saved to disk!

-- retrieves the .rpp project path
function get_path(file_name)
	local proj, str = reaper.EnumProjects(-1, "")
	local path = str:match("(.*/)")

	-- windows fallback for backslashes
	if path == nil then
		path = str:match("(.*\\)")
	end

	return path .. file_name
end

-- loop over all the markers and export a *tsv* of timestamps
function export_markers()
	local f = io.open(get_path("markers.csv"), "w")

	i = 0
	while true do
		local success, is_region, start, close, name, region_index = reaper.EnumProjectMarkers(i)
		if success == 0 then
			break
		end

		i = i + 1

		local label
		if is_region then
			label = "R" .. region_index
			start = reaper.format_timestr_pos(math.floor(start), "", 5)
			close = reaper.format_timestr_pos(math.floor(close), "", 5)
		else
			label = "M" .. region_index
			start = reaper.format_timestr_pos(math.floor(start), "", 5)
			close = start
		end

		f:write(label .. "\t" .. start .. "\t" .. close .. "\t" .. name)
		f:write("\n")
	end

	f:close()
end

reaper.defer(export_markers)