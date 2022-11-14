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
	The accelerometer is off by default, to save a bit of power. If you will be using the accelerometer in your game, you’ll first need to call playdate.startAccelerometer() then wait for the next update cycle before reading its values. If you won’t be using the accelerometer again for a while, calling playdate.stopAccelerometer() will put it back into a low-power idle state.

	https://sdk.play.date/inside-playdate/#f-startAccelerometer
]]
function playdate.startAccelerometer() end

--[[
	The accelerometer is off by default, to save a bit of power. If you will be using the accelerometer in your game, you’ll first need to call playdate.startAccelerometer() then wait for the next update cycle before reading its values. If you won’t be using the accelerometer again for a while, calling playdate.stopAccelerometer() will put it back into a low-power idle state.

	https://sdk.play.date/inside-playdate/#f-stopAccelerometer
]]
function playdate.stopAccelerometer() end

--[[
	If the accelerometer has been turned on with playdate.startAccelerometer(), returns the x, y, and z values from the accelerometer as a list. Positive x points right, positive y points to the bottom of the screen, and positive z points through the screen away from the viewer. For example, with the device held upright this function returns the values (0,1,0). With it flat on its back, it returns (0,0,1).

	https://sdk.play.date/inside-playdate/#f-readAccelerometer
]]
---@return number x, number y, number z
function playdate.readAccelerometer() end

--[[
	Returns true if the accelerometer is currently running.

	https://sdk.play.date/inside-playdate/#f-accelerometerIsRunning
]]
---@return boolean
function playdate.accelerometerIsRunning() end
