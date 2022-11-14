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
	Returns true if the user has checked the "Reduce Flashing" option in Playdate Settings; false otherwise. Games should read this value and, if true, avoid visuals that could be problematic for people with sensitivities to flashing lights or patterns.

	https://sdk.play.date/inside-playdate/#f-playdate.getReduceFlashing
]]
---@return boolean
function playdate.getReduceFlashing() end

--[[
	Returns true if the user has checked the "Upside Down" option in Playdate Settings; false otherwise. (Upside Down mode can be convenient for players wanting to hold Playdate upside-down so they can use their left hand to operate the crank.)

	Typically your game doesn’t need to anything in regards to this setting. But it is available in case your game wants to take some special actions, display special instructions, etc.

	https://sdk.play.date/inside-playdate/#f-playdate.getFlipped
]]
---@return boolean
function playdate.getFlipped() end
