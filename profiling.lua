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
	Suspect some code is running hot? Wrap it in an anonymous function and pass it to sample() like so:

	sample("name of this sample", function()
		-- nested for loops, lots of table creation, member access...
	end)

	By moving around where you start and end the anonymous function in your code, you can get a better idea of where the problem lies.

	Multiple code paths can be sampled at once by using different names for each sample.

	https://sdk.play.date/inside-playdate/#lua-sample
]]
---@param name string
---@param func fun()
function sample(name, func) end

--[[
	Returns a table containing percentages for each system task, such as:

	{ "kernel"=0.23, "game"=0.62, "audio"=0.15 }

	https://sdk.play.date/inside-playdate/#f-playdate.getStats
]]
---@return { [string]: number }
function playdate.getStats() end

--[[
	Sets the length of time for each sample frame of runtime stats. Set seconds to zero to disable stats collection.

	https://sdk.play.date/inside-playdate/#f-playdate.setStatsInterval
]]
---@param seconds integer
function playdate.setStatsInterval(seconds) end
