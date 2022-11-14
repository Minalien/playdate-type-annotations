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
	Loads the compiled .pdz file at the given location and returns the contents as a function. The .pdz extension on path is optional.

	https://sdk.play.date/inside-playdate/#f-file.load
]]
---@param path string
---@param env? table If specified, is a table to use as the function’s global namespace instead of _G.
function playdate.file.load(path, env) end

--[[
	Runs the pdz file at the given location. Equivalent to playdate.file.load(path, env)().

	The .pdz extension on path is optional. Values returned from the pdz file are left on the stack.

	https://sdk.play.date/inside-playdate/#f-file.run
]]
---@param path string
---@param env? table If specified, is a table to use as the function’s global namespace instead of _G.
function playdate.file.run(path, env) end
