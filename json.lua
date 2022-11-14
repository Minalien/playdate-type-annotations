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
	Takes the JSON encoded string and converts it to a Lua table.

	Equivalent to `playdate->json->decode()` in the C API.

	https://sdk.play.date/inside-playdate/#f-json.decode
]]
---@param string string
---@return { [string]: any }
function json.decde(string) end

--[[
	Reads the given playdate.file.file object and converts it to a Lua table.

	https://sdk.play.date/inside-playdate/#f-json.decodeFile-file
]]
---@param file playdate.file.file|string
---@return { [string]: any }
function json.decodeFile(file) end

--[[
	Returns a string containing the JSON representation of the passed-in Lua table.

	https://sdk.play.date/inside-playdate/#f-json.encode
]]
---@param table table
---@return string
function json.encode(table) end

--[[
	Returns a string containing the JSON representation of a Lua table, with human-readable formatting.

	https://sdk.play.date/inside-playdate/#f-json.encodePretty
]]
---@param table table
---@return string
function json.encodePretty(table) end

--[[
	Encodes the Lua table table to JSON and writes it to the given playdate.file.file object. If pretty is true, the output is formatted to make it human-readable. Otherwise, no additional whitespace is added.

	https://sdk.play.date/inside-playdate/#f-json.encodeToFile-file
]]
---@param file playdate.file.file|string
---@param pretty boolean|table
---@param table? table
function json.encodeToFile(file, pretty, table) end
