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
	Returns two values, the current API version of the Playdate runtime and the minimum API version supported by the runtime.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#f-apiVersion
]]
---@return integer currentAPIVersion, integer minimumAPIVersion
function playdate.apiVersion() end

--[[
	The playdate.metadata table contains the values in the current game’s pdxinfo file, keyed by variable name. To retrieve the version number of the game, for example, you would use playdate.metadata.version.

	Changing values in this table at run time has no effect.

	https://sdk.play.date/inside-playdate/#f-metadata
]]
--- @class playdate.metadata
--- @field name string|nil
--- @field author string|nil
--- @field description string|nil
--- @field bundleID string|nil
--- @field version number|nil
--- @field buildNumber integer|nil
--- @field pdxversion integer
--- @field imagePath string|nil
--- @field launchSoundPath string|nil
--- @field contentWarning string|nil
--- @field contentWarning2 string|nil
playdate.metadata = {}
