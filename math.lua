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
	Returns a number that is the linear interpolation between min and max based on t, where t = 0.0 will return min and t = 1.0 will return max.

	You must import CoreLibs/math to use this function. 
]]
---@param min number
---@param max number
---@param t number
---@return number
function playdate.math.lerp(min, max, t) end
