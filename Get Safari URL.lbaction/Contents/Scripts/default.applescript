property SAFARI : "com.apple.Safari"

-- is application running?
on app_running(bundleId)
	tell application "System Events"
		return (bundle identifier of processes) contains bundleId
	end tell
end app_running

-- This handler is called when the user runs the action:
on run
	if app_running(SAFARI) then
		-- Info the current Safari tab back to Launchbar
		tell application "Safari"
			try
				set theURL to URL of current tab of window 1
				set theTitle to name of current tab of window 1
				set theLink to theTitle & " " & theURL as string
				return [{title:theURL, |URL|:theURL, icon:"URL.icns"}]
			on error
				beep
			end try
		end tell
	else
		beep
	end if
end run