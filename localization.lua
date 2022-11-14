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

---@alias PlaydateLanguage
---|`playdate.graphics.font.kLanguageEnglish`
---|`playdate.graphics.font.kLanguageJapanese`

--[[
	Returns the current language of the system, which will be one of the constants playdate.graphics.font.kLanguageEnglish or playdate.graphics.font.kLanguageJapanese.

	https://sdk.play.date/inside-playdate/#f-getSystemLanguage
]]
---@return PlaydateLanguage
function playdate.getSystemLanguage() end
