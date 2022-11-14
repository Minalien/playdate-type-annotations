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
	Opens the keyboard, taking over input focus.

	text, if provided, will be used to set the initial text value of the keyboard.

	https://sdk.play.date/inside-playdate/#f-keyboard.show
]]
---@param text string
function playdate.keyboard.show(text) end

--[[
	Hides the keyboard.

	https://sdk.play.date/inside-playdate/#m-keyboard.hide
]]
function playdate.keyboard.hide() end

--[[
	Access or set the text value of the keyboard.

	https://sdk.play.date/inside-playdate/#v-keyboard.text
]]
---@type string
playdate.keyboard.text = ''

---@alias CapitalizationBehavior
---|`playdate.keyboard.kCapitalizationNormal`
---|`playdate.keyboard.kCapitalizationWords`
---|`playdate.keyboard.kCapitalizationSentences`

--[[
	behavior should be one of the constants playdate.keyboard.kCapitalizationNormal, playdate.keyboard.kCapitalizationWords, or playdate.keyboard.kCapitalizationSentences.

	In the case of playdate.keyboard.kCapitalizationWords, the keyboard selection will automatically move to the upper case column after a space is entered. For playdate.keyboard.kCapitalizationSentences the selection will automatically move to the upper case column after a period and a space have been entered.

	https://sdk.play.date/inside-playdate/#f-keyboard.setCapitalizationBehavior
]]
---@param behavior CapitalizationBehavior
function playdate.keyboard.setCapitalizationBehavior(behavior) end

--[[
	Returns the current x location of the left edge of the keyboard.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#f-keyboard.left
]]
---@return integer
function playdate.keyboard.left() end

--[[
	Returns the pixel width of the keyboard.

	https://sdk.play.date/inside-playdate/#f-keyboard.width
]]
---@return integer
function playdate.keyboard.width() end

--[[
	Returns true if the keyboard is currently being shown.

	https://sdk.play.date/inside-playdate/#f-keyboard.isVisible
]]
---@return boolean
function playdate.keyboard.isVisible() end

--[[
	If set, this function will be called when the keyboard is finished the opening animation.

	https://sdk.play.date/inside-playdate/#c-keyboard.keyboardDidShowCallback
]]
function playdate.keyboard.keyboardDidShowCallback() end

--[[
	If set, this function will be called when the keyboard has finished the hide animation.

	https://sdk.play.date/inside-playdate/#c-keyboard.keyboardDidHideCallback
]]
function playdate.keyboard.keyboardDidHideCallback() end

--[[
	If set, this function will be called when the keyboard starts to close. A Boolean argument will be passed to the callback, true if the user selected "OK" close the keyboard, false otherwise.

	https://sdk.play.date/inside-playdate/#c-keyboard.keyboardWillHideCallback
]]
function playdate.keyboard.keyboardWillHideCallback() end

--[[
	If set, this function is called as the keyboard animates open or closed. Provided as a way to sync animations with the keyboard movement.

	https://sdk.play.date/inside-playdate/#c-keyboard.keyboardAnimatingCallback
]]
function playdate.keyboard.keyboardAnimatingCallback() end

--[[
	If set, this function will be called every time a character is entered or deleted.

	https://sdk.play.date/inside-playdate/#c-keyboard.textChangedCallback
]]
function playdate.keyboard.textChangedCallback() end
