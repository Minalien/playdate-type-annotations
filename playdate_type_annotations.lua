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

--#region Table Additions

--[[
	Returns the first index of element in the given array-style table. If the table does not contain element, the function returns nil.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#t-table.indexOfElement
]]
---@param table table
---@param element any
---@return integer|nil
function table.indexOfElement(table, element) end

--[[
	Returns the size of the given table as a multiple values `(arrayCount, hashCount)`.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#t-table.getsize
]]
---@param table table
---@return integer arrayCount, integer hashCount
function table.getsize(table) end

--[[
	Returns a new Lua table with the array and hash parts preallocated to accommodate arrayCount and hashCount elements respectively.

	https://sdk.play.date/inside-playdate/#t-table.create
]]
---@param arrayCount integer
---@param hashCount integer
function table.create(arrayCount, hashCount) end

--[[
	Returns a shallow copy of the source table. If a destination table is provided, it copies the contents of source into destination and returns destination. The copy will contain references to any nested tables.

	https://sdk.play.date/inside-playdate/#t-table.shallowcopy
]]
---@param source table
---@param destination? table
---@return table
function table.shallowcopy(source, destination) end

--[[
	Returns a deep copy of the source table. The copy will contain copies of any nested tables.

	https://sdk.play.date/inside-playdate/#t-table.deepcopy
]]
---@param source table
---@return table
function table.deepcopy(source) end

--#endregion

--#region System & Game Metadata

--[[
	Returns two values, the current API version of the Playdate runtime and the minimum API version supported by the runtime.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#f-apiVersion
]]
---@return integer currentAPIVersion, integer minimumAPIVersion
function playdate.apiVersion() end

--[[
	The playdate.metadata table contains the values in the current game’s pdxinfo file, keyed by variable name. To retrieve the version number of the game, for example, you would use playdate.metadata.version.

	Changing values in this table at run time has no effect.

	https://sdk.play.date/inside-playdate/#f-metadata
]]
--- @class playdate.metadata
--- @field name string|nil
--- @field author string|nil
--- @field description string|nil
--- @field bundleID string|nil
--- @field version number|nil
--- @field buildNumber integer|nil
--- @field pdxversion integer
--- @field imagePath string|nil
--- @field launchSoundPath string|nil
--- @field contentWarning string|nil
--- @field contentWarning2 string|nil
playdate.metadata = {}

--#endregion

--#region Game Flow

--[[
	Implement this callback and Playdate OS will call it once per frame. This is the place to put the main update-and-draw code for your game. Playdate will attempt to call this function by default 30 times per second; that value can be changed by calling playdate.display.setRefreshRate().

	https://sdk.play.date/inside-playdate/#c-update
]]
function playdate.update() end

--[[
	Suspends callbacks to playdate.update() for the specified number of milliseconds.

	https://sdk.play.date/inside-playdate/#f-wait
]]
---@param milliseconds integer
function playdate.wait(milliseconds) end

--[[
	Stops per-frame callbacks to playdate.update(). Useful in conjunction with playdate.display.flush() if your program only does things in response to button presses.

	https://sdk.play.date/inside-playdate/#f-stop
]]
function playdate.stop() end

--[[
	Resumes per-frame callbacks to playdate.update().

	https://sdk.play.date/inside-playdate/#f-start
]]
function playdate.start() end

--#endregion

--#region Game Lifecycle

--[[
	Called when the player chooses to exit the game via the System Menu or Menu button.

	https://sdk.play.date/inside-playdate/#c-gameWillTerminate
]]
function playdate.gameWillTerminate() end

--[[
	Called before the device goes to low-power sleep mode because of a low battery.

	https://sdk.play.date/inside-playdate/#c-deviceWillSleep
]]
function playdate.deviceWillSleep() end

--[[
	If your game is running on the Playdate when the device is locked, this function will be called. Implementing this function allows your game to take special action when the Playdate is locked, e.g., saving state.

	https://sdk.play.date/inside-playdate/#c-deviceWillLock
]]
function playdate.deviceWillLock() end

--[[
	If your game is running on the Playdate when the device is unlocked, this function will be called.

	https://sdk.play.date/inside-playdate/#c-deviceDidUnlock
]]
function playdate.deviceDidUnlock() end

--[[
	Called before the system pauses the game. (In the current version of Playdate OS, this only happens when the device’s Menu button is pushed.) Implementing these functions allows your game to take special action when it is paused, e.g., updating the menu image.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#c-gameWillPause
]]
function playdate.gameWillPause() end

--[[
	Called before the system resumes the game.

	https://sdk.play.date/inside-playdate/#c-gameWillResume
]]
function playdate.gameWillResume() end

--#endregion

--#region Interacting with the System Menu

---@class playdate.menu
playdate.menu = {}

---@class playdate.menu.item
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
---@param initialValue? boolean Whether the added item is checked or not initially.
---@param callback fun() Callback invoked when the menu item is selected.
---@return playdate.menu.item|nil menuItem, string|nil errorMessage
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
---@param initialValue? string Can optionally be set to any of the values in the options array.
---@param callback fun() Callback invoked when the menu item is selected.
---@return playdate.menu.item|nil menuItem, string|nil errorMessage
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

--#endregion

--#region Localization

---@alias PlaydateLanguage
---|`playdate.graphics.font.kLanguageEnglish`
---|`playdate.graphics.font.kLanguageJapanese`

--[[
	Returns the current language of the system, which will be one of the constants playdate.graphics.font.kLanguageEnglish or playdate.graphics.font.kLanguageJapanese.

	https://sdk.play.date/inside-playdate/#f-getSystemLanguage
]]
---@return PlaydateLanguage
function playdate.getSystemLanguage() end

--#endregion

--#region Accessibliity

--[[
	Returns true if the user has checked the "Reduce Flashing" option in Playdate Settings; false otherwise. Games should read this value and, if true, avoid visuals that could be problematic for people with sensitivities to flashing lights or patterns.

	https://sdk.play.date/inside-playdate/#f-playdate.getReduceFlashing
]]
---@return boolean
function playdate.getReduceFlashing() end

--[[
	Returns true if the user has checked the "Upside Down" option in Playdate Settings; false otherwise. (Upside Down mode can be convenient for players wanting to hold Playdate upside-down so they can use their left hand to operate the crank.)

	Typically your game doesn’t need to anything in regards to this setting. But it is available in case your game wants to take some special actions, display special instructions, etc.

	https://sdk.play.date/inside-playdate/#f-playdate.getFlipped
]]
---@return boolean
function playdate.getFlipped() end

--#endregion

--#region Accelerometer

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

--#endregion

--#region Buttons

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

--#endregion

--#region Crank

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

--#endregion

--#region Input Handlers

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

--#endregion

--#region Device Auto Lock

--[[
	True disables the 60-second auto-lock feature. False re-enables it and resets the timer back to 60 seconds.

	https://sdk.play.date/inside-playdate/#f-playdate.setAutoLockDisabled
]]
---@param disable boolean
function playdate.setAUtoLockDisabled(disable) end

--#endregion

--#region Date & Time

--[[
	Returns the number of milliseconds the game has been active since launched.

	https://sdk.play.date/inside-playdate/#f-getCurrentTimeMilliseconds
]]
---@return integer
function playdate.getCurrentTimeMilliseconds() end

--[[
	Resets the high-resolution timer.

	https://sdk.play.date/inside-playdate/#f-resetElapsedTime
]]
function playdate.resetElapsedTime() end

--[[
	Returns the number of seconds since playdate.resetElapsedTime() was called. The value is a floating-point number with microsecond accuracy.

	https://sdk.play.date/inside-playdate/#f-getElapsedTime
]]
---@return number
function playdate.getElapsedTime() end

--[[
	Returns the number of seconds and milliseconds elapsed since midnight (hour 0), January 1 2000 UTC, as a list: (seconds, milliseconds). This function is suitable for seeding the random number generator.

	https://sdk.play.date/inside-playdate/#f-getSecondsSinceEpoch
]]
---@return integer
function playdate.getSecondsSinceEpoch() end

---@alias DateTime { year: integer, month: integer, day: integer, weekday: number, hour: number, minute: number, second: number, millisecond: number }

--[[
	Returns a table with values for the local time, accessible via the following keys:

	- year: 4-digit year (until 10,000 AD)
	- month: month of the year, where 1 is January and 12 is December
	- day: day of the month, 1 - 31
	- weekday: day of the week, where 1 is Monday and 7 is Sunday
	- hour: 0 - 23
	- minute: 0 - 59
	- second: 0 - 59 (or 60 on a leap second)
	- millisecond: 0 - 999

	https://sdk.play.date/inside-playdate/#f-getTime
]]
---@return DateTime
function playdate.getTime() end

--[[
	Returns a table in the same format as playdate.getTime(), but in GMT rather than local time.

	https://sdk.play.date/inside-playdate/#f-getGMTTime
]]
---@see playdate.getTime
---@return DateTime
function playdate.getGMTTime() end

--[[
	Returns the number of seconds and milliseconds between midnight (hour 0), January 1 2000 UTC and time, specified in local time, as a list: (seconds, milliseconds).
]]
---@see playdate.getTime
---@param time DateTime should be a table of the same format as the one returned by playdate.getTime().
---@return integer seconds, integer milliseconds
function playdate.epochFromTime(time) end

--[[
	Returns the number of seconds and milliseconds between midnight (hour 0), January 1 2000 UTC and time, specified in GMT time, as a list: (seconds, milliseconds).
]]
---@see playdate.getTime
---@param time DateTime should be a table of the same format as the one returned by playdate.getTime().
---@return integer seconds, integer milliseconds
function playdate.epochFromGMTTime(time) end

--[[
	Converts the epoch to a local date and time table, in the same format as the table returned by playdate.getTime().

	https://sdk.play.date/inside-playdate/#f-secondsSinceEpochToTime
]]
---@see playdate.getTime
---@param second integer
---@param milliseconds integer
---@return DateTime
function playdate.timeFromEpoch(second, milliseconds) end

--[[
	Converts the epoch to a GMT date and time table, in the same format as the table returned by playdate.getTime().

	https://sdk.play.date/inside-playdate/#f-secondsSinceEpochToGMTTime
]]
---@see playdate.getTime
---@param second integer
---@param milliseconds integer
---@return DateTime
function playdate.GMTTimeFromEpoch(second, milliseconds) end

--#endregion

--#region Debugging

--NOTE: print() is deliberately excluded even though it is noted in API doc as it is a standard Lua function.

--[[
	Text output from printTable() will be displayed in the simulator’s console, in black if generated by a game running in the simulator or in blue if it’s coming from a plugged-in Playdate device. Printed text is also copied to stdout, which is helpful if you run the simulator from the command line.

	https://sdk.play.date/inside-playdate/#f-printTable
]]
---@param table table
function printTable(table) end

--[[
	If the simulator is launched from the command line, any extra arguments passed there are available in the playdate.argv array.

	https://sdk.play.date/inside-playdate/#v-argv
]]
---@type string[]
playdate.argv = {}

--[[
	https://sdk.play.date/inside-playdate/#f-setNewlinePrinted
]]
---@param flag? boolean Whether or not the print() function adds a newline to the end of the printed text. Default is true.
function playdate.setNewlinePrinted(flag) end

--[[
	Calculates the current frames per second and draws that value at x, y.

	https://sdk.play.date/inside-playdate/#f-drawFPS
]]
---@param x integer
---@param y integer
function playdate.drawFPS(x, y) end

--[[
	Returns a single-line stack trace as a string. For example:

	main.lua:10 foo() < main.lua:18 (from C)

	Use print(where()) to see this trace written to the console.
]]
---@return string
function where() end

--#endregion

--#region Profiling

--[[
	Suspect some code is running hot? Wrap it in an anonymous function and pass it to sample() like so:

	sample("name of this sample", function()
		-- nested for loops, lots of table creation, member access...
	end)

	By moving around where you start and end the anonymous function in your code, you can get a better idea of where the problem lies.

	Multiple code paths can be sampled at once by using different names for each sample.

	https://sdk.play.date/inside-playdate/#lua-sample
]]
---@param name string
---@param func fun()
function sample(name, func) end

--[[
	Returns a table containing percentages for each system task, such as:

	{ "kernel"=0.23, "game"=0.62, "audio"=0.15 }

	https://sdk.play.date/inside-playdate/#f-playdate.getStats
]]
---@return { [string]: number }
function playdate.getStats() end

