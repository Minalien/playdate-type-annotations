--[[
	PlayDate SDK Types Meta-File
	A collection of type annotations for the PlayDate SDK
	Compatible with SDK 1.12.3

	This file should NOT actually be imported; VSCode should automatically reference it for type completion.
	Importing this file will likely break things, as some functions are redefined for the sake of providing type definition.

	Originally written by Minalien (https://cohost.org/Minalien).
	Consider this file public domain.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#api-reference
]]
---@meta

--[[
	Called when the player chooses to exit the game via the System Menu or Menu button.

	https://sdk.play.date/inside-playdate/#c-gameWillTerminate
]]
function playdate.gameWillTerminate() end

--[[
	Called before the device goes to low-power sleep mode because of a low battery.

	https://sdk.play.date/inside-playdate/#c-deviceWillSleep
]]
function playdate.deviceWillSleep() end

--[[
	If your game is running on the Playdate when the device is locked, this function will be called. Implementing this function allows your game to take special action when the Playdate is locked, e.g., saving state.

	https://sdk.play.date/inside-playdate/#c-deviceWillLock
]]
function playdate.deviceWillLock() end

--[[
	If your game is running on the Playdate when the device is unlocked, this function will be called.

	https://sdk.play.date/inside-playdate/#c-deviceDidUnlock
]]
function playdate.deviceDidUnlock() end

--[[
	Called before the system pauses the game. (In the current version of Playdate OS, this only happens when the device’s Menu button is pushed.) Implementing these functions allows your game to take special action when it is paused, e.g., updating the menu image.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#c-gameWillPause
]]
function playdate.gameWillPause() end

--[[
	Called before the system resumes the game.

	https://sdk.play.date/inside-playdate/#c-gameWillResume
]]
function playdate.gameWillResume() end
