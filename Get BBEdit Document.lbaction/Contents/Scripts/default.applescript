property BBEDIT : "com.barebones.BBEdit"

-- is application running?
on app_running(bundleId)
	tell application "System Events"
		return (bundle identifier of processes) contains bundleId
	end tell
end app_running

on run
	if app_running(BBEDIT) then
		tell application "BBEdit"
			if ((count of text windows) is 0) then
				beep
			else
				set win to text window 1
				set doc to document of win
				set docfile to file of doc
				try
					set returnObject to [{|path|:docfile, title:POSIX path of docfile}]
					return returnObject
				on error
					beep
				end try
			end if
		end tell
	else
		beep
	end if
end run