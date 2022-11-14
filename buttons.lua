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

---@alias PlaydateButton
---|`playdate.kButtonA`
---|`playdate.kButtonB`
---|`playdate.kButtonUp`
---|`playdate.kButtonDown`
---|`playdate.kButtonLeft`
---|`playdate.kButtonRight`
---|'a'
---|'b'
---|'up'
---|'down'
---|'left'
---|'right'

--[[
	Returns true if button is currently being pressed.

	https://sdk.play.date/inside-playdate/#f-buttonIsPressed
]]
---@param button PlaydateButton
---@return boolean
function playdate.buttonIsPressed(button) end

--[[
	Returns true for just one update cycle if button was pressed. buttonJustPressed will not return true again until the button is released and pressed again. This is useful for, say, a player "jump" action, so the jump action is taken only once and not on every single update.

	https://sdk.play.date/inside-playdate/#f-buttonJustPressed
]]
---@param button PlaydateButton
---@return boolean
function playdate.buttonJustPressed(button) end

--[[
	Returns true for just one update cycle if button was released. buttonJustReleased will not return true again until the button is pressed and released again.

	https://sdk.play.date/inside-playdate/#f-buttonJustReleased
]]
---@param button PlaydateButton
---@return boolean
function playdate.buttonJustReleased(button) end

--[[
	Returns the above data in one call, with multiple return values (current, pressed, released) containing bitmasks indicating which buttons are currently down, and which were pressed and released since the last update. For example, if the d-pad left button and the A button are both down, the current value will be (playdate.kButtonA|playdate.kButtonLeft).

	https://sdk.play.date/inside-playdate/#f-getButtonState
]]
---@return integer current, integer pressed, integer released
function playdate.getButtonState() end

--[[
	Called immediately after the player presses the A Button.

	https://sdk.play.date/inside-playdate/#c-AButtonDown
]]
function playdate.AButtonDown() end
--[[
	Called after the A Button is held down for one second. This can be used for secondary actions (e.g., displaying a game world map, changing weapons).

	https://sdk.play.date/inside-playdate/#c-AButtonHeld
]]
function playdate.AButtonHeld() end
--[[
	Called immediately after the player releases the A Button.

	https://sdk.play.date/inside-playdate/#c-AButtonUp
]]
function playdate.AButtonUp() end
--[[
	Called immediately after the player presses the B Button.

	https://sdk.play.date/inside-playdate/#c-BButtonDown
]]
function playdate.BButtonDown() end
--[[
	Called after the B Button is held down for one second. This can be used for secondary actions (e.g., displaying a game world map, changing weapons).

	https://sdk.play.date/inside-playdate/#c-BButtonHeld
]]
function playdate.BButtonHeld() end
--[[
	Called immediately after the player releases the B Button.

	https://sdk.play.date/inside-playdate/#c-BButtonUp
]]
function playdate.BButtonUp() end

--[[
	Called immediately after the player presses the up direction on the d-pad.

	https://sdk.play.date/inside-playdate/#c-upButtonDown
]]
function playdate.upButtonDown() end
--[[
	Called immediately after the player releases the up direction on the d-pad.

	https://sdk.play.date/inside-playdate/#c-upButtonUp
]]
function playdate.upButtonUp() end
--[[
	Called immediately after the player presses the down direction on the d-pad.

	https://sdk.play.date/inside-playdate/#c-downButtonDown
]]
function playdate.downButtonDown() end
--[[
	Called immediately after the player releases the down direction on the d-pad.

	https://sdk.play.date/inside-playdate/#c-downButtonUp
]]
function playdate.downButtonUp() end
--[[
	Called immediately after the player presses the left direction on the d-pad.

	https://sdk.play.date/inside-playdate/#c-leftButtonDown
]]
function playdate.leftButtonDown() end
--[[
	Called immediately after the player releases the left direction on the d-pad.

	https://sdk.play.date/inside-playdate/#c-leftButtonUp
]]
function playdate.leftButtonUp() end
--[[
	Called immediately after the player presses the right direction on the d-pad.

	https://sdk.play.date/inside-playdate/#c-rightButtonDown
]]
function playdate.rightButtonDown() end
--[[
	Called immediately after the player releases the right direction on the d-pad.

	https://sdk.play.date/inside-playdate/#c-rightButtonUp
]]
function playdate.rightButtonUp() end