--[[
	Sets the length of time for each sample frame of runtime stats. Set seconds to zero to disable stats collection.

	https://sdk.play.date/inside-playdate/#f-playdate.setStatsInterval
]]
---@param seconds integer
function playdate.setStatsInterval(seconds) end

--#endregion

--#region Display

--[[
	Sets the nominal refresh rate in frames per second. The default is 30 fps, which is a recommended figure that balances animation smoothness with performance and power considerations. Maximum is 50 fps.

	If rate is 0, playdate.update() is called as soon as a frame buffer is available. Since the display refreshes line-by-line, and unchanged lines aren’t sent to the display, the update cycle will be faster than 30 times a second but at an indeterminate rate. playdate.getCurrentTimeMilliseconds() should then be used as a steady time base.

	Equivalent to `playdate->display->setRefreshRate()` in the C API.

	https://sdk.play.date/inside-playdate/#f-display.setRefreshRate
]]
---@param rate integer
function playdate.display.setRefreshRate(rate) end

--[[
	Gets the nominal refresh rate in frames per second.

	https://sdk.play.date/inside-playdate/#f-display.getRefreshRate
]]
---@return integer
function playdate.display.getRefreshRate() end

--[[
	Sends the contents of the frame buffer to the display immediately. Useful if you have called playdate.stop() to disable update callbacks in, say, the case where your app updates the display only in reaction to button presses.

	https://sdk.play.date/inside-playdate/#f-display.flush
]]
function playdate.display.flush() end

--[[
	Returns the height the Playdate display, taking the current display scale into account; e.g., if the scale is 2, the values returned will be based off of a 200 x 120-pixel screen rather than the native 400 x 240. (See playdate.display.setScale().)

	Equivalent to `playdate->display->getHeight()` in the C API.

	https://sdk.play.date/inside-playdate/#f-display.getHeight
]]
---@return integer
function playdate.display.getHeight() end

--[[
	Returns the width the Playdate display, taking the current display scale into account; e.g., if the scale is 2, the values returned will be based off of a 200 x 120-pixel screen rather than the native 400 x 240. (See playdate.display.setScale().)

	Equivalent to `playdate->display->getWidth()` in the C API.

	https://sdk.play.date/inside-playdate/#f-display.getWidth
]]
---@return integer
function playdate.display.getWidth() end

--[[
	Returns the values (width, height) describing the Playdate display size. Takes the current display scale into account; e.g., if the scale is 2, the values returned will be based off of a 200 x 120-pixel screen rather than the native 400 x 240. (See playdate.display.setScale().)

	https://sdk.play.date/inside-playdate/#f-display.getSize
]]
---@return integer width, integer height
function playdate.display.getSize() end

--[[
	Returns the values (x, y, width, height) describing the Playdate display size. Takes the current display scale into account; e.g., if the scale is 2, the values returned will be based off of a 200 x 120-pixel screen rather than the native 400 x 240. (See playdate.display.setScale().)

	https://sdk.play.date/inside-playdate/#f-display.getRect
]]
---@return integer x, integer y, integer width, integer height
function playdate.display.getRect() end

---@alias DisplayScale 1|2|4|8

--[[
	Sets the display scale factor. Valid values for scale are 1, 2, 4, and 8.

	The top-left corner of the frame buffer is scaled up to fill the display; e.g., if the scale is set to 4, the pixels in rectangle [0,100] x [0,60] are drawn on the screen as 4 x 4 squares.

	Equivalent to `playdate->display->setScale()` in the C API.
]]
---@param scale DisplayScale
function playdate.display.setScale(scale) end

--[[
	Gets the display scale factor. Valid values for scale are 1, 2, 4, and 8.

	https://sdk.play.date/inside-playdate/#f-display.getScale
]]
---@return DisplayScale
function playdate.display.getScale() end

--[[
	If the argument passed to setInverted() is true, the frame buffer will be drawn inverted (everything onscreen that was black will now be white, etc.)

	Equivalent to `playdate->display->setInverted()` in the C API.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#f-display.setInverted
]]
---@param flag boolean
function playdate.display.setInverted(flag) end

--[[
	If getInverted() returns true, the frame buffer will be drawn inverted (everything onscreen that was black will now be white, etc.)

	https://sdk.play.date/inside-playdate/#f-display.getInverted
]]
---@return boolean
function playdate.display.getInverted() end

--[[
	Adds a mosaic effect to the display. Valid x and y values are between 0 and 3, inclusive.

	Equivalent to `playdate->display->setMosaic()` in the C API.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#f-display.setMosaic
]]
---@param x integer
---@param y integer
function playdate.display.setMosaic(x, y) end

--[[
	Returns the current mosaic effect settings as multiple values (x, y).

	https://sdk.play.date/inside-playdate/#f-display.getMosaic
]]
---@return integer x, integer y
function playdate.display.getMosaic() end

--[[
	Offsets the entire display by x, y. Offset values can be negative. The "exposed" part of the display is black or white, according to the value set in playdate.graphics.setBackgroundColor(). This is an efficient way to make a "shake" effect without redrawing anything.
	
	This function is different from playdate.graphics.setDrawOffset().

	Equivalent to `playdate->display->setOffset()` in the C API.

	https://sdk.play.date/inside-playdate/#f-display.setOffset
]]
---@param x integer
---@param y integer
function playdate.display.setOffset(x, y) end

--[[
	Returns the current display offset as multiple values (x, y).

	https://sdk.play.date/inside-playdate/#f-display.getOffset
]]
---@return integer x, integer y
function playdate.display.getOffset() end

--[[
	Flips the display on the x or y axis, or both.

	Equivalent to `playdate->display->setFlipped()` in the C API.

	https://sdk.play.date/inside-playdate/#f-display.setFlipped
]]
---@param x boolean
---@param y boolean
function playdate.display.setFlipped(x, y) end

--[[
	The simplest method for putting an image on the display. Copies the contents of the image at path directly to the frame buffer. The image must be 400x240 pixels with no transparency.

	https://sdk.play.date/inside-playdate/#f-display.loadImage
]]
---@param path string
function playdate.display.loadImage(path) end

--#endregion

--#region Easing Functions

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

--#endregion

--#region Files

--#region Datastore

--[[
	Encodes the given table into the named file. (The .json extension should be omitted from the file name.) The default file name is "data". If pretty-print is true, the JSON will be nicely formatted.

	https://sdk.play.date/inside-playdate/#f-datastore.write
]]
---@param table table
---@param filename? string
---@param prettyPrint? boolean
function playdate.datastore.write(table, filename, prettyPrint) end

--[[
	Returns a table instantiated with the data in the JSON-encoded file you specify. (The .json extension should be omitted.) The default file name is "data". If no file is found, this function returns nil.

	https://sdk.play.date/inside-playdate/#f-datastore.read
]]
---@param filename? string
---@return { [string]: any }
function playdate.datastore.read(filename) end

--[[
	Deletes the specified datastore file. The default file name is "data". Returns false if the datastore file could not be deleted.

	https://sdk.play.date/inside-playdate/#f-datastore.delete
]]
---@param filename? string
---@return boolean
function playdate.datastore.delete(filename) end

--[[
	Saves a playdate.graphics.image to a file. If path doesn’t contain a folder name, the image is stored in a folder named "images".

	By default, this method writes out a PDI file, a custom image format used by Playdate that can be read back in using readImage(). If you want to write out a GIF file, append a .gif extension to your path.
	Because writeImage() doesn’t currently support GIF transparency, if you attempt to write a GIF from an image buffer you instantiated, you must call playdate.graphics.image.new( width, height, bgcolor ) with bgcolor set to playdate.graphics.kColorWhite or playdate.graphics.kColorBlack, otherwise your image will render improperly to the file.

	https://sdk.play.date/inside-playdate/#f-datastore.writeImage
]]
---@param image playdate.graphics.image
---@param path string
function playdate.datastore.writeImage(image, path) end

--[[
	Reads a playdate.graphics.image from a file in the data folder. If path doesn’t contain a folder name, the image is searched for in a folder named "images".

	https://sdk.play.date/inside-playdate/#f-datastore.readImage
]]
---@return playdate.graphics.image|nil
function playdate.datastore.readImage() end

--#endregion

--#region playdate.file.file

---@class playdate.file.file
playdate.file.file = {}

---@alias FileMode
---|`playdate.file.kFileRead`
---|`playdate.file.kFileWrite`
---|`playdate.file.kFileAppend`

--[[
	Returns a playdate.file.file corresponding to the opened file. mode should be one of the following:

	- playdate.file.kFileRead: the file is opened for reading; the system first looks in the /Data/<bundleid> folder for the given file, then in the game’s pdx folder if it isn’t found
	- playdate.file.kFileWrite: the file is created if it doesn’t exist, truncated to zero length if it does, then opened for writing
	- playdate.file.kFileAppend: the file is created if it doesn’t exist, opened for writing, with new data written to the end of the file

	If mode is not specified, the default is playdate.file.kFileRead.

	If the file couldn’t be opened, a second return value indicates the error. The filesystem has a limit of 64 simultaneous open files.

	Equivalent to `playdate->file->open()` in the C API.

	https://sdk.play.date/inside-playdate/#f-file.open
]]
---@param path string
---@param mode? FileMode
---@return playdate.file.file|nil file, string errorMessage
function playdate.file.open(path, mode) end

--[[
	Closes the file.

	Equivalent to `playdate->file->close()` in the C API.

	https://sdk.play.date/inside-playdate/#m-file.close
]]
function playdate.file.file:close() end

--[[
	Writes the given string to the file and returns the number of bytes written if successful, or 0 and a second return value describing the error. If you wish to include line termination characters (`\n`, `\r`), please include them in the string.

	https://sdk.play.date/inside-playdate/#m-file.write
]]
---@param string string
---@return integer, string|nil errorMessage
function playdate.file.file:write(string) end

--[[
	Flushes any buffered data written to the file to the disk.
	
	Equivalent to `playdate->file->flush()` in the C API.

	https://sdk.play.date/inside-playdate/#m-file.flush
]]
function playdate.file.file:flush() end

--[[
	Returns the next line of the file, delimited by either \n or \r\n. The returned string does not include newline characters.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#m-file.readLine
]]
---@return string
function playdate.file.file:readline() end

-- TODO: Verify the actual return type from file:read()
--[[
	Returns a buffer containing up to numberOfBytes bytes from the file, and the number of bytes read. If the read failed, the function returns nil and a second value describing the error.

	Equivalent to `playdate->file->read()` in the C API.

	https://sdk.play.date/inside-playdate/#m-file.read
]]
---@param numberOfBytes integer
---@return any|nil dataBuffer, string|nil errorMesasge
function playdate.file.file:read(numberOfBytes) end

--[[
	Sets the file read/write position to the given byte offset.

	Equivalent to `playdate->file->seek()` in the C API.

	https://sdk.play.date/inside-playdate/#m-file.seek
]]
---@param offset integer
function playdate.file.file:seek(offset) end

--[[
	Returns the current byte offset of the read/write position in the file.

	Equivalent to `playdate->file->tell()` in the C API.

	https://sdk.play.date/inside-playdate/#m-file.tell
]]
---@return integer
function playdate.file.file:tell() end

--#endregion

--#region Filesystem operations

--[[
	Returns an array containing the file names in the given directory path as strings. Folders are indicated by a slash / at the end of the filename. If showhidden is set, files beginning with a period will be included; otherwise, they are skipped.

	Call with no argument to get a list of all files and folders your game has access to. (For a game with default access permissions, listFiles(), listFiles("/"), and listFiles(".") should all return the same result.)

	Equivalent to `playdate->file->listfiles()` in the C API.

	https://sdk.play.date/inside-playdate/#f-file.listFiles
]]
---@param path string
---@param showHidden? boolean
function playdate.file.listFiles(path, showHidden) end

--[[
	Returns true if a file exists at the given path.
]]
---@param path string
function playdate.file.exists(path) end

--[[
	Returns true if a directory exists at the given path.
]]
---@param path string
function playdate.file.isdir(path) end

--[[
	Creates a directory at the given path, under the /Data/<bundleid> folder. See About the Playdate Filesystem for details.

	playdate.file.mkdir() will create all intermediate directories, if a succession of directories ("testdir/testdir/testdir/") is specified in path.

	Equivalent to `playdate->file->mkdir()` in the C API.

	https://sdk.play.date/inside-playdate/#f-file.mkdir
]]
---@param path string
function playdate.file.mkdir(path) end

