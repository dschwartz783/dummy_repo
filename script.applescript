# --- Version: 1.0 (2016) ---
# NOTE: All installation files must be in folder: 'MAC Installers' in the 'Resources' folder.

set appName to "MAC Copy Installers"
set applicationTitle to appName & " (by ProGrammer)"

################################################

-- Define Master Source Path
tell application "Finder"
	set usbPath to (container of (path to me)) as text
	set installersFolder to usbPath & "Resources:MAC Installers:"
end tell
-- Define Master Source Path Completed

-- Define Startup Disk
tell application "System Events"
	set Startupdisk to name of startup disk
	set currentUser to name of current user
end tell
set applicationIcon to (usbPath & "Resources:CompanyLogo.png")

-- Copy 'Installers Folder To Local 'Shared' User Folder
set targetLocation to (path to shared documents) as string
tell application "Finder"
	set sourcePath to installersFolder
	if not (exists sourcePath) then
		set sourcePath to choose folder with prompt "The source was not found! Please select the 'MAC Installation Files' folder manually" with multiple selections allowed
	end if
	duplicate folder sourcePath to targetLocation with replacing
	display dialog "Successfully copied installers to local folder:" & return & return & Startupdisk & "/Users/Shared" buttons {"Open Folder", "Exit"} default button 1 with icon file applicationIcon with title applicationTitle giving up after 10
	if button returned of result = "Open Folder" then
		tell application "Finder"
			open (targetLocation & "MAC Installers")
		end tell
	end if
end tell
