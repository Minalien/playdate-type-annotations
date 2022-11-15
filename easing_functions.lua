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

---@alias EasingFunction
---|fun(elapsedTime: number, beginningValue: number, changeInValue: number, duration: number)
---|fun(elapsedTime: number, beginningValue: number, changeInValue: number, duration: number, amplitude: number, period: number)
---|fun(elapsedTime: number, beginningValue: number, changeInValue: number, duration: number, overshoot: number)

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.linear(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.inQuad(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.outQuad(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.inOutQuad(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.outInQuad(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.inCubic(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.outCubic(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.inOutCubic(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.outInCubic(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.inQuart(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.outQuart(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.inOutQuart(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.outInQuart(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.inQuint(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.outQuint(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.inOutQuint(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.outInQuint(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.inSine(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.outSine(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.inOutSine(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.outInSine(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.inExpo(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.outExpo(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.inOutExpo(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.outInExpo(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.inCirc(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.outCirc(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.inOutCirc(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.outInCirc(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
---@param a? number Amplitude
---@param p? number Period
function playdate.easingFunctions.inElastic(t, b, c, d, a, p) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
---@param a? number Amplitude
---@param p? number Period
function playdate.easingFunctions.outElastic(t, b, c, d, a, p) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
---@param a? number Amplitude
---@param p? number Period
function playdate.easingFunctions.inOutElastic(t, b, c, d, a, p) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
---@param a? number Amplitude
---@param p? number Period
function playdate.easingFunctions.outInElastic(t, b, c, d, a, p) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
---@param s? number Amount of overshoot
function playdate.easingFunctions.inBack(t, b, c, d, s) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
---@param s? number Amount of overshoot
function playdate.easingFunctions.outBack(t, b, c, d, s) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
---@param s? number Amount of overshoot
function playdate.easingFunctions.inOutBack(t, b, c, d, s) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
---@param s? number Amount of overshoot
function playdate.easingFunctions.outInBack(t, b, c, d, s) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.outBounce(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.inBounce(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.inOutBounce(t, b, c, d) end

--[[
	A set of easing functions to aid with animation timing.

	You must import `CoreLibs/easing` to use these functions.

	https://sdk.play.date/inside-playdate/#M-easingFunctions
]]
---@param t number Elapsed time
---@param b number Beginning Value
---@param c number Change in value
---@param d number Duration
function playdate.easingFunctions.outInBounce(t, b, c, d) end
