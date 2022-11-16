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

---@class playdate.graphics.video : Object
playdate.graphics.video = {}

--[[
	Returns a playdate.graphics.video object from the pdv file at path. If the file at path can’t be opened, the function returns nil.

	https://sdk.play.date/inside-playdate/#f-graphics.video.new
]]
---@return playdate.graphics.video|nil
function playdate.graphics.video.new(path) end

--[[
	Returns the width and height of the video as multiple vlaues (width, height).

	https://sdk.play.date/inside-playdate/#m-graphics.video.getSize
]]
---@return integer width, integer height
function playdate.graphics.video:getSize() end

--[[
	Returns the number of frames in the video.

	https://sdk.play.date/inside-playdate/#m-graphics.video.getFrameCount
]]
---@return integer
function playdate.graphics.video:getFrameCount() end

--[[
	Returns the number of frames per second of the video source. This number is simply for record-keeping, it is not used internally—​the game code is responsible for figuring out which frame to show when.

	https://sdk.play.date/inside-playdate/#m-graphics.video.getFrameRate
]]
---@return integer
function playdate.graphics.video:getFrameRate() end

--[[
	Sets the given image to the video render context. Future video:renderFrame() calls will draw into this image.

	https://sdk.play.date/inside-playdate/#m-graphics.video.setContext
]]
---@param image playdate.graphics.image
function playdate.graphics.video:setContext(image) end

--[[
	Returns the image into which the video will be rendered, creating it if needed.

	https://sdk.play.date/inside-playdate/#m-graphics.video.getContext
]]
---@return playdate.graphics.image
function playdate.graphics.video:getContext() end

--[[
	Sets the display framebuffer as the video’s render context.

	https://sdk.play.date/inside-playdate/#m-graphics.video.useScreenContext
]]
function playdate.graphics.video:useScreenContext() end

--[[
	Draws the given frame into the video’s render context.

	https://sdk.play.date/inside-playdate/#m-graphics.video.renderFrame
]]
---@param number integer
function playdate.graphics.video:renderFrame(number) end