--[[
	Deletes the file at the given path. Returns true if successful, else false.

	If recursive is true, this function will delete the directory at path and its contents, otherwise the directory must be empty to be deleted.

	https://sdk.play.date/inside-playdate/#f-file.delete
]]
---@param path string
---@param recursive? boolean
function playdate.file.delete(path, recursive) end

--[[
	Returns the size of the file at the given path.

	https://sdk.play.date/inside-playdate/#f-file.getSize
]]
---@param path string
---@return integer
function playdate.file.getSize(path) end

--TODO: Verify the return type for playdate.file.getType()
--[[
	Returns the type of the file at the given path.

	https://sdk.play.date/inside-playdate/#f-file.getType
]]
---@param path string
---@return any
function playdate.file.getType(path) end

--[[
	Returns the modification date/time of the file at the given path, as a table with keys:

    - year: 4-digit year (until 10,000 AD)
    - month: month of the year, where 1 is January and 12 is December
    - day: day of the month, 1 - 31
    - hour: 0 - 23
    - minute: 0 - 59
    - second: 0 - 59 (or 60 on a leap second)

	https://sdk.play.date/inside-playdate/#f-file.modtime
]]
---@param path string
---@return { year: integer, month: integer, day: integer, hour: integer, minute: integer, second: integer }
function playdate.file.modtime(path) end

--[[
	Renames the file at path, if it exists, to the value of newPath. This can result in the file being moved to a new directory, but directories will not be created. Returns true if the operation was successful.

	Equivalent to `playdate->file->rename()` in the C API.

	https://sdk.play.date/inside-playdate/#f-file.rename
]]
---@param path string
---@param newPath string
---@return boolean
function playdate.file.rename(path, newPath) end

--#endregion

--#region .pdz files

--[[
	Loads the compiled .pdz file at the given location and returns the contents as a function. The .pdz extension on path is optional.

	https://sdk.play.date/inside-playdate/#f-file.load
]]
---@param path string
---@param env? table If specified, is a table to use as the function’s global namespace instead of _G.
function playdate.file.load(path, env) end

--[[
	Runs the pdz file at the given location. Equivalent to playdate.file.load(path, env)().

	The .pdz extension on path is optional. Values returned from the pdz file are left on the stack.

	https://sdk.play.date/inside-playdate/#f-file.run
]]
---@param path string
---@param env? table If specified, is a table to use as the function’s global namespace instead of _G.
function playdate.file.run(path, env) end

--#endregion

--#endregion

--#region Geometry

--#region Affine transform

--[[
	Affine transforms can be used to modify the coordinates of points, rects (as axis aligned bounding boxes (AABBs)), line segments, and polygons. The underlying matrix is of the form:
	The matrix of an affine transform

	[m11 m12 tx]
	[m21 m22 ty]
	[ 0   0  1 ]
]]
---@class playdate.geometry.affineTransform
---@operator mul(playdate.geometry.affineTransform): playdate.geometry.affineTransform
---@operator mul(playdate.geometry.vector2D): playdate.geometry.vector2D
---@operator mul(playdate.geometry.point): playdate.geometry.point
playdate.geometry.affineTransform = {}

--[[
	Returns a new playdate.geometry.affineTransform. Call without arguments to get a new copy of the identity transform.

	https://sdk.play.date/inside-playdate/#f-geometry.affineTransform.new
	https://sdk.play.date/inside-playdate/#f-geometry.affineTransform.new-1
]]
---@param m11? number
---@param m12? number
---@param m21? number
---@param m22? number
---@param tx? number
---@param ty? number
---@return playdate.geometry.affineTransform()
function playdate.geometry.affineTransform.new(m11, m12, m21, m22, tx, ty) end

--[[
	Returns a new copy of the affine transform.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.copy
]]
---@return playdate.geometry.affineTransform
function playdate.geometry.affineTransform:copy() end

--[[
	Mutates the caller so that it is an affine transformation matrix constructed by inverting itself.

	Inversion is generally used to provide reverse transformation of points within transformed objects. Given the coordinates (x, y), which have been transformed by a given matrix to new coordinates (x’, y’), transforming the coordinates (x’, y’) by the inverse matrix produces the original coordinates (x, y).

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.invert
]]
function playdate.geometry.affineTransform:invert() end

--[[
	Mutates the the caller, changing it to an identity transform matrix.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.reset
]]
function playdate.geometry.affineTransform:reset() end

--[[
	Mutates the the caller. The affine transform af is concatenated to the caller.

	Concatenation combines two affine transformation matrices by multiplying them together. You might perform several concatenations in order to create a single affine transform that contains the cumulative effects of several transformations.

	Note that matrix operations are not commutative — the order in which you concatenate matrices is important. That is, the result of multiplying matrix t1 by matrix t2 does not necessarily equal the result of multiplying matrix t2 by matrix t1.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.concat
]]
---@param af playdate.geometry.affineTransform
function playdate.geometry.affineTransform:concat(af) end

--[[
	Mutates the caller by applying a translate transformation. x values are moved by dx, y values by dy.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.translate
]]
---@param dx number
---@param dy number
function playdate.geometry.affineTransform:translate(dx, dy) end

--[[
	Returns a copy of the calling affine transform with a translate transformation appended.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#m-geometry.affineTransform.translatedBy
]]
---@param dx number
---@param dy number
---@return playdate.geometry.affineTransform
function playdate.geometry.affineTransform:translatedBy(dx, dy) end

--[[
	Mutates the caller by applying a scaling transformation.

	If both parameters are passed, sx is used to scale the x values of the transform, sy is used to scale the y values.

	If only one parameter is passed, it is used to scale both x and y values.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.scale
]]
---@param sx number
---@param sy? number
function playdate.geometry.affineTransform:scale(sx, sy) end

--[[
	Returns a copy of the calling affine transform with a scaling transformation appended.

	If both parameters are passed, sx is used to scale the x values of the transform, sy is used to scale the y values.

	If only one parameter is passed, it is used to scale both x and y values.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.scaledBy
]]
---@param sx number
---@param sy? number
---@return playdate.geometry.affineTransform
function playdate.geometry.affineTransform:scaledBy(sx, sy) end

--[[
	Mutates the caller by applying a rotation transformation.

	angle is the value, in degrees, by which to rotate the affine transform. A positive value specifies clockwise rotation and a negative value specifies counterclockwise rotation. If the optional x and y arguments or point point are given, the transform rotates around (x,y) or point instead of (0,0).

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.rotate
]]
---@param angle any
---@param x? number|playdate.geometry.point
---@param y? number
function playdate.geometry.affineTransform:rotate(angle, x, y) end

--[[
	Returns a copy of the calling affine transform with a rotate transformation appended.

	angle is the value, in degrees, by which to rotate the affine transform. A positive value specifies clockwise rotation and a negative value specifies counterclockwise rotation. If the optional x and y arguments or point point are given, the transform rotates around (x,y) or point instead of (0,0).

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.rotatedBy
]]
---@param angle number
---@param x? number|playdate.geometry.point
---@param y? number
---@return playdate.geometry.affineTransform
function playdate.geometry.affineTransform:rotatedBy(angle, x, y) end

--[[
	Mutates the caller, appending a skew transformation. sx is the value by which to skew the x axis, and sy the value for the y axis. Values are in degrees.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.skew
]]
---@param sx number
---@param sy number
function playdate.geometry.affineTransform:skew(sx, sy) end

--[[
	Returns the given transform with a skew transformation appended. sx is the value by which to skew the x axis, and sy the value for the y axis. Values are in degrees.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.skewedBy
]]
---@param sx number
---@param sy number
---@return playdate.geometry.affineTransform
function playdate.geometry.affineTransform:skewedBy(sx, sy) end

--[[
	Modifies the point p by applying the affine transform.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.transformPoint
]]
---@param p playdate.geometry.point
function playdate.geometry.affineTransform:transformPoint(p) end

--[[
	As transformPoint, but returns a new point rather than modifying p.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.transformedPoint
]]
---@see playdate.geometry.affineTransform:transformPoint
---@param p playdate.geometry.point
---@return playdate.geometry.point
function playdate.geometry.affineTransform:transformedPoint(p) end

--[[
	Returns two values calculated by applying the affine transform to the point (x, y)

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.transformXY
]]
---@param x number
---@param y number
---@return number x, number y
function playdate.geometry.affineTransform:transformXY(x, y) end

--[[
	Modifies the line segment ls by applying the affine transform.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#m-geometry.affineTransform.transformLineSegment
]]
---@param ls playdate.geometry.lineSegment
function playdate.geometry.affineTransform:transformLineSegment(ls) end

--[[
	As above, but returns a new line segment rather than modifying ls.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.transformedLineSegment
]]
---@param ls playdate.geometry.lineSegment
---@return playdate.geometry.lineSegment
function playdate.geometry.affineTransform:transformedLineSegment(ls) end

--[[
	Modifies the axis aligned bounding box r (a rect) by applying the affine transform.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.transformAABB
]]
---@param r playdate.geometry.rect
function playdate.geometry.affineTransform:transformAABB(r) end

--[[
	As above, but returns a new rect rather than modifying r.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.transformedAABB
]]
---@param r playdate.geometry.rect
---@return playdate.geometry.rect
function playdate.geometry.affineTransform:transformedAABB(r) end

--[[
	Modifies the polygon p by applying the affine transform.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.transformPolygon
]]
---@param p playdate.geometry.polygon
function playdate.geometry.affineTransform:transformPolygon(p) end

--[[
	As above, but returns a new polygon rather than modifying p.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.transformedPolygon
]]
---@param p playdate.geometry.polygon
---@return playdate.geometry.polygon
function playdate.geometry.affineTransform:transformedPolygon(p) end

--#endregion

--#region Arc

--[[
	Implements an arc.

	You can directly read or write the x, y, radius, startAngle, endAngle and clockwise values of an arc.

	https://sdk.play.date/inside-playdate/#C-geometry.arc
]]
---@class playdate.geometry.arc
---@field x number
---@field y number
---@field radius number
---@field startAngle number
---@field endAngle number
---@field clockwise boolean
playdate.geometry.arc = {}

--[[
	Returns a new playdate.geometry.arc. Angles should be specified in degrees. Zero degrees represents the top of the circle.

	https://sdk.play.date/inside-playdate/#m-geometry.arc.new
]]
---@param x number
---@param y number
---@param radius number
---@param startAngle number
---@param endAngle number
---@param direction boolean Should be true for clockwise, false for counterclockwise. If not specified, the direction is inferred from the start and end angles.
function playdate.geometry.arc.new(x, y, radius, startAngle, endAngle, direction) end

--[[
	Returns a new copy of the arc.

	https://sdk.play.date/inside-playdate/#m-geometry.arc.copy
]]
---@return playdate.geometry.arc
function playdate.geometry.arc:copy() end

--[[
	Returns the length of the arc.

	https://sdk.play.date/inside-playdate/#m-geometry.arc.length
]]
---@return number
function playdate.geometry.arc:length() end

--[[
	Returns true if the direction of the arc is clockwise.

	https://sdk.play.date/inside-playdate/#m-geometry.arc.isClockwise
]]
---@return boolean
function playdate.geometry.arc:isClockwise() end

--[[
	Sets the direction of the arc.

	https://sdk.play.date/inside-playdate/#m-geometry.arc.setIsClockwise
]]
---@param flag boolean
function playdate.geometry.arc:setIsClockwise(flag) end

--[[
	Returns a new point on the arc, distance pixels from the arc’s start angle.

	https://sdk.play.date/inside-playdate/#m-geometry.arc.pointOnArc
]]
---@param distance number
---@return playdate.geometry.point
function playdate.geometry.arc:pointOnArc(distance) end

--#endregion

--#region lineSegment

--[[
	Implements a line segment between two points in two-dimensional space.

	You can directly read or write x1, y1, x2, or y2 values to a lineSegment.
]]
---@class playdate.geometry.lineSegment
---@field x1 number
---@field y1 number
---@field x2 number
---@field y2 number
playdate.geometry.lineSegment = {}

