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
	Provides a means for drawing a grid view composed of cells, and optionally sections with section headers.
	
	You must import CoreLibs/ui to use gridview.

	Some notes:
    - playdate.ui.gridview uses playdate.timer internally, so playdate.timer.updateTimers() must be called in the main playdate.update() function.
    - If the gridview’s cell width is set to 0, cells will be drawn the same width as the table (minus any padding).
    - Section headers always draw the full width of the grid (minus padding), and do not scroll horizontally along with the rest of the content.

	https://sdk.play.date/inside-playdate/#C-ui.gridview
]]
---@class playdate.ui.gridview : Object
---@field needsDisplay boolean This read-only variable returns true if the gridview needs to be redrawn. This can be used to help optimize drawing in your app. Keep in mind that a gridview cannot know all reasons it may need to be redrawn, such as changes in your drawing callback functions, coordinate or size changes, or overlapping drawing, so you may need to additionally redraw at other times.
---@field backgroundImage playdate.graphics.image|playdate.graphics.nineSlice A background image that draws behind the gridview’s cells. This image can be either a playdate.graphics.image which will be tiled or a playdate.nineSlice.
---@field isScrolling boolean Read-only. True if the gridview is currently performing a scroll animation.
---@field scrollEasingFunction EasingFunction The easing function used when performing scroll animations. The function should be of the form function(t, b, c, d), where t is elapsed time, b is the beginning value, c is the change, or end value - start value, and d is the duration. Many such functions are available in playdate.easingFunctions. playdate.easingFunctions.outCubic is the default.
---@field easingAmplitude number For easing functions that take additional amplitude and period arguments (such as inOutElastic), set these to the desired values.
---@field easingPeriod number For easing functions that take additional amplitude and period arguments (such as inOutElastic), set these to the desired values.
---@field changeRowOnColumnWrap boolean Controls the behavior of playdate.ui.gridview:selectPreviousColumn() and playdate.ui.gridview:selectNextColumn() if the current selection is at the first or last column, respectively. If set to true, the selection switch to a new row to allow the selection to change. If false, the call will have no effect on the selection. True by default.
---@field scrollCellsToCenter boolean If true, the gridview will attempt to center cells when scrolling. If false, the gridview will be scrolled just as much as necessary to make the cell visible.
playdate.ui.gridview = {}

--[[
	Returns a new playdate.ui.gridview with cells sized cellWidth, cellHeight. (Sizes are in pixels.) If cells should span the entire width of the grid (as in a list view), pass zero (0) for cellWidth.

	https://sdk.play.date/inside-playdate/#f-gridview.new
]]
---@param cellWidth integer
---@param cellHeight integer
---@return playdate.ui.gridview
function playdate.ui.gridview.new(cellWidth, cellHeight) end

--[[
	Override this method to draw the cells in the gridview. selected is a boolean, true if the cell being drawn is the currently-selected cell.

	https://sdk.play.date/inside-playdate/#m-gridview.drawCell
]]
---@param section integer
---@param row integer
---@param column integer
---@param selected boolean
---@param x integer
---@param y integer
---@param width integer
---@param height integer
function playdate.ui.gridview:drawCell(section, row, column, selected, x, y, width, height) end

--[[
	Override this method to draw section headers. This function will only be called if the header height has been set to a value greater than zero (0).

	https://sdk.play.date/inside-playdate/#m-gridview.drawSectionHeader
]]
---@param section integer
---@param x integer
---@param y integer
---@param width integer
---@param height integer
function playdate.ui.gridview:drawSectionHeader(section, x, y, width, height) end

--[[
	Override this method to customize the drawing of horizontal dividers. This function will only be called if the horizontal divider height is greater than zero (0) and at least one divider has been added.

	https://sdk.play.date/inside-playdate/#m-gridview.drawHorizontalDivider
]]
---@param x integer
---@param y integer
---@param width integer
---@param height integer
function playdate.ui.gridview:drawHorizontalDivider(x, y, width, height) end

--[[
	Draws the gridview in the specified rect. Ideally this should be called on every playdate.update() to accommodate scrolling.

	https://sdk.play.date/inside-playdate/#m-gridview.drawInRect
]]
---@param x integer
---@param y integer
---@param width integer
---@param height integer
function playdate.ui.gridview:drawInRect(x, y, width, height) end

--[[
	Sets the number of sections in the grid view. Each section contains at least one row, and row numbering starts at 1 in each section.

	https://sdk.play.date/inside-playdate/#m-gridview.setNumberOfSections
]]
---@param num integer
function playdate.ui.gridview:setNumberOfSections(num) end

--[[
	Gets the number of sections in the grid view.

	https://sdk.play.date/inside-playdate/#m-gridview.getNumberOfSections
]]
---@return integer
function playdate.ui.gridview:getNumberOfSections() end

--[[
	Sets the number of rows in section.

	https://sdk.play.date/inside-playdate/#m-gridview.setNumberOfRowsInSection
]]
---@param section integer
---@param num integer
function playdate.ui.gridview:setNumberOfRowsInSection(section, num) end

