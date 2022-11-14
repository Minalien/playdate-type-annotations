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
	If flag is false, automatic garbage collection is disabled and the game should manually collect garbage with Lua’s collectgarbage() function.

	https://sdk.play.date/inside-playdate/#f-setCollectsGarbage
]]
---@param flag boolean
function playdate.setCollectsGarbage(flag) end

--[[
	Force the Lua garbage collector to run for at least ms milliseconds every frame, so that garbage doesn’t pile up and cause the game to run out of memory and stall in emergency garbage collection. The default value is 5 milliseconds.

	If your game isn’t generating a lot of garbage, it might be advantageous to set a smaller minimum GC time, granting more CPU bandwidth to your game.

	https://sdk.play.date/inside-playdate/#f-setMinimumGCTime
]]
---@param ms integer
function playdate.setMinimumGCTime(ms) end

--[[
	When the amount of used memory is less than min (scaled from 0-1, as a percentage of total system memory), the system will only run the collector for the minimum GC time, as set by playdate.setGCScaling(), every frame. If the used memory is more than max, the system will spend all free time running the collector. Between the two, the time used by the garbage collector is scaled proportionally.

	For example, if the scaling is set to a min of 0.4 and max of 0.7, and memory is half full, the collector will run for the minimum GC time plus 1/3 of whatever time is left before the next frame (because (0.5 - 0.4) / (0.7 - 0.4) = 1/3).

	The default behavior is a scaling of (0.0, 1.0). If set to (0.0, 0.0), the system will use all available extra time each frame running GC.

	https://sdk.play.date/inside-playdate/#f-setGCScaling
]]
---@param min number
---@param max number
function playdate.setGCScaling(min, max) end
