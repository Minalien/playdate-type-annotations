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
	This variable—not a function, so don’t invoke with ()—it is set to 1 when running inside of the simulator and is nil otherwise.

	https://sdk.play.date/inside-playdate/#v-isSimulator
]]
---@type 1|nil
playdate.isSimulator = nil

--[[
	Writes an image to a PNG file at the path specified. Only available on the simulator.

	path represents a path on your development computer, not the Playdate filesystem. It’s recommended you prefix your path with ~/ to ensure you are writing to a writeable directory, for example, ~/myImageFile.png. Please include the .png file extension in your path name. Any directories in your path must already exist on your development computer in order for the file to be written. 

	https://sdk.play.date/inside-playdate/#f-simulator.writeToFile
]]
---@param image playdate.graphics.image
---@param path string
function playdate.simulator.writeToFile(image, path) end

--[[
	Quits the Playdate Simulator app.

	https://sdk.play.date/inside-playdate/#f-simulator.exit
]]
function playdate.simulator.exit() end

--[[
	Returns the contents of the URL url as a string.

	https://sdk.play.date/inside-playdate/#f-simulator.getURL
]]
---@param url string
---@return string
function playdate.simulator.getURL(url) end

--[[
	Clears the simulator console.

	https://sdk.play.date/inside-playdate/#f-clearConsole
]]
function playdate.clearConsole() end

--[[
	Sets the color of the playdate.debugDraw() overlay image.

	https://sdk.play.date/inside-playdate/#f-setDebugDrawColor
]]
---@param r number
---@param g number
---@param b number
---@param a number
function playdate.setDebugDrawColor(r, g, b, a) end

--[[
	Lets you act on keyboard keypresses when running in the Simulator ONLY. These can be useful for adding debugging functions that can be enabled via your keyboard.
	
	It is possible test a game on Playdate hardware and trap computer keyboard keypresses if you are using the Simulator’s Control Device with Simulator option.

	key is a string containing the character pressed or released on the keyboard. Note that:

    The key in question needs to have a textual representation or these functions will not be called. For instance, alphanumeric keys will call these functions; keyboard directional arrows will not.

    If the keypress in question is already in use by the Simulator for another purpose (say, to control the d-pad or A/B buttons), these functions will not be called.

	https://sdk.play.date/inside-playdate/#c-keyPressed
]]
---@param key string
function playdate.keyPressed(key) end

--[[
	Lets you act on keyboard key releases when running in the Simulator ONLY. These can be useful for adding debugging functions that can be enabled via your keyboard.

	https://sdk.play.date/inside-playdate/#c-keyReleased
]]
---@param key string
function playdate.keyReleased(key) end

--[[
	Called immediately after playdate.update(), any drawing performed during this callback is overlaid on the display in 50% transparent red (or another color selected with playdate.setDebugDrawColor()).

	White pixels are drawn in the debugDrawColor. Black pixels are transparent.

	https://sdk.play.date/inside-playdate/#c-debugDraw
]]
function playdate.debugDraw() end
