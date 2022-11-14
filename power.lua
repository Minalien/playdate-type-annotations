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
	Returns a table holding booleans with the following keys: charging (for any sort of charging), and USB (for USB-specific charging). Test these values for true to see if the device is being charged, and by what means.

	https://sdk.play.date/inside-playdate/#f-getPowerStatus
]]
---@return {charging: boolean, USB: boolean}
function playdate.getPowerStatus() end

--[[
	Returns a value from 0-100 denoting the current level of battery charge. 0 = empty; 100 = full.

	https://sdk.play.date/inside-playdate/#f-getBatteryPercentage
]]
---@return integer
function playdate.getBatteryPercentage() end

--[[
	Returns the battery’s current voltage level.

	https://sdk.play.date/inside-playdate/#f-getBatteryVoltage
]]
---@return number
function playdate.getBatteryVoltage() end
