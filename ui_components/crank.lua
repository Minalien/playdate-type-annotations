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
	playdate.ui.crankIndicator provides a small system-styled indicator, alerting the player that this game will use the crank. This is often used in conjunction with playdate.isCrankDocked(), to determine if the player has the crank extended.

	You must import CoreLibs/ui to use crankIndicator. There is no need to instantiate a crankIndicator object: simply call playdate.ui.crankIndicator:start() to begin using it, and playdate.ui.crankIndicator:update() once each frame to display it and make it animate. The crank alert will disappear once you stop calling :update(). 

	https://sdk.play.date/inside-playdate/#C-ui.crankIndicator
]]
playdate.ui.crankIndicator = {}

--[[
	Initializes or resets the crankIndicator. Should be called before showing the alert.

	https://sdk.play.date/inside-playdate/#f-crankIndicator.start
]]
function playdate.ui.crankIndicator:start() end

--[[
	Draws the alert.

	playdate.crankIndicator uses playdate.timer internally, so be sure to call playdate.timer.updateTimers() in your main playdate.update() function. 

	https://sdk.play.date/inside-playdate/#f-crankIndicator.start
]]
function playdate.ui.crankIndicator:update() end

--[[
	Boolean property specifying which direction to animate the crank. Defaults to true.

	https://sdk.play.date/inside-playdate/#v-crankIndicator.clockwise
]]
---@type boolean
playdate.ui.crankIndicator.clockwise = true