--[[
	Returns a new playdate.geometry.lineSegment.

	https://sdk.play.date/inside-playdate/#f-geometry.lineSegment.new
]]
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return playdate.geometry.lineSegment
function playdate.geometry.lineSegment.new(x1, y1, x2, y2) end

--[[
	Returns a new copy of the line segment.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.copy
]]
---@return playdate.geometry.lineSegment
function playdate.geometry.lineSegment:copy() end

--[[
	Returns the values x1, y1, x2, y2.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.unpack
]]
---@return number x1, number y1, number x2, number y2
function playdate.geometry.lineSegment:unpack() end

--[[
	Returns the length of the line segment.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.length
]]
---@return number
function playdate.geometry.lineSegment:length() end

--[[
	Modifies the line segment, offsetting its values by dx, dy.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.offset
]]
---@param dx number
---@param dy number
function playdate.geometry.lineSegment:offset(dx, dy) end

--[[
	Returns a new line segment, the given segment offset by dx, dy.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.offsetBy
]]
---@param dx number
---@param dy number
---@return playdate.geometry.lineSegment
function playdate.geometry.lineSegment:offsetBy(dx, dy) end

--[[
	Returns a playdate.geometry.point representing the mid point of the line segment.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.midPoint
]]
---@return playdate.geometry.point
function playdate.geometry.lineSegment:midPoint() end

--[[
	Returns a playdate.geometry.point on the line segment, distance pixels from the start of the line.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.pointOnLine
]]
---@param distance number
---@return playdate.geometry.point
function playdate.geometry.lineSegment:pointOnLine(distance) end

--[[
	Returns a playdate.geometry.vector2D representation of the line segment.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.segmentVector
]]
---@return playdate.geometry.vector2D
function playdate.geometry.lineSegment:segmentVector() end

--[[
	Returns a playdate.geometry.point that is the closest point to point p that is on the line segment.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.closestPointOnLineToPoint
]]
---@param p playdate.geometry.point
function playdate.geometry.lineSegment:closestPointOnLineToPoint(p) end

--[[
	Returns true if there is an intersection between the caller and the line segment ls.

	If there is an intersection, a playdate.geometry.point representing that point is also returned.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#m-geometry.lineSegment.intersectsLineSegment
]]
---@param ls playdate.geometry.lineSegment
---@return boolean intersects, playdate.geometry.point|nil pointOfIntersection
function playdate.geometry.lineSegment:intersectsLineSegment(ls) end

--[[
	For use in inner loops where speed is the priority.

	Returns true if there is an intersection between the line segments defined by (x1, y1), (x2, y2) and (x3, y3), (x4, y4). If there is an intersection, x, y values representing the intersection point are also returned.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.fast.intersection
]]
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param x3 number
---@param y3 number
---@param x4 number
---@param y4 number
---@return boolean intersects, number intersectionX, number intersectionY
function playdate.geometry.lineSegment.fast_intersection(x1, y1, x2, y2, x3, y3, x4, y4) end

--[[
	Returns the values (intersects, intersectionPoints).

	intersects is true if there is at least one intersection between the caller and poly.

	intersectionPoints is an array of playdate.geometry.points containing all intersection points between the caller and poly.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.intersectsPolygon
]]
---@param poly playdate.geometry.polygon
---@return boolean intersects, playdate.geometry.point[] intersectionPoints
function playdate.geometry.lineSegment:intersectsPolygon(poly) end

--[[
	Returns the values (intersects, intersectionPoints).

	intersects is true if there is at least one intersection between the caller and rect.

	intersectionPoints is an array of playdate.geometry.points containing all intersection points between the caller and rect.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.intersectsRect
]]
---@param rect playdate.geometry.rect
---@return boolean intersects, playdate.geometry.point[] intersectionPoints
function playdate.geometry.lineSegment:intersectsRect(rect) end

--#endregion

--#region point

--[[
	Implements a two-dimensional point. You can directly read or write the x and y values of a point.

	https://sdk.play.date/inside-playdate/#C-geometry.point
]]
---@class playdate.geometry.point
---@field x number
---@field y number
---@operator add(playdate.geometry.vector2D): playdate.geometry.point
---@operator sub(playdate.geometry.point): playdate.geometry.vector2D
---@operator mul(playdate.geometry.affineTransform): playdate.geometry.point
---@operator concat(playdate.geometry.point): playdate.geometry.lineSegment
playdate.geometry.point = {}

--[[
	Returns a new playdate.geometry.point.

	https://sdk.play.date/inside-playdate/#f-geometry.point.new
]]
---@param x number
---@param y number
---@return playdate.geometry.point
function playdate.geometry.point.new(x, y) end

--[[
	Returns a new copy of the point.

	https://sdk.play.date/inside-playdate/#m-geometry.point.copy
]]
---@return playdate.geometry.point
function playdate.geometry.point:copy() end

--[[
	Returns the values x, y.

	https://sdk.play.date/inside-playdate/#m-geometry.point.unpack
]]
---@return number x, number y
function playdate.geometry.point:unpack() end

--[[
	Modifies the point, offsetting its values by dx, dy.

	https://sdk.play.date/inside-playdate/#m-geometry.point.offset
]]
---@param dx number
---@param dy number
function playdate.geometry.point:offset(dx, dy) end

--[[
	Returns a new point object, the given point offset by dx, dy.

	https://sdk.play.date/inside-playdate/#m-geometry.point.offsetBy
]]
---@param dx number
---@param dy number
---@return playdate.geometry.point
function playdate.geometry.point:offsetBy(dx, dy) end

--[[
	Returns the square of the distance to point p.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#m-geometry.point.squaredDistanceToPoint
]]
---@param p playdate.geometry.point
---@return number
function playdate.geometry.point:squaredDistanceToPoint(p) end

--[[
	Returns the distance to point p.

	https://sdk.play.date/inside-playdate/#m-geometry.point.distanceToPoint
]]
---@param p playdate.geometry.point
---@return number
function playdate.geometry.point:distanceToPoint(p) end

--#endregion

--#region polygon

--[[
	Implements two-dimensional open or closed polygons.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#C-geometry.polygon
]]
---@class playdate.geometry.polygon
---@operator mul(playdate.geometry.affineTransform): playdate.geometry.polygon
playdate.geometry.polygon = {}

---@alias PolygonFillRule
---|`playdate.graphics.kPolygonFillNonZero`
---|`playdate.graphics.kPolygonFillEvenOdd`

--[[
	new(x1, y1, x2, y2, ..., xn, yn) returns a new playdate.geometry.polygon with vertices (x1, y1) through (xn, yn). The Lua function table.unpack() can be used to turn an array into function arguments.

	new(p1, p2, ..., pn) does the same, except the points are expressed via point objects.

	new(numberOfVertices) returns a new playdate.geometry.polygon with space allocated for numberOfVertices vertices. All vertices are initially (0, 0). Vertex coordinates can be set with playdate.geometry.polygon:setPointAt().

	https://sdk.play.date/inside-playdate/#f-geometry.polygon.new
]]
---@param ... number|playdate.geometry.point
function playdate.geometry.polygon.new(...) end

--[[
	Returns a copy of a polygon.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.copy
]]
---@return playdate.geometry.polygon
function playdate.geometry.polygon:copy() end

--[[
	Closes a polygon. If the polygon’s first and last point aren’t coincident, a line segment will be generated to connect them.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.close
]]
function playdate.geometry.polygon:close() end

--[[
	Returns true if the polygon is closed, false if not.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.isClosed
]]
---@return boolean
function playdate.geometry.polygon:isClosed() end

--[[
	Returns a boolean value, true if the point p or the point at (x, y) is contained within the caller polygon.

	fillrule is an optional argument that can be one of the values defined in playdate.graphics.setPolygonFillRule. By default playdate.graphics.kPolygonFillEvenOdd is used.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.containsPoint
]]
---@param x number|playdate.geometry.point
---@param y? number|PolygonFillRule
---@param fillRule? PolygonFillRule
---@return boolean
function playdate.geometry.polygon:containsPoint(x, y, fillRule) end

--[[
	Returns multiple values (x, y, width, height) giving the axis-aligned bounding box for the polygon.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.getBounds
]]
---@return number x, number y, number width, number height
function playdate.geometry.polygon:getBounds() end

--[[
	Returns the axis-aligned bounding box for the given polygon as a playdate.geometry.rect object.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.getBoundsRect
]]
---@return playdate.geometry.rect
function playdate.geometry.polygon:getBoundsRect() end

--[[
	Returns the number of points in the polygon.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.count
]]
---@return integer
function playdate.geometry.polygon:count() end

--[[
	Returns the total length of all line segments in the polygon.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.length
]]
---@return number
function playdate.geometry.polygon:length() end

--[[
	Sets the polygon’s n-th point to (x, y).

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.setPointAt
]]
---@param n integer
---@param x number
---@param y number
function playdate.geometry.polygon:setPointAt(n, x, y) end

--[[
	Returns the polygon’s n-th point.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.getPointAt
]]
---@param n integer
---@return playdate.geometry.point
function playdate.geometry.polygon:getPointAt(n) end

--[[
	Returns true if the given polygon intersects the polygon p.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.intersects
]]
---@param p playdate.geometry.polygon
---@return boolean
function playdate.geometry.polygon:intersects(p) end

--[[
	Returns a playdate.geometry.point on one of the polygon’s line segments, distance pixels from the start of the polygon.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.pointOnPolygon
]]
---@param distance number
---@return playdate.geometry.point
function playdate.geometry.polygon:pointOnPolygon(distance) end

--[[
	Translates each point on the polygon by dx, dy pixels.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.translate
]]
---@param dx integer
---@param dy integer
function playdate.geometry.polygon:translate(dx, dy) end

--#endregion

--#region rect

-- TODO: Verify types of origin & size
--[[
	Implements a rectangle.

	You can directly read or write x, y, width, or height values to a rect.
	The values of top, bottom, right, left, origin, and size are read-only.

	https://sdk.play.date/inside-playdate/#C-geometry.rect
]]
---@class playdate.geometry.rect
---@field x number
---@field y number
---@field width number
---@field height number
---@field top number
---@field bottom number
---@field left number
---@field right number
---@field origin playdate.geometry.point
---@field size playdate.geometry.size
playdate.geometry.rect = {}

--[[
	Returns a new playdate.geometry.rect.

	https://sdk.play.date/inside-playdate/#f-geometry.rect.new
]]
---@param x number
---@param y number
---@param width number
---@param height number
---@return playdate.geometry.rect
function playdate.geometry.rect.new(x, y, width, height) end

--[[
	Returns a new copy of the rect.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.copy
]]
---@return playdate.geometry.rect
function playdate.geometry.rect:copy() end

--[[
	Returns a new playdate.geometry.polygon version of the rect.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.toPolygon
]]
---@return playdate.geometry.polygon
function playdate.geometry.rect:toPolygon() end

--[[
	Returns x, y, width and height as individual values.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.unpack
]]
---@return number x, number y, number width, number height
function playdate.geometry.rect:unpack() end

--[[
	Returns true if a rectangle has zero width or height.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.isEmpty
]]
---@return boolean
function playdate.geometry.rect:isEmpty() end

--[[
	Returns true if the x, y, width, and height values of the caller and r2 are all equal.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.isEqual
]]
---@param r2 playdate.geometry.rect
---@return boolean
function playdate.geometry.rect:isEqual(r2) end

--[[
	Returns true if r2 intersects the caller.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.intersects
]]
---@param r2 playdate.geometry.rect
function playdate.geometry.rect:intersects(r2) end

--[[
	Returns a rect representing the overlapping portion of the caller and r2.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.intersection
]]
---@param r2 playdate.geometry.rect
---@return playdate.geometry.rect
function playdate.geometry.rect:intersection(r2) end

--[[
	For use in inner loops where speed is the priority. About 3x faster than intersection.

	Returns multiple values (x, y, width, height) representing the overlapping portion of the two rects defined by x1, y1, w1, h1 and x2, y2, w2, h2. If there is no intersection, (0, 0, 0, 0) is returned.

	https://sdk.play.date/inside-playdate/#f-geometry.rect.fast_intersection
]]
---@param x1 number
---@param y1 number
---@param width1 number
---@param height1 number
---@param x2 number
---@param y2 number
---@param width2 number
---@param height2 number
---@return number x, number y, number width, number height
function playdate.geometry.rect.fast_intersection(x1, y1, width1, height1, x2, y2, width2, height2) end

