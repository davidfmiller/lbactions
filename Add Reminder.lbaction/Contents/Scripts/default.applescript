on handle_string(str)

	tell application "Reminders"
		set r to make new reminder
		set name of r to str
	end tell
end handle_string

