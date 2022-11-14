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
	Returns a boolean indicating whether or not the crank is folded into the unit.

	https://sdk.play.date/inside-playdate/#f-isCrankDocked
]]
---@return boolean
function playdate.isCrankDocked() end

--[[
	Returns the absolute position of the crank (in degrees). Zero is pointing straight up parallel to the device. Turning the crank clockwise (when looking at the right edge of an upright device) increases the angle, up to a maximum value 359.9999. The value then resets back to zero as the crank continues its rotation.

	https://sdk.play.date/inside-playdate/#f-getCrankPosition
]]
---@return number
function playdate.getCrankPosition() end

--[[
	Returns two values, change and acceleratedChange. change represents the angle change (in degrees) of the crank since the last time this function (or the playdate.cranked() callback) was called. Negative values are anti-clockwise. acceleratedChange is change multiplied by a value that increases as the crank moves faster, similar to the way mouse acceleration works.

	https://sdk.play.date/inside-playdate/#f-getCrankChange
]]
---@return number change, number acceleratedChange
function playdate.getCrankChange() end

--[[
	Returns the number of "ticks" — whose frequency is defined by the value of ticksPerRevolution — the crank has turned through since the last time this function was called. Tick boundaries are set at absolute positions along the crank’s rotation. Ticks can be positive or negative, depending upon the direction of rotation.

	For example, say you have a movie player and you want your movie to advance 6 frames for every one revolution of the crank. Calling playdate.getCrankTicks(6) during each update will give you a return value of 1 as the crank turns past each 60 degree increment. (Since we passed in a 6, each tick represents 360 ÷ 6 = 60 degrees.) So getCrankTicks(6) will return a 1 as the crank turns past the 0 degree absolute position, the 60 degree absolute position, and so on for the 120, 180, 240, and 300 degree positions. Otherwise, 0 will be returned. (-1 will be returned if the crank moves past one of these mentioned positions while going in a backward direction.)

	https://sdk.play.date/inside-playdate/#f-getCrankTicks
]]
---@param ticksPerRevolution integer
---@return integer
function playdate.getCrankTicks(ticksPerRevolution) end

--[[
	For playdate.cranked(), change is the angle change in degrees. acceleratedChange is change multiplied by a value that increases as the crank moves faster, similar to the way mouse acceleration works. Negative values are anti-clockwise.

	https://sdk.play.date/inside-playdate/#c-cranked
]]
---@param change number
---@param acceleratedChange number
function playdate.cranked(change, acceleratedChange) end

--[[
	This function, if defined, is called when the crank is docked.

	https://sdk.play.date/inside-playdate/#c-crankDocked
]]
function playdate.crankDocked() end

--[[
	This function, if defined, is called when the crank is undocked.

	https://sdk.play.date/inside-playdate/#c-crankUndocked
]]
function playdate.crankUndocked() end

--[[
	True disables the default crank docking/undocking sound effects. False re-enables them. Useful if the crank sounds seem out-of-place in your game.

	https://sdk.play.date/inside-playdate/#f-playdate.setCrankSoundsDisabled
]]
---@param disable boolean
function playdate.setCrankSoundsDisabled(disable) end