--[[
	Returns the smallest possible rect that contains both the source rect and r2.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.union
]]
---@param r2 playdate.geometry.rect
---@return playdate.geometry.rect
function playdate.geometry.rect:union(r2) end

--[[
	For use in inner loops where speed is the priority. About 3x faster than union.

	Returns multiple values (x, y, width, height) representing the smallest possible rect that contains the two rects defined by x1, y1, w1, h1 and x2, y2, w2, h2.

	https://sdk.play.date/inside-playdate/#f-geometry.rect.fast_union
]]
---@param x1 number
---@param y1 number
---@param width1 number
---@param height1 number
---@param x2 number
---@param y2 number
---@param width2 number
---@param height2 number
---@return number x, number y, number width, number height
function playdate.geometry.rect.fast_union(x1, y1, width1, height1, x2, y2, width2, height2) end

--[[
	Insets the rect by the given dx and dy.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.inset
]]
---@param dx number
---@param dy number
function playdate.geometry.rect:inset(dx, dy) end

--[[
	Returns a rect that is inset by the given dx and dy, with the same center point.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.insetBy
]]
---@param dx number
---@param dy number
---@return playdate.geometry.rect
function playdate.geometry.rect:insetBy(dx, dy) end

--[[
	Offsets the rect by the given dx and dy.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.offset
]]
---@param dx number
---@param dy number
function playdate.geometry.rect:offset(dx, dy) end

--[[
	Returns a rect with its origin point offset by dx, dy.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.offsetBy
]]
---@param dx number
---@param dy number
---@return playdate.geometry.rect
function playdate.geometry.rect:offsetBy(dx, dy) end

--[[
	Returns true if the rect r2 is contained within the caller rect.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.containsRect-r2
]]
---@param r2 playdate.geometry.rect
---@return boolean
function playdate.geometry.rect:containsRect(r2) end

--[[
	Returns true if the point p is contained within the caller rect.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.containsPoint
]]
---@param pOrX number|playdate.geometry.point
---@param y? number
---@return boolean
function playdate.geometry.rect:containsPoint(pOrX, y) end

--[[
	Returns a point at the center of the caller.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.centerPoint
]]
---@return playdate.geometry.point
function playdate.geometry.rect:centerPoint() end

--[[
	Flips the caller about the center of rect r2.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.flipRelativeToRect
]]
---@param r2 playdate.geometry.rect
---@param flip `playdate.geometry.kUnflipped`
---|`playdate.geometry.kFlippedX`
---|`playdate.geometry.kFlippedY`
---|`playdate.geometry.kFlippedXY`
function playdate.geometry.rect.flipRelativeToRect(r2, flip) end

--#endregion

--#region size

--[[
	You can directly read or write the width and height values of a size.

	https://sdk.play.date/inside-playdate/#C-geometry.size
]]
---@class playdate.geometry.size
---@field width number
---@field height number
playdate.geometry.size = {}

--[[
	Returns a new playdate.geometry.size.

	https://sdk.play.date/inside-playdate/#f-geometry.size.new
]]
---@param width number
---@param height number
---@return playdate.geometry.size
function playdate.geometry.size.new(width, height) end

--[[
	Returns a new copy of the size.

	https://sdk.play.date/inside-playdate/#m-geometry.size.copy
]]
---@return playdate.geometry.size
function playdate.geometry.size:copy() end

--[[
	Returns the values width, height.

	https://sdk.play.date/inside-playdate/#m-geometry.size.unpack
]]
---@return number width, number height
function playdate.geometry.size:unpack() end

--#endregion

--#region Utility Functions

--[[
	Returns the square of the distance from point (x1, y1) to point (x2, y2).

	Compared to geometry.point:squaredDistanceToPoint(), this version will be slightly faster.

	https://sdk.play.date/inside-playdate/#f-geometry.squaredDistanceToPoint
]]
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number
function playdate.geometry.squaredDistanceToPoint(x1, y1, x2, y2) end

--[[
	Returns the the distance from point (x1, y1) to point (x2, y2).

	Compared to geometry.point:distanceToPoint(), this version will be slightly faster.

	https://sdk.play.date/inside-playdate/#f-geometry.distanceToPoint
]]
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number
function playdate.geometry.distanceToPoint(x1, y1, x2, y2) end

--#endregion

--#region vector2D

--[[
	Implements a two-dimensional vector.

	You can directly read or write dx, or dy values to a vector2D.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#C-geometry.vector2D
]]
---@class playdate.geometry.vector2D
---@field dx number
---@field dy number
---@operator unm(): playdate.geometry.vector2D
---@operator add(playdate.geometry.vector2D): playdate.geometry.vector2D
---@operator sub(playdate.geometry.vector2D): playdate.geometry.vector2D
---@operator mul(number): playdate.geometry.vector2D
---@operator mul(playdate.geometry.vector2D): number
---@operator mul(playdate.geometry.affineTransform): playdate.geometry.vector2D
---@operator div(number): playdate.geometry.vector2D
playdate.geometry.vector2D = {}

--[[
	Returns a new playdate.geometry.vector2D.

	https://sdk.play.date/inside-playdate/#f-geometry.vector2D.new
]]
---@param x number
---@param y number
---@return playdate.geometry.vector2D
function playdate.geometry.vector2D.new(x, y) end

--[[
	Returns a new copy of the vector2D.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.copy
]]
---@return playdate.geometry.vector2D
function playdate.geometry.vector2D:copy() end

--[[
	Returns the values dx, dy.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.unpack
]]
---@return number dx, number dy
function playdate.geometry.vector2D:unpack() end

--[[
	Modifies the caller by adding vector v.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#m-geometry.vector2D.addVector
]]
---@param v playdate.geometry.vector2D
function playdate.geometry.vector2D:addVector(v) end

--[[
	Modifies the caller, scaling it by amount s.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.scale
]]
---@param s number
function playdate.geometry.vector2D:scale(s) end

--[[
	Returns the given vector scaled by s.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.scaledBy
]]
---@param s number
---@return playdate.geometry.vector2D
function playdate.geometry.vector2D:scaledBy(s) end

--[[
	Modifies the caller by normalizing it so that its length is 1. If the vector is (0,0), the vector is unchanged.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.normalize
]]
function playdate.geometry.vector2D:normalize() end

--[[
	Returns a new vector by normalizing the given vector.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.normalized
]]
---@return playdate.geometry.vector2D
function playdate.geometry.vector2D:normalized() end

--[[
	Returns the dot product of the caller and the vector v.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.dotProduct
]]
---@param v playdate.geometry.vector2D
---@return number
function playdate.geometry.vector2D:dotProduct(v) end

--[[
	Returns the magnitude of the caller.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.magnitude
]]
---@return number
function playdate.geometry.vector2D:magnitude() end

--[[
	Returns the square of the magnitude of the caller.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.magnitudeSquared
]]
---@return number
function playdate.geometry.vector2D:magnitudeSquared() end

--[[
	Modifies the caller by projecting it along the vector v.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.projectAlong
]]
---@param v playdate.geometry.vector2D
function playdate.geometry.vector2D:projectAlong(v) end

--[[
	Returns a new vector created by projecting the given vector along the vector v.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.projectedAlong
]]
---@param v playdate.geometry.vector2D
---@return playdate.geometry.vector2D
function playdate.geometry.vector2D:projectedAlong(v) end

--[[
	Returns the angle between the caller and the vector v.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.angleBetween
]]
---@param v playdate.geometry.vector2D
function playdate.geometry.vector2D:angleBetween(v) end

--[[
	Returns a vector that is the left normal of the caller.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.leftNormal
]]
---@return playdate.geometry.vector2D
function playdate.geometry.vector2D:leftNormal() end

--[[
	Returns a vector that is the right normal of the caller.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.rightNormal
]]
---@return playdate.geometry.vector2D
function playdate.geometry.vector2D:rightNormal() end

--#endregion

--#endregion

--#region Graphics

---@alias PlaydateColor
---|`playdate.graphics.kColorBlack`
---|`playdate.graphics.kColorWhite`
---|`playdate.graphics.kColorClear`
---|`playdate.graphics.kColorXOR`

--#region Contexts

--[[
	Pushes the current graphics state to the context stack and creates a new context. If a playdate.graphics.image is given, drawing functions are applied to the image instead of the screen buffer.

	Equivalent to `playdate->graphics->pushContext()` in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.pushContext
]]
---@param image? playdate.graphics.image
function playdate.graphics.pushContext(image) end

--[[
	Pops a graphics context off the context stack and restores its state.

	Equivalent to `playdate->graphics->popContext()` in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.popContext
]]
function playdate.graphics.popContext() end

--#endregion

--#region Clearing the Screen

--[[
	Clears the entire display, setting the color to either the given color argument, or the current background color set in setBackgroundColor(color) if no argument is given.

	Equivalent to `playdate->graphics->clear()` in the C API.
]]
---@param color PlaydateColor
function playdate.graphics.clear(color) end

--#endregion

--#region image

--[[
	PNG and GIF images in the source folder are compiled into a Playdate-specific format by pdc, and can be loaded into Lua with playdate.graphics.image.new(path). Playdate images are 1 bit per pixel, with an optional alpha channel.

	https://sdk.play.date/inside-playdate/#C-graphics.image
]]
---@class playdate.graphics.image

--[[
	Creates a new image from the data at path, or creates a new blank image of the given width and height. The image can be drawn on using playdate.graphics.pushContext() or playdate.graphics.lockFocus(). The optional bgcolor argument is one of the color constants as used in playdate.graphics.setColor(), defaulting to kColorClear.

	https://sdk.play.date/inside-playdate/#f-graphics.image.new
	https://sdk.play.date/inside-playdate/#f-graphics.image.new-path
]]
---@param path_or_width integer|string
---@param height? integer
---@param bgColor? PlaydateColor
---@return playdate.graphics.image
function playdate.graphics.image.new(path_or_width, height, bgColor) end

--[[
	Loads a new image from the data at path into an already-existing image, without allocating additional memory. The image at path must be of the same dimensions as the original.

	Returns (success, [error]). If the boolean success is false, error is also returned.

	https://sdk.play.date/inside-playdate/#m-graphics.image.load
]]
---@param path string
---@return boolean success, string|nil errorMessage
function playdate.graphics.image:load(path) end

--[[
	Returns a new playdate.graphics.image that is an exact copy of the original.

	https://sdk.play.date/inside-playdate/#m-graphics.image.copy
]]
---@return playdate.graphics.image
function playdate.graphics.image:copy() end

-- TODO: Verify whether this returns width, height or returns an actual size object
--[[
	Returns the pair (width, height)

	https://sdk.play.date/inside-playdate/#m-graphics.image.getSize
]]
---@return integer width, integer height
function playdate.graphics.image:getSize() end

-- TODO: Verify whether this returns width, height or returns an actual size object
--[[
	Returns the pair (width, height) for the image at path without actually loading the image.

	https://sdk.play.date/inside-playdate/#f-graphics.image.imageSizeAtPath
]]
---@param path string
---@return integer width, integer height
function playdate.graphics.image.imageSizeAtPath(path) end

---@alias ImageFlip
---|`playdate.graphics.kImageUnflipped`
---|`playdate.graphics.kImageFlippedX`
---|`playdate.graphics.kImageFlippedY`
---|`playdate.graphics.kImageFlippedXY`
---|"flipX"
---|"flipY"
---|"flipZ"

--[[
	Draws the image with its upper-left corner at location (x, y) or playdate.geometry.point p.

	sourceRect, if specified, will cause only the part of the image within sourceRect to be drawn. sourceRect should be relative to the image’s bounds and can be a playdate.geometry.rect or four integers, (x, y, w, h), representing the rect.

	https://sdk.play.date/inside-playdate/#m-graphics.imgDraw
]]
---@param x integer|playdate.geometry.point
---@param y? integer|ImageFlip
---@param flip? ImageFlip|playdate.geometry.rect
---@param sourceRect? playdate.geometry.rect
function playdate.graphics.image:draw(x, y, flip, sourceRect)  end

--[[
	Draws the image at location (x, y) centered at the point within the image represented by (ax, ay) in unit coordinate space. For example, values of ax = 0.0, ay = 0.0 represent the image’s top-left corner, ax = 1.0, ay = 1.0 represent the bottom-right, and ax = 0.5, ay = 0.5 represent the center of the image.

	The flip argument is optional; see playdate.graphics.image:draw() for valid values.

	https://sdk.play.date/inside-playdate/#m-graphics.image.drawAnchored
]]
---@param x integer
---@param y integer
---@param ax number
---@param ay number
---@param flip? ImageFlip
function playdate.graphics.image:drawAnchored(x, y, ax, ay, flip) end

--[[
	Draws the image centered at location (x, y).

	The flip argument is optional; see playdate.graphics.image:draw() for valid values.

	https://sdk.play.date/inside-playdate/#m-graphics.image.drawCentered
]]
---@param x integer
---@param y integer
---@param flip? ImageFlip
function playdate.graphics.image:drawCentered(x, y, flip) end

--[[
	Draws the image ignoring the currently-set drawOffset.

	https://sdk.play.date/inside-playdate/#m-graphics.image.drawIgnoringOffset
]]
---@param x integer|playdate.geometry.point
---@param y? integer|ImageFlip
---@param flip? ImageFlip
function playdate.graphics.image:drawIgnoringOffset(x, y, flip) end

--[[
	Returns playdate.graphics.kColorWhite if the image is white at (x, y), playdate.graphics.kColorBlack if it’s black, or playdate.graphics.kColorClear if it’s transparent.

	https://sdk.play.date/inside-playdate/#m-graphics.image.sample
]]
---@param x integer
---@param y integer
---@return PlaydateColor
function playdate.graphics.image:sample(x, y) end

--[[
	Draws this image centered at point (x,y) at (clockwise) angle degrees, scaled by optional argument scale, with an optional separate scaling for the y axis.

	https://sdk.play.date/inside-playdate/#m-graphics.image.drawRotated
]]
---@param x integer
---@param y integer
---@param angle number
---@param scale? number
---@param yScale? number
function playdate.graphics.image:drawRotated(x, y, angle, scale, yScale) end

--[[
	Returns a new image containing this image rotated by (clockwise) angle degrees, scaled by optional argument scale, with an optional separate scaling for the y axis.

	https://sdk.play.date/inside-playdate/#m-graphics.image.rotatedImage
]]
---@param angle number
---@param scale? number
---@param yScale? number
---@return playdate.graphics.image
function playdate.graphics.image:rotatedImage(angle, scale, yScale) end

--[[
	Draws this image with its upper-left corner at point (x,y), scaled by amount scale, with an optional separate scaling for the y axis.

	https://sdk.play.date/inside-playdate/#m-graphics.image.drawScaled
]]
---@param x integer
---@param y integer
---@param scale number
---@param yScale? number
function playdate.graphics.image:drawScaled(x, y, scale, yScale) end

--[[
	Returns a new image containing this image scaled by amount scale, with an optional separate scaling for the y axis.

	https://sdk.play.date/inside-playdate/#m-graphics.image.scaledImage
]]
---@param scale number
---@param yScale? number
---@return playdate.graphics.image
function playdate.graphics.image:scaledImage(scale, yScale) end

--[[
	Draws this image centered at point (x,y) with the transform xform applied.

	https://sdk.play.date/inside-playdate/#m-graphics.image.drawWithTransform
]]
---@param xform playdate.geometry.affineTransform
---@param x number
---@param y number
function playdate.graphics.image:drawWithTransform(xform, x, y) end

--[[
	Returns a new image containing the image with the transform xform applied.

	https://sdk.play.date/inside-playdate/#m-graphics.image.transformedImage
]]
---@param xform playdate.geometry.affineTransform
---@return playdate.graphics.image
function playdate.graphics.image:transformedImage(xform) end

--[[
	Draws the image as if it’s mapped onto a tilted plane, transforming the target coordinates to image coordinates using an affine transform:

	x' = dxx * x + dyx * y + dx
	y' = dxy * x + dyy * y + dy

    x, y, width, height: The rectangle to fill
    centerx, centery: The point in the above rectangle [in (0,1)x(0,1) coordinates] for the center of the transform
    dxx, dyx, dxy, dyy, dx, dy: Defines an affine transform from geometry coordinates to image coordinates
    z: The distance from the viewer to the target plane — lower z means more exaggerated perspective
    tiltAngle: The tilt of the target plane about the x axis, in degrees
    tile: A boolean, indicating whether the image is tiled on the target plane

	The Mode7Driver demo in the /Examples folder of the SDK demonstrates the usage of this function.

	https://sdk.play.date/inside-playdate/#m-graphics.image.drawSampled
]]
---@param x number
---@param y number
---@param width number
---@param height number
---@param centerx number
---@param centery number
---@param dxx number
---@param dyx number
---@param dxy number
---@param dyy number
---@param dx number
---@param dy number
---@param z number
---@param tiltAngle number
---@param tile boolean
function playdate.graphics.image:drawSampled(x, y, width, height, centerx, centery, dxx, dyx, dxy, dyy, dx, dy, z, tiltAngle, tile) end

--[[
	Sets the image’s mask to a copy of maskImage.

	https://sdk.play.date/inside-playdate/#m-graphics.image.setMaskImage
]]
---@param maskImage playdate.graphics.image
function playdate.graphics.image:setMaskImage(maskImage) end

--[[
	If the image has a mask, returns the mask as a separate image. Otherwise, returns nil.

	The returned image references the original’s data, so drawing into this image alters the original image’s mask. 

	https://sdk.play.date/inside-playdate/#m-graphics.image.getMaskImage
]]
---@return playdate.graphics.image|nil
function playdate.graphics.image:getMaskImage() end

--[[
	Adds a mask to the image if it doesn’t already have one. If opaque is true, the image will be set to entirely opaque. Otherwise, or if not specified, the image will be completely transparent.

	https://sdk.play.date/inside-playdate/#m-graphics.image.addMask
]]
---@param opaque? boolean
function playdate.graphics.image:addMask(opaque) end

--[[
	Removes the mask from the image if it has one.

	https://sdk.play.date/inside-playdate/#m-graphics.image.removeMask
]]
function playdate.graphics.image:removeMask() end

--[[
	Returns true if the image has a mask.

	https://sdk.play.date/inside-playdate/#m-graphics.image.hasMask
]]
---@return boolean
function playdate.graphics.image:hasMask() end

--[[
	Erases the contents of the image’s mask, so that the image is entirely opaque if opaque is 1, transparent otherwise. This function has no effect if the image doesn’t have a mask.

	https://sdk.play.date/inside-playdate/#m-graphics.image.clearMask
]]
---@param opaque? boolean
function playdate.graphics.image:clearMask(opaque) end

--[[
	Tiles the image into the given rectangle, using either listed dimensions or a playdate.geometry.rect object, and the optional flip style.

	https://sdk.play.date/inside-playdate/#m-graphics.image.drawTiled
]]
---@param x number|playdate.geometry.rect
---@param y_or_flip? number|ImageFlip
---@param width? number
---@param height? number
---@param flip? ImageFlip
function playdate.graphics.image:drawTiled(x, y_or_flip, width, height, flip) end

---@alias DitherType
---|`playdate.graphics.image.kDitherTypeNone`
---|`playdate.graphics.image.kDitherTypeDiagonalLine`
---|`playdate.graphics.image.kDitherTypeVerticalLine`
---|`playdate.graphics.image.kDitherTypeHorizontalLine`
---|`playdate.graphics.image.kDitherTypeScreen`
---|`playdate.graphics.image.kDitherTypeBayer2x2`
---|`playdate.graphics.image.kDitherTypeBayer4x4`
---|`playdate.graphics.image.kDitherTypeBayer8x8`
---|`playdate.graphics.image.kDitherTypeFloydSteinberg`
---|`playdate.graphics.image.kDitherTypeBurkes`
---|`playdate.graphics.image.kDitherTypeAtkinson`

--[[
	Draws a blurred version of the image at (x, y).

	https://sdk.play.date/inside-playdate/#m-graphics.image.drawBlurred
]]
---@param x number
---@param y number
---@param radius number A bigger radius means a more blurred result. Processing time is independent of the radius.
---@param numPasses number A box blur is used to blur the image. The more passes, the more closely the blur approximates a gaussian blur. However, higher values will take more time to process.
---@param ditherType DitherType
---@param flip? ImageFlip
---@param xPhase? DitherType
---@param yPhase? DitherType
function playdate.graphics.image:drawBlurred(x, y, radius, numPasses, ditherType, flip, xPhase, yPhase) end

--[[
	Draws a partially transparent image with its upper-left corner at location (x, y)

	https://sdk.play.date/inside-playdate/#m-graphics.image.drawFaded
]]
---@param x number
---@param y number
---@param alpha number The alpha value used to draw the image, with 1 being fully opaque, and 0 being completely transparent.
---@param ditherType DitherType
function playdate.graphics.image:drawFaded(x, y, alpha, ditherType) end

--[[
	If flag is true, the image will be drawn with its colors inverted. If the image is being used as a stencil, its behavior is reversed: pixels are drawn where the stencil is black, nothing is drawn where the stencil is white.

	https://sdk.play.date/inside-playdate/#m-graphics.image.setInverted
]]
---@param flag boolean
function playdate.graphics.image:setInverted(flag) end

--[[
	Returns a color-inverted copy of the caller.

	https://sdk.play.date/inside-playdate/#m-graphics.image.invertedImage
]]
---@return playdate.graphics.image
function playdate.graphics.image:invertedImage() end

--[[
	Returns an image that is a blend between the caller and image.

	https://sdk.play.date/inside-playdate/#m-graphics.image.blendWithImage
]]
---@param image playdate.graphics.image the playdate.graphics.image to be blended with the caller.
---@param alpha number The alpha value assigned to the caller. image will have an alpha of (1 - alpha).
---@param ditherType DitherType The caller and image are blended into a greyscale image and dithered with one of the dithering algorithms listed in playdate.graphics.image:blurredImage()
function playdate.graphics.image:blendWithImage(image, alpha, ditherType) end

--[[
	Returns a blurred copy of the caller.

	https://sdk.play.date/inside-playdate/#m-graphics.image.blurredImage
]]
---@param radius number A bigger radius means a more blurred result. Processing time is independent of the radius.
---@param numPasses integer A box blur is used to blur the image. The more passes, the more closely the blur approximates a gaussian blur. However, higher values will take more time to process.
---@param ditherType DitherType
---@param padEdges boolean Boolean indicating whether the edges of the images should be padded to accommodate the blur radius. Defaults to false.
---@param xPhase? DitherType
---@param yPhase? DitherType
function playdate.graphics.image:blurredImage(radius, numPasses, ditherType, padEdges, xPhase, yPhase) end

--[[
	Returns a faded version of the caller.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#m-graphics.image.fadedImage
]]
---@param alpha number The alpha value assigned to the caller, in the range 0.0 - 1.0. If an image mask already exists it is multiplied by alpha.
---@param ditherType DitherType The caller is faded into a greyscale image and dithered with one of the dithering algorithms listed in 
function playdate.graphics.image:fadedImage(alpha, ditherType) end

--[[
	Returns an image created by applying a VCR pause effect to the calling image.

	https://sdk.play.date/inside-playdate/#m-graphics.image.vcrPauseFilterImage
]]
---@return playdate.graphics.image
function playdate.graphics.image:vcrPauseFilterImage() end

--[[
	Returns true if the non-alpha-masked portions of image1 and image2 overlap if they were drawn at positions (x1, y1) and (x2, y2) and flipped according to flip1 and flip2, which should each be one of the values listed in playdate.graphics.image:draw().

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#f-graphics.checkAlphaCollision
]]
---@param image1 playdate.graphics.image
---@param x1 number
---@param y1 number
---@param flip1 ImageFlip
---@param image2 playdate.graphics.image
---@param x2 number
---@param y2 number
---@param flip2 ImageFlip
function playdate.graphics.checkAlphaCollision(image1, x1, y1, flip1, image2, x2, y2, flip2) end

--#endregion

--#region Color & Pattern

--[[
	Sets and gets the current drawing color for primitives.

	This color applies to drawing primitive shapes such as lines and rectangles, not bitmap images.

	https://sdk.play.date/inside-playdate/#f-graphics.setColor
]]
---@param color PlaydateColor
function playdate.graphics.setColor(color) end

--[[
	Gets the current drawing color for primitives.

	https://sdk.play.date/inside-playdate/#f-graphics.getColor
]]
---@return PlaydateColor
function playdate.graphics.getColor() end

