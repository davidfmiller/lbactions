
on open (theItems)
	set theItem to item 1 of theItems
	tell application "Finder"
		activate
		set newWindow to make new Finder window
		set target of newWindow to theItem
	end tell
end open