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