--[[
	Sets the color used for drawing the background, if necessary, before playdate.graphics.sprites are drawn on top.

	Use kColorClear if you intend to draw behind sprites.

	Equivalent to `playdate->graphics->setBackgroundColor()` in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.setBackgroundColor
]]
---@param color PlaydateColor
function playdate.graphics.setBackgroundColor(color) end

--[[
	Gets the color used for drawing the background, if necessary, before playdate.graphics.sprites are drawn on top.

	https://sdk.play.date/inside-playdate/#f-graphics.getBackgroundColor
]]
---@return PlaydateColor
function playdate.graphics.getBackgroundColor() end

--[[
	Sets the 8x8 pattern used for drawing.

	Alternatively, uses the given playdate.graphics.image to set the 8 x 8 pattern used for drawing. The optional x, y offset (default 0, 0) indicates the top left corner of the 8 x 8 pattern.

	https://sdk.play.date/inside-playdate/#f-graphics.setPattern
]]
---@param pattern_or_image playdate.graphics.image|integer[] An array of 8 numbers describing the bitmap for each row; for example, { 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55 } specifies a checkerboard pattern. An additional 8 numbers can be specified for an alpha mask bitmap.
---@param x? number
---@param y? number
function playdate.graphics.setPattern(pattern_or_image, x, y) end

--[[
	Sets the pattern used for drawing to a dithered pattern. If the current drawing color is white, the pattern is white pixels on a transparent background and (due to a bug) the alpha value is inverted: 1.0 is transparent and 0 is opaque. Otherwise, the pattern is black pixels on a transparent background and alpha 0 is transparent while 1.0 is opaque.

	The optional ditherType argument is a dither type as used in playdate.graphics.image:blurredImage(), and should be an ordered dither type; i.e., line, screen, or Bayer.

	https://sdk.play.date/inside-playdate/#f-graphics.setDitherPattern
]]
---@param alpha number
---@param ditherType DitherType
function playdate.graphics.setDitherPattern(alpha, ditherType) end

--#endregion

--#region Drawing

--[[
	playdate.graphics.drawLine(ls)

	Draws a line from (x1, y1) to (x2, y2), or draws the playdate.geometry.lineSegment ls.

	Line width is specified by `setLineWidth()`. End cap style is specified by `setLineCapStyle()`.

	Equivalent to `playdate->graphics->drawLine()` in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.drawLine
]]
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
function playdate.graphics.drawLine(x1, y1, x2, y2) end

---@alias LineCapStyle
---|`playdate.graphics.kLineCapStyleButt`
---|`playdate.graphics.kLineCapStyleRound`
---|`playdate.graphics.kLineCapStyleSquare`

--[[
	Specifies the shape of the endpoints drawn by drawLine.

	Equivalent to playdate->graphics->setLineCapStyle() in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.setLineCapStyle
]]
---@param style LineCapStyle
function playdate.graphics.setLineCapStyle(style) end

--[[
	Draw a single pixel in the current color at (x, y).

	playdate.graphics.drawPixel(p)

	Draw a single pixel in the current color at playdate.geometry.point p.

	https://sdk.play.date/inside-playdate/#f-graphics.drawPixel
]]
---@param x_or_point integer|playdate.geometry.point
---@param y? integer
function playdate.graphics.drawPixel(x_or_point, y) end

--[[
	Draws the rect r or the rect with origin (x, y) with a size of (w, h).

	Line width is specified by setLineWidth(). Stroke location is specified by setStrokeLocation().

	Equivalent to playdate->graphics->drawRect() in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.drawRect
]]
---@param x integer|playdate.geometry.rect
---@param y? integer
---@param w? integer
---@param h? integer
function playdate.graphics.drawRect(x, y, w, h) end

--[[
	Draws the filled rectangle r or the rect at (x, y) of the given width and height.

	Equivalent to playdate->graphics->fillRect() in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.fillRect
]]
---@param x integer|playdate.geometry.rect
---@param y? integer
---@param width? integer
---@param height? integer
function playdate.graphics.fillRect(x, y, width, height) end

--[[
	Draws a rectangle with rounded corners in the rect r or the rect with origin (x, y) and size (w, h).

	https://sdk.play.date/inside-playdate/#f-graphics.drawRoundRect
]]
---@param x integer|playdate.geometry.rect
---@param y integer|number
---@param w? integer
---@param h? integer
---@param radius? number Corner radius
function playdate.graphics.drawRoundRect(x, y, w, h, radius) end

--[[
	Draws a filled rectangle with rounded corners in the rect r or the rect with origin (x, y) and size (w, h).

	https://sdk.play.date/inside-playdate/#f-graphics.fillRoundRect
]]
---@param x integer|playdate.geometry.rect
---@param y integer|number
---@param w? integer
---@param h? integer
---@param radius? number Corner radius
function playdate.graphics.fillRoundRect(x, y, w, h, radius) end

--[[
	Draws an arc using the current color.

	Angles are specified in degrees, not radians.

	https://sdk.play.date/inside-playdate/#f-graphics.drawArc
]]
---@param x integer|playdate.geometry.arc
---@param y? integer
---@param radius? number
---@param startAngle? number
---@param endAngle? number
function playdate.graphics.drawArc(x, y, radius, startAngle, endAngle) end

--[[
	Draws a circle at the point (x, y) (or p) with radius radius.

	https://sdk.play.date/inside-playdate/#f-graphics.drawCircleAtPoint
]]
---@param x integer|playdate.geometry.point
---@param y? integer
---@param radius? number
function playdate.graphics.drawCircleAtPoint(x, y, radius) end

--[[
	Draws a circle in the rect r or the rect with origin (x, y) and size (width, height).

	If the rect is not a square, the circle will be drawn centered in the rect.

	https://sdk.play.date/inside-playdate/#f-graphics.drawCircleInRect
]]
---@param x integer|playdate.geometry.rect
---@param y? integer
---@param width? integer
---@param height? integer
function playdate.graphics.drawCircleInRect(x, y, width, height) end

--[[
	Draws a filled circle at the point (x, y) (or p) with radius radius.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#f-graphics.fillCircleAtPoint
]]
---@param x integer|playdate.geometry.point
---@param y integer|number
---@param radius? number
function playdate.graphics.fillCircleAtPoint(x, y, radius) end

--[[
	Draws a filled circle in the rect r or the rect with origin (x, y) and size (width, height).

	If the rect is not a square, the circle will be drawn centered in the rect.

	https://sdk.play.date/inside-playdate/#f-graphics.fillCircleInRect
]]
---@param x integer|playdate.geometry.rect
---@param y? integer
---@param width? integer
---@param height? integer
function playdate.graphics.fillCircleInRect(x, y, width, height) end

--[[
	Draws an ellipse in the rect r or the rect with origin (x, y) and size (width, height).

	startAngle and endAngle, if provided, should be in degrees (not radians), and will cause only the segment of the ellipse between startAngle and endAngle to be drawn.

	https://sdk.play.date/inside-playdate/#f-graphics.drawEllipseInRect
]]
---@param x integer|playdate.geometry.rect
---@param y? integer|number
---@param width? integer|number
---@param height? integer
---@param startAngle? number
---@param endAngle? number
function playdate.graphics.drawEllipseInRect(x, y, width, height, startAngle, endAngle) end

--[[
	Draws a filled ellipse in the rect r or the rect with origin (x, y) and size (width, height).

	startAngle and endAngle, if provided, should be in degrees (not radians), and will cause only the segment of the ellipse between startAngle and endAngle to be drawn.

	https://sdk.play.date/inside-playdate/#f-graphics.fillEllipseInRect
]]
---@param x integer|playdate.geometry.rect
---@param y? integer|number
---@param width? integer|number
---@param height? integer
---@param startAngle? number
---@param endAngle? number
function playdate.graphics.fillEllipseInRect(x, y, width, height, startAngle, endAngle) end

--[[
	Draw the playdate.geometry.polygon p.

	Line width is specified by setLineWidth().

	https://sdk.play.date/inside-playdate/#f-graphics.drawPolygon
	https://sdk.play.date/inside-playdate/#playdate-graphics-drawpolygon-x1-y1-x2-y2-draw-the-polygon-speci
]]
---@param p playdate.geometry.polygon|number
---@param ... number
function playdate.graphics.drawPolygon(p, ...) end

--[[
	Fills the polygon specified by a list of x,y coordinates.

	Equivalent to playdate->graphics->fillPolygon() in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.fillPolygon
	https://sdk.play.date/inside-playdate/#playdate-graphics-fillpolygon-p-fills-the-polygon-specified-by-t
]]
---@param p playdate.geometry.polygon|number
---@param ... number
function playdate.graphics.fillPolygon(p, ...) end

--[[
	Sets the winding rule for filling polygons, one of:

    playdate.graphics.kPolygonFillNonZero
    playdate.graphics.kPolygonFillEvenOdd

	See https://en.wikipedia.org/wiki/Nonzero-rule for an explanation of the winding rule.

	https://sdk.play.date/inside-playdate/#f-graphics.setPolygonFillRule
]]
---@param rule PolygonFillRule
function playdate.graphics.setPolygonFillRule(rule) end

--[[
	Draws a triangle with vertices (x1, y1), (x2, y2), and (x3, y3).

	https://sdk.play.date/inside-playdate/#f-graphics.drawTriangle
]]
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param x3 number
---@param y3 number
function playdate.graphics.drawTriangle(x1, y1, x2, y2, x3, y3) end

--[[
	Draws a filled triangle with vertices (x1, y1), (x2, y2), and (x3, y3).

	Equivalent to playdate->graphics->fillTriangle() in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.fillTriangle
]]
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param x3 number
---@param y3 number
function playdate.graphics.fillTriangle(x1, y1, x2, y2, x3, y3) end

--[[
	A "9 slice" is a rectangular image that is made "stretchable" by being sliced into nine pieces — the four corners, the four edges, and the center.

	https://sdk.play.date/inside-playdate/#C-graphics.nineSlice
]]
---@class playdate.graphics.nineSlice
playdate.graphics.nineSlice = {}

--[[
	Returns a new 9 slice image from the image at imagePath with the stretchable region defined by other parameters. The arguments represent the origin and dimensions of the innermost ("center") slice.

	https://sdk.play.date/inside-playdate/#f-graphics.nineSlice.new
]]
---@param imagePath string
---@param innerX number
---@param innerY number
---@param innerWidth number
---@param innerHeight number
---@return playdate.graphics.nineSlice
function playdate.graphics.nineSlice.new(imagePath, innerX, innerY, innerWidth, innerHeight) end

--[[
	Returns the size of the 9 slice image as a pair (width, height).

	https://sdk.play.date/inside-playdate/#m-graphics.nineSlice.getSize
]]
---@return number width, number height
function playdate.graphics.nineSlice:getSize() end

--[[
	Returns the minimum size of the 9 slice image as a pair (width, height).

	https://sdk.play.date/inside-playdate/#m-graphics.nineSlice.getMinSize
]]
---@return number width, number height
function playdate.graphics.nineSlice:getMinSize() end

--[[
	Draws the 9 slice image at the desired coordinates by stretching the defined region to achieve the width and height inputs.

	https://sdk.play.date/inside-playdate/#m-graphics.nineSlice.drawInRect
]]
---@param x integer|playdate.geometry.rect
---@param y? integer
---@param width? number
---@param height? number
function playdate.graphics.nineSlice:drawInRect(x, y, width, height) end

--[[
	Returns the Perlin value (from 0.0 to 1.0) at position (x, y, z).

	If rep is greater than 0, the pattern of noise will repeat at that point on all 3 axes.

	octaves is the number of octaves of noise to apply. Compute time increases linearly with each additional octave, but the results are a bit more organic, consisting of a combination of larger and smaller variations.

	When using more than one octave, persistence is a value from 0.0 - 1.0 describing the amount the amplitude is scaled each octave. The lower the value of persistence, the less influence each successive octave has on the final value.

	https://sdk.play.date/inside-playdate/#f-graphics.perlin
]]
---@param x number
---@param y number
---@param z number
---@param rep number
---@param octaves? number
---@param persistence? number
---@return number
function playdate.graphics.perlin(x, y, z, rep, octaves, persistence) end

