on run
	
	tell application "Xcode"
		
		set lastWord to ""
		
		try
			set lastWord to (word -1 of (get name of window 1))
			if (lastWord is equal to "Edited") then
				set lastWord to (word -2 of (get name of window 1))
			end if
			
			set currentDocument to document 1 whose name ends with lastWord
		on error
			beep
			set returnObject to []
			return
		end try
		
		
		try
			set returnObject to [{|path|:path of currentDocument, title:path of currentDocument, subtitle:"Retrieve frontmost source file in Xcode"}]
			return returnObject
		on error
			beep
		end try
		
		--	set  to path of currentDocument
		
		--	path of last item of source documents
		
	end tell
	
end run