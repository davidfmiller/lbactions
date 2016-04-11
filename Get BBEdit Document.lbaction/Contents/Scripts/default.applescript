
property BBEDIT : "com.barebones.BBEdit"

(*
 @param bundleId - bundle id of application 
*)
on isApplicationRunning(bundleId)
	tell application "System Events"
		return (bundle identifier of processes) contains bundleId
	end tell
end isApplicationRunning

on run
	-- if BBEdit is not running, beep and exit
	if (not isApplicationRunning(BBEDIT)) then
		beep
		return
	else
		tell application "BBEdit"
			-- if no windows are open, beep and exit
			if ((count of text windows) is 0) then
				beep
				return
			else
				-- retrieve frontmost document and return its info
				set doc to document of text window 1
				set docfile to file of doc
				try
					set returnObject to [{|path|:docfile, title:POSIX path of docfile}]
					return returnObject
				on error
					beep
				end try
			end if
		end tell
	end if
end run