--[[
	Gets the number of rows in section.

	https://sdk.play.date/inside-playdate/#m-gridview.getNumberOfRowsInSection
]]
---@param section integer
---@return integer
function playdate.ui.gridview:getNumberOfRowsInSection(section) end

--[[
	Sets the number of columns in the gridview. 1 by default.

	https://sdk.play.date/inside-playdate/#m-gridview.setNumberOfColumns
]]
---@param num integer
function playdate.ui.gridview:setNumberOfColumns(num) end

--[[
	Gets the number of columns in the gridview. 1 by default.

	https://sdk.play.date/inside-playdate/#m-gridview.getNumberOfColumns
]]
---@return integer
function playdate.ui.gridview:getNumberOfColumns() end

--[[
	Convenience method for list-style gridviews, or for setting the number of rows for multiple sections at a time. Pass in a list of numbers of rows for sections starting from section 1.

	https://sdk.play.date/inside-playdate/#m-gridview.setNumberOfRows
]]
---@param ... number
function playdate.ui.gridview:setNumberOfRows(...) end

--[[
	Sets the size of the cells in the gridview. If cells should span the entire width of the grid (as in a list view), pass zero (0) for cellWidth.

	https://sdk.play.date/inside-playdate/#m-gridview.setCellSize
]]
---@param cellWidth number
---@param cellHeight number
function playdate.ui.gridview:setCellSize(cellWidth, cellHeight) end

--[[
	Sets the amount of padding around cells.

	https://sdk.play.date/inside-playdate/#m-gridview.setCellPadding
]]
---@param left number
---@param right number
---@param top number
---@param bottom number
function playdate.ui.gridview:setCellPadding(left, right, top, bottom) end

--[[
	Sets the amount of space the content is inset from the edges of the gridview. Useful if a background image is being used as a border.

	https://sdk.play.date/inside-playdate/#m-gridview.setContentInset
]]
---@param left number
---@param right number
---@param top number
---@param bottom number
function playdate.ui.gridview:setContentInset(left, right, top, bottom) end

--[[
	Returns multiple values (x, y, width, height) representing the bounds of the cell, not including padding, relative to the top-right corner of the grid view.

	If the grid view is configured with zero width cells (see playdate.ui.gridview:new), gridWidth is required, and should be the same value you would pass to playdate.ui.gridview:drawInRect.

	https://sdk.play.date/inside-playdate/#m-gridView.getCellBounds
]]
---@param section integer
---@param row integer
---@param column integer
---@param gridWidth? number
---@return number x, number y, number width, number height
function playdate.ui.gridview:getCellBounds(section, row, column, gridWidth) end

--[[
	Sets the height of the section headers. 0 by default, which causes section headers not to be drawn.

	https://sdk.play.date/inside-playdate/#m-gridview.setSectionHeaderHeight
]]
---@param height integer
function playdate.ui.gridview:setSectionHeaderHeight(height) end

--[[
	Gets the height of the section headers. 0 by default, which causes section headers not to be drawn.

	https://sdk.play.date/inside-playdate/#m-gridview.getSectionHeaderHeight
]]
---@return integer
function playdate.ui.gridview.getSectionHeaderHeight() end

--[[
	Sets the amount of padding around section headers.

	https://sdk.play.date/inside-playdate/#m-gridview.setSectionHeaderPadding
]]
---@param left number
---@param right number
---@param top number
---@param bottom number
function playdate.ui.gridview:setSectionHeaderPadding(left, right, top, bottom) end

--[[
	Sets the height of the horizontal dividers. The default height is half the cell height specified when creating the grid view.

	https://sdk.play.date/inside-playdate/#m-gridview.setHorizontalDividerHeight
]]
---@param height number
function playdate.ui.gridview:setHorizontalDividerHeight(height) end

--[[
	Gets the height of the horizontal dividers. The default height is half the cell height specified when creating the grid view.

	https://sdk.play.date/inside-playdate/#m-gridview.getHorizontalDividerHeight
]]
---@return number
function playdate.ui.gridview:getHorizontalDividerHeight() end

--[[
	Causes a horizontal divider to be drawn above the specified row. Drawing can be customized by overriding playdate.ui.gridview:drawHorizontalDivider.

	https://sdk.play.date/inside-playdate/#m-gridview.addHorizontalDividerAbove
]]
---@param section integer
---@param row integer
function playdate.ui.gridview:addHorizontalDividerAbove(section, row) end

--[[
	Removes all horizontal dividers from the grid view.

	https://sdk.play.date/inside-playdate/#m-gridview.removeHorizontalDividers
]]
function playdate.ui.gridview:removeHorizontalDividers() end

--[[
	Controls the duration of scroll animations. 250ms by default.

	https://sdk.play.date/inside-playdate/#m-gridview.setScrollDuration
]]
---@param ms integer
function playdate.ui.gridview:setScrollDuration(ms) end

--[[
	'set' scrolls to the coordinate x, y.

	If animated is true (or not provided) the new scroll position is animated to using playdate.ui.gridview.scrollEasingFunction and the value set in playdate.ui.gridview:setScrollDuration().
]]
---@param x number
---@param y number
---@param animated? boolean
function playdate.ui.gridview:setScrollPosition(x, y, animated) end

