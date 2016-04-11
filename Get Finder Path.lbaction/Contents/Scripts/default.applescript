

on run
	tell application "Finder"
		-- if no windows are open, beep and exit
		if ((count of windows) is 0) then
			beep
			return
		else
			try
				set doc to window 1
				set mytarget to (target of window 1 as text)
				set mypath to POSIX path of mytarget
				
				set returnObject to [{|path|:mypath, title:POSIX path of mypath}]
				return returnObject
			on error
				beep
			end try
			
		end if
	end tell
	
end run
