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
	Generates a random string of uppercase letters

	https://sdk.play.date/inside-playdate/#f-string.UUID
]]
---@param length integer
---@return string
function playdate.string.uuid(length) end

--[[
	Returns a string with the whitespace removed from the beginning and ending of string.

	https://sdk.play.date/inside-playdate/#f-string.trimWhitespace
]]
---@param string string
---@return string
function playdate.string.trimWhitespace(string) end

--[[
	Returns a string with the whitespace removed from the beginning of string.

	https://sdk.play.date/inside-playdate/#f-string.trimLeadingWhitespace
]]
---@param string string
---@return string
function playdate.string.trimLeadingWhitespace(string) end

--[[
	Returns a string with the whitespace removed from the ending of string.

	https://sdk.play.date/inside-playdate/#f-string.trimTrailingWhitespace
]]
---@param string string
---@return string
function playdate.string.trimTrailingWhitespace(string) end
