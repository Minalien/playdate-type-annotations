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

---@class playdate.menu : Object
playdate.menu = {}

---@class playdate.menu.item : Object
---@field title string Title of the menu item.
---@field value integer|boolean|string Current value for the menu item.
playdate.menu.item = {}

--[[
	Returns a playdate.menu object. Use this to add your custom menu items.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#f-menu.getSystemMenu
]]
---@return playdate.menu
function playdate.getSystemMenu() end

--[[
	When this menu item is selected, the OS will:
		Hide the System Menu.
		Invoke your callback function.
		Unpause your game and call playdate.gameWillResume.

	If the returned playdate.menu.item is nil, a second errorMessage return value will indicate the reason the operation failed.

	https://sdk.play.date/inside-playdate/#m-menu.addMenuItem
]]
---@param title string Title displayed by the menu item.
---@param callback fun() Callback invoked when the menu item is selected.
---@return playdate.menu.item|nil menuItem, string|nil errorMessage
function playdate.menu:addMenuItem(title, callback) end

--[[
	Creates a new menu item that can be checked or unchecked by the player.

	title will be the title displayed by the menu item.

	initialValue can be set to true or false, indicating the checked state of the menu item. Optional, defaults to false.

	If this menu item is interacted with while the system menu is open, callback will be called when the menu is closed, before playdate.gameWillResume is called. The callback function will be passed one argument, a boolean value, indicating the current value of the menu item.

	If the returned playdate.menu.item is nil, a second errorMessage return value will indicate the reason the operation failed.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#m-menu.addCheckmarkMenuItem
]]
---@param title string Title displayed by the menu item.
---@param initialValue boolean Whether the added item is checked or not initially.
---@param callback fun() Callback invoked when the menu item is selected.
---@return playdate.menu.item|nil menuItem, string|nil errorMessage
---@overload fun(title: string, callback: fun()): (playdate.menu.item|nil, string|nil)
function playdate.menu:addCheckmarkMenuItem(title, initialValue, callback) end

--[[
	Creates a menu item that allows the player to cycle through a set of options.

	title will be the title displayed by the menu item.

	options should be an array-style table of strings representing the states the menu item can have. Due to limited horizontal space, the option strings and title should be kept short for this type of menu item.

	initialValue can optionally be set to any of the values in the options array.

	If the value of this menu item is changed while the system menu is open, callback will be called when the menu is closed, before playdate.gameWillResume is called. The callback function will be passed one string argument indicating the currently selection option.

	If the returned playdate.menu.item is nil, a second errorMessage return value will indicate the reason the operation failed.

	https://sdk.play.date/inside-playdate/#m-menu.addOptionsMenuItem
]]
---@param title string Title displayed by the menu item.
---@param options string[] An array-style table of strings representing the states the menu item can have. Due to limited horizontal space, the option strings and title should be kept short for this type of menu item.
---@param initialValue string Can optionally be set to any of the values in the options array.
---@param callback fun() Callback invoked when the menu item is selected.
---@return playdate.menu.item|nil menuItem, string|nil errorMessage
---@overload fun(title: string, options: string[], callback: fun()): (playdate.menu.item|nil, string|nil)
function playdate.menu:addOptionsMenuItem(title, options, initialValue, callback) end

--[[
	Returns an array-style table containing all playdate.menu.items your game has added to the menu.

	https://sdk.play.date/inside-playdate/#m-menu.getMenuItems
]]
---@return playdate.menu.item[]
function playdate.menu:getMenuItems() end

--[[
	Removes the specified playdate.menu.item from the menu.

	https://sdk.play.date/inside-playdate/#m-menu.removeMenuItem
]]
---@param menuItem playdate.menu.item
function playdate.menu:removeMenuItem(menuItem) end

--[[
	Removes from the referenced menu object all playdate.menu.items added by your game.

	https://sdk.play.date/inside-playdate/#m-menu.removeAllMenuItems
]]
function playdate.menu:removeAllMenuItems() end

--[[
	While the game is paused it can optionally provide an image to be displayed alongside the System Menu. Use this function to set that image.

	image should be a 400 x 240 pixel playdate.graphics.image. All important content should be in the left half of the image in an area 200 pixels wide, as the menu will obscure the rest. The right side of the image will be visible briefly as the menu animates in and out.

	Optionally, xOffset can be provided which must be a number between 0 and 200 and will cause the menu image to animate to a position offset left by xOffset pixels as the menu is animated in.

	To remove a previously-set menu image, pass nil for the image argument.
]]
---@param image playdate.graphics.image
---@param xOffset? number
function playdate.setMenuImage(image, xOffset) end

--[[
	Sets the callback function for this menu item.

	https://sdk.play.date/inside-playdate/#m-menu.item.setCallback
]]
---@param callback fun()
function playdate.menu.item:setCallback(callback) end

--[[
	Sets the title displayed for this menu item.

	The title for a menu item can also be set using dot syntax.

	https://sdk.play.date/inside-playdate/#m-menu.item.setTitle
]]
function playdate.menu.item:setTitle(newTitle) end

--[[
	Returns the title displayed for this menu item.

	https://sdk.play.date/inside-playdate/#m-menu.item.getTitle
]]
---@return string
function playdate.menu.item:getTitle() end

--[[
	Sets the value for this menu item. The value is of a different type depending on the type of menu item:
		normal: integer
		checkmark: boolean
		options: string

	Values for any menu type can also be set using integers.

	The value for a menu item can also be set using dot syntax.
]]
---@param newValue integer|boolean|string
function playdate.menu.item:setValue(newValue) end

--[[
	Returns the value for this menu item.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#m-menu.item.getValue
]]
---@return integer|boolean|string
function playdate.menu.item:getValue() end