--[[
	Returns the current scroll location x, y.

	https://sdk.play.date/inside-playdate/#m-gridview.getScrollPosition
]]
---@return number x, number y
function playdate.ui.gridview:getScrollPosition() end

--[[
	Scrolls to the specified cell, just enough so the cell is visible.

	https://sdk.play.date/inside-playdate/#m-gridview.scrollToCell
]]
---@param section integer
---@param row integer
---@param column integer
---@param animated? boolean
function playdate.ui.gridview:scrollToCell(section, row, column, animated) end

--[[
	Scrolls to the specified cell, so the cell is centered in the gridview, if possible.

	https://sdk.play.date/inside-playdate/#m-gridview.scrollCellToCenter
]]
---@param section integer
---@param row integer
---@param column integer
---@param animated? boolean
function playdate.ui.gridview:scrollCellToCenter(section, row, column, animated) end

--[[
	Convenience function for list-style gridviews. Scrolls to the specified row in the list.

	https://sdk.play.date/inside-playdate/#m-gridview.scrollToRow
]]
---@param row integer
---@param animated? boolean
function playdate.ui.gridview:scrollToRow(row, animated) end

--[[
	Scrolls to the top of the gridview.

	https://sdk.play.date/inside-playdate/#m-gridview.scrollToTop
]]
---@param animated? boolean
function playdate.ui.gridview:scrollToTop(animated) end

--[[
	Selects the cell at the given position.

	https://sdk.play.date/inside-playdate/#m-gridview.setSelection
]]
---@param section integer
---@param row integer
---@param column integer
function playdate.ui.gridview:setSelection(section, row, column) end

--[[
	Returns the currently-selected cell as section, row, column

	https://sdk.play.date/inside-playdate/#m-gridview.getSelection
]]
---@return integer section, integer row, integer column
function playdate.ui.gridview:getSelection() end

--[[
	Convenience method for list-style gridviews. Selects the cell at row in section 1.

	https://sdk.play.date/inside-playdate/#m-gridview.setSelectedRow
]]
---@param row integer
function playdate.ui.gridview:setSelectedRow(row) end

--[[
	Convenience method for list-style gridviews. Returns the selected cell at row in section 1.

	https://sdk.play.date/inside-playdate/#m-gridview.getSelectedRow
]]
---@return integer
function playdate.ui.gridview:getSelectedRow() end

--[[
	Selects the cell directly below the currently-selected cell.

	If wrapSelection is true, the selection will wrap around to the opposite end of the grid. If scrollToSelection is true (or not provided), the newly-selected cell will be scrolled to. If animate is true (or not provided), the scroll will be animated.

	https://sdk.play.date/inside-playdate/#m-gridview.selectNextRow
]]
---@param wrapSelection boolean
---@param scrollToSelection boolean
---@param animate boolean
---@overload fun(wrapSelection: boolean)
function playdate.ui.gridview:selectNextRow(wrapSelection, scrollToSelection, animate) end

--[[
	Selects the cell directly above the currently-selected cell.

	If wrapSelection is true, the selection will wrap around to the opposite end of the grid. If scrollToSelection is true (or not provided), the newly-selected cell will be scrolled to. If animate is true (or not provided), the scroll will be animated.

	https://sdk.play.date/inside-playdate/#m-gridview.selectPreviousRow
]]
---@param wrapSelection boolean
---@param scrollToSelection boolean
---@param animate boolean
---@overload fun(wrapSelection: boolean)
function playdate.ui.gridview:selectPreviousRow(wrapSelection, scrollToSelection, animate) end

--[[
	Selects the cell directly to the right of the currently-selected cell.

	If the last column is currently selected and wrapSelection is true, the selection will wrap around to the opposite side of the grid. If a wrap occurs and the gridview’s changeRowOnColumnWrap is true the row will also be advanced or moved back.

	If scrollToSelection is true (or not provided), the newly-selected cell will be scrolled to. If animate is true (or not provided), the scroll will be animated.

	https://sdk.play.date/inside-playdate/#m-gridview.selectNextColumn
]]
---@param wrapSelection boolean
---@param scrollToSelection boolean
---@param animate boolean
---@overload fun(wrapSelection: boolean)
function playdate.ui.gridview:selectNextColumn(wrapSelection, scrollToSelection, animate) end

--[[
	Selects the cell directly to the left of the currently-selected cell.

	If the first column is currently selected and wrapSelection is true, the selection will wrap around to the opposite side of the grid. If a wrap occurs and the gridview’s changeRowOnColumnWrap is true the row will also be advanced or moved back.

	If scrollToSelection is true (or not provided), the newly-selected cell will be scrolled to. If animate is true (or not provided), the scroll will be animated.

	https://sdk.play.date/inside-playdate/#m-gridview.selectPreviousColumn
]]
---@param wrapSelection boolean
---@param scrollToSelection boolean
---@param animate boolean
---@overload fun(wrapSelection: boolean)
function playdate.ui.gridview:selectPreviousColumn(wrapSelection, scrollToSelection, animate) end