--[[
	Returns an array of Perlin values at once, avoiding the performance penalty of calling perlin() multiple times in a loop.

	The parameters are the same as perlin() except:

	dx, dy, and dz are how far to step along the x, y, and z axes in each iteration.

	https://sdk.play.date/inside-playdate/#f-graphics.perlinArray
]]
---@param count integer number of values to be returned.
---@param x number
---@param dx number
---@param y? number
---@param dy? number
---@param z? number
---@param dz? number
---@param rep? number
---@param octaves? number
---@param persistence? number
---@return number[]
function playdate.graphics.perlinArray(count, x, dx, y, dy, z, dz, rep, octaves, persistence) end

--[[
	You must import CoreLibs/qrcode to use this function.

	Asynchronously returns an image representing a QR code for the passed-in string to the function callback. The arguments passed to the callback are image, errorMessage. (If an errorMessage string is returned, image will be nil.)

	desiredEdgeDimension lets you specify an approximate edge dimension in pixels for the desired QR code, though the function has limited flexibility in sizing QR codes, based on the amount of information to be encoded, and the restrictions of a 1-bit screen. The function will attempt to generate a QR code smaller than desiredEdgeDimension if possible. (Note that QR codes always have the same width and height.)

	If you specify nil for desiredEdgeDimension, the returned image will balance small size with easy readability. If you specify 0, the returned image will be the smallest possible QR code for the specified string.

	generateQRCode() will return a reference to the timer it uses to run asynchronously. If you wish to stop execution of the background process generating the QR code, call :remove() on that returned timer.

	https://sdk.play.date/inside-playdate/#f-graphics.generateQRCode
]]
---@param stringToEncode string
---@param desiredEdgeDimension integer
---@param callback fun()
function playdate.graphics.generateQRCode(stringToEncode, desiredEdgeDimension, callback) end

--[[
	You must import CoreLibs/graphics to use this function.

	Draws an approximation of a sine wave between the points startX, startY and endX, endY.

    startAmplitude: The number of pixels above and below the line from startX, startY and endX, endY the peaks and valleys of the wave will be drawn at the start of the wave.

    endAmplitude: The number of pixels above and below the line from startX, startY and endX, endY the peaks and valleys of the wave will be drawn at the end of the wave.

    period: The distance between peaks, in pixels.

    phaseShift: If provided, specifies the wave’s offset, in pixels.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#f-graphics.drawSineWave
]]
---@param startX number
---@param startY number
---@param endX number
---@param endY number
---@param startAmplitude number
---@param endAmplitude number
---@param period number
---@param phaseShift? number
function playdate.graphics.drawSineWave(startX, startY, endX, endY, startAmplitude, endAmplitude, period, phaseShift) end

--#endregion

--#region Drawing Modifiers

--[[
	Sets the clipping rectangle for all subsequent graphics drawing, including bitmaps. The argument can either be separate dimensions or a playdate.geometry.rect object. The clip rect is automatically cleared at the beginning of the playdate.update() callback. The function uses world coordinates; that is, the given rectangle will be translated by the current drawing offset. To use screen coordinates instead, use setScreenClipRect()

	Equivalent to playdate->graphics->setClipRect() in the C API.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#f-graphics.setClipRect
	https://sdk.play.date/inside-playdate/#f-graphics.setClipRect-rect
]]
---@param x integer|playdate.geometry.rect
---@param y? integer
---@param width? integer
---@param height? integer
function playdate.graphics.setClipRect(x, y, width, height) end

--[[
	Returns multiple values (x, y, width, height) giving the current clipping rectangle.

	https://sdk.play.date/inside-playdate/#f-graphics.getClipRect
]]
---@return integer x, integer y, integer width, integer height
function playdate.graphics.getClipRect() end

--[[
	Sets the clip rectangle as above, but uses screen coordinates instead of world coordinates—​that is, it ignores the current drawing offset.

	Equivalent to playdate->graphics->setScreenClipRect() in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.setScreenClipRect
	https://sdk.play.date/inside-playdate/#f-graphics.setScreenClipRect-rect
]]
---@param x integer|playdate.geometry.rect
---@param y? integer
---@param width? integer
---@param height? integer
function playdate.graphics.setScreenClipRect(x, y, width, height) end

--[[
	Gets the clip rectangle as above, but uses screen coordinates instead of world coordinates—​that is, it ignores the current drawing offset.

	https://sdk.play.date/inside-playdate/#f-graphics.getScreenClipRect
]]
---@return integer x, integer y, integer width, integer height
function playdate.graphics.getScreenClipRect() end

--[[
	Clears the current clipping rectangle, set with setClipRect().

	Equivalent to playdate->graphics->clearClipRect() in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.clearClipRect
]]
function playdate.graphics.clearClipRect() end

--[[
	Sets the current stencil to the given image. If tile is set, the the stencil will be tiled; in this case, the image width must be a multiple of 32 pixels.

	Equivalent to playdate->graphics->setStencilImage() in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.setStencilImage
]]
---@param image playdate.graphics.image
---@param tile? boolean
function playdate.graphics.setStencilImage(image, tile) end

--- TODO: Verify the actual typing here.
--[[
	Sets a pattern to use for stenciled drawing, as an alternative to creating an image, drawing a pattern into the image, then using that in setStencilImage().

	https://sdk.play.date/inside-playdate/#f-graphics.setStencilPattern
	https://sdk.play.date/inside-playdate/#playdate-graphics-setstencilpattern-row1-row2-row3-row4-row5-row
	https://sdk.play.date/inside-playdate/#f-graphics.setStencilPattern-dither
]]
---@param ... any
function playdate.graphics.setStencilPattern(...) end

--[[
	Clears the stencil buffer.

	https://sdk.play.date/inside-playdate/#f-graphics.clearStencil
]]
function playdate.graphics.clearStencil() end

---@alias DrawMode
---|`playdate.graphics.kDrawModeCopy`
---|`playdate.graphics.kDrawModeWhiteTransparent`
---|`playdate.graphics.kDrawModeBlackTransparent`
---|`playdate.graphics.kDrawModeFillWhite`
---|`playdate.graphics.kDrawModeFillBlack`
---|`playdate.graphics.kDrawModeXOR`
---|`playdate.graphics.kDrawModeNXOR`
---|`playdate.graphics.kDrawModeInverted`
---|"copy"
---|"inverted"
---|"XOR"
---|"NXOR"
---|"whiteTransparent"
---|"blackTransparent"
---|"fillWhite"
---|"fillBlack"

--[[
	Sets the current drawing mode for images.

	The draw mode applies to images and fonts (which are technically images). The draw mode does not apply to primitive shapes such as lines or rectangles.

	Equivalent to playdate->graphics->setDrawMode() in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.setImageDrawMode
]]
---@param mode DrawMode
function playdate.graphics.setImageDrawMode(mode) end

--[[
	Gets the current drawing mode for images.

	https://sdk.play.date/inside-playdate/#f-graphics.getImageDrawMode
]]
---@return DrawMode
function playdate.graphics.getImageDrawMode() end

--[[
	Sets the width of the line for drawLine, drawRect, drawPolygon, and drawArc when a playdate.geometry.arc is passed as the argument.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#f-graphics.setLineWidth
]]
---@param width number
function playdate.graphics.setLineWidth(width) end

--[[
	Gets the width of the line for drawLine, drawRect, drawPolygon, and drawArc when a playdate.geometry.arc is passed as the argument.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#f-graphics.getLineWidth
]]
---@return number
function playdate.graphics.getLineWidth() end

---@alias StrokeLocation
---|`playdate.graphics.kStrokeCentered`
---|`playdate.graphics.kStrokeOutside`
---|`playdate.graphics.kStrokeInside`

--[[
	Specifies where the stroke is placed relative to the rectangle passed into drawRect.

	https://sdk.play.date/inside-playdate/#f-graphics.setStrokeLocation
]]
---@param location StrokeLocation
function playdate.graphics.setStrokeLocation(location) end

--[[
	Gets stroke position relative to the rectangle passed into drawRect.

	https://sdk.play.date/inside-playdate/#f-graphics.getStrokeLocation
]]
---@return StrokeLocation
function playdate.graphics.getStrokeLocation() end

--#endregion

--#region Offscreen Drawing

--[[
	lockFocus() routes all drawing to the given playdate.graphics.image. playdate.graphics.unlockFocus() returns drawing to the frame buffer.

	https://sdk.play.date/inside-playdate/#f-graphics.lockFocus
]]
---@param image playdate.graphics.image
function playdate.graphics.lockFocus(image) end

--[[
	After calling unlockFocus(), drawing is routed to the frame buffer.

	https://sdk.play.date/inside-playdate/#f-graphics.unlockFocus
]]
function playdate.graphics.unlockFocus() end

--#endregion

--#region Animation
--#endregion

--#endregion

--#region JSON

--[[
	Takes the JSON encoded string and converts it to a Lua table.

	Equivalent to `playdate->json->decode()` in the C API.

	https://sdk.play.date/inside-playdate/#f-json.decode
]]
---@param string string
---@return { [string]: any }
function json.decde(string) end

--[[
	Reads the given playdate.file.file object and converts it to a Lua table.

	https://sdk.play.date/inside-playdate/#f-json.decodeFile-file
]]
---@param file playdate.file.file|string
---@return { [string]: any }
function json.decodeFile(file) end

--[[
	Returns a string containing the JSON representation of the passed-in Lua table.

	https://sdk.play.date/inside-playdate/#f-json.encode
]]
---@param table table
---@return string
function json.encode(table) end

--[[
	Returns a string containing the JSON representation of a Lua table, with human-readable formatting.

	https://sdk.play.date/inside-playdate/#f-json.encodePretty
]]
---@param table table
---@return string
function json.encodePretty(table) end

--[[
	Encodes the Lua table table to JSON and writes it to the given playdate.file.file object. If pretty is true, the output is formatted to make it human-readable. Otherwise, no additional whitespace is added.

	https://sdk.play.date/inside-playdate/#f-json.encodeToFile-file
]]
---@param file playdate.file.file|string
---@param pretty boolean|table
---@param table? table
function json.encodeToFile(file, pretty, table) end

--#endregion

--#region Keyboard
--#endregion

--#region Math

--[[
	Returns a number that is the linear interpolation between min and max based on t, where t = 0.0 will return min and t = 1.0 will return max.

	You must import CoreLibs/math to use this function. 
]]
---@param min number
---@param max number
---@param t number
---@return number
function playdate.math.lerp(min, max, t) end

--#endregion

--#region Pathfinding
--#endregion

--#region Power

--[[
	Returns a table holding booleans with the following keys: charging (for any sort of charging), and USB (for USB-specific charging). Test these values for true to see if the device is being charged, and by what means.

	https://sdk.play.date/inside-playdate/#f-getPowerStatus
]]
---@return {charging: boolean, USB: boolean}
function playdate.getPowerStatus() end

--[[
	Returns a value from 0-100 denoting the current level of battery charge. 0 = empty; 100 = full.

	https://sdk.play.date/inside-playdate/#f-getBatteryPercentage
]]
---@return integer
function playdate.getBatteryPercentage() end

--[[
	Returns the battery’s current voltage level.

	https://sdk.play.date/inside-playdate/#f-getBatteryVoltage
]]
---@return number
function playdate.getBatteryVoltage() end

--#endregion

--#region Simulator-Only Functionality

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

--#endregion

--#region Sound
--#endregion

--#region Strings

--[[
	Generates a random string of uppercase letters

	https://sdk.play.date/inside-playdate/#f-string.UUID
]]
---@param length integer
---@return string
function playdate.string.uuid(length) end

--[[
	Returns a string with the whitespace removed from the beginning and ending of string.

	https://sdk.play.date/inside-playdate/#f-string.trimWhitespace
]]
---@param string string
---@return string
function playdate.string.trimWhitespace(string) end

--[[
	Returns a string with the whitespace removed from the beginning of string.

	https://sdk.play.date/inside-playdate/#f-string.trimLeadingWhitespace
]]
---@param string string
---@return string
function playdate.string.trimLeadingWhitespace(string) end

--[[
	Returns a string with the whitespace removed from the ending of string.

	https://sdk.play.date/inside-playdate/#f-string.trimTrailingWhitespace
]]
---@param string string
---@return string
function playdate.string.trimTrailingWhitespace(string) end

--#endregion

--#region Timers
--#endregion

--#region Frame Timers
--#endregion

--#region UI Components
--#endregion

--#region Garbage Collection
--#endregion
