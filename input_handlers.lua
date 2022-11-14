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
	The InputHandlers architecture allows you to push and pop a series of playdate.inputHandler objects, each capable of handling any or all button and crank interactions. New input is propagated down the stack until it finds the first responder (or drops it altogether), which allows for switching out control schemes and temporarily stealing focus.

	You can define an inputHandler as a table, implementing just as few or as many handler functions as you want and later, put them into effect by pushing them on the stack.

	https://sdk.play.date/inside-playdate/#M-inputHandlers
]]
---@class playdate.inputHandler
---@field AButtonDown? fun()
---@field AButtonHeld? fun()
---@field AButtonUp? fun()
---@field BButtonDown? fun()
---@field BButtonHeld? fun()
---@field BButtonUp? fun()
---@field upButtonDown? fun()
---@field upButtonUp? fun()
---@field downButtonDown? fun()
---@field downButtonUp? fun()
---@field leftButtonDown? fun()
---@field leftButtonUp? fun()
---@field rightButtonDown? fun()
---@field rightButtonUp? fun()
---@field cranked? fun(change: number, acceleratedChange: number)
playdate.inputHandler = {}

playdate.inputHandlers = {}

--[[
	Pushes a new input handler onto the stack.

	https://sdk.play.date/inside-playdate/#f-inputHandlers.push
]]
---@param handler playdate.inputHandler A table containing one or more custom input functions.
---@param masksPreviousHandlers? boolean If true, input functions not defined in handler will not be called. If missing or false, the previously-pushed input handler tables will be searched for input functions missing from handler, cascading down to the default playdate table.
function playdate.inputHandlers.push(handler, masksPreviousHandlers) end

--[[
	Pops the last input handler off of the stack.

	https://sdk.play.date/inside-playdate/#f-inputHandlers.pop
]]
function playdate.inputHandlers.pop() end
