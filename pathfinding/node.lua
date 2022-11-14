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
	https://sdk.play.date/inside-playdate/#C-playdate.pathfinder.node
]]
---@class playdate.pathfinder.node
---@field id integer
---@field x integer
---@field y integer
playdate.pathfinder.node = {}

--[[
	Adds a new connection between nodes.

	https://sdk.play.date/inside-playdate/#m-pathfinder.node.addConnection
]]
---@param node playdate.pathfinder.node The node the new connection will point to.
---@param weight number Weight for the new connection. Weights affect the path the A* algorithm will solve for. A longer, lighter-weighted path will be chosen over a shorter heavier path, if available.
---@param addReciprocalConnection boolean If true, a second connection will be created with the same weight in the opposite direction.
function playdate.pathfinder.node:addConnection(node, weight, addReciprocalConnection) end

--[[
	Adds a new connection to each node in the nodes array.

	https://sdk.play.date/inside-playdate/#m-pathfinder.node.addConnections
]]
---@param nodes playdate.pathfinder.node[] An array of nodes which the new connections will point to.
---@param weights number[] An array of weights for the new connections. Must be of the same length as the nodes array. Weights affect the path the A* algorithm will solve for. A longer, lighter-weighted path will be chosen over a shorter heavier path, if available.
---@param addReciprocalConnections boolean If true, a second connection will be created with the same weight in the opposite direction.
function playdate.pathfinder.node:addConnections(nodes, weights, addReciprocalConnections) end

--[[
	Adds a connection to the first node found with matching x and y values, if it exists.

    https://sdk.play.date/inside-playdate/#m-pathfinder.node.addConnectionToNodeWithXY
]]
---@param x integer
---@param y integer
---@param weight number The weight for the new connection. Weights affect the path the A* algorithm will solve for. A longer, lighter-weighted path will be chosen over a shorter heavier path, if available.
---@param addReciprocalConnection boolean If true, a connection will also be added in the reverse direction, from the node at x, y to the caller.
function playdate.pathfinder.node:addConnectionToNodeWithXY(x, y, weight, addReciprocalConnection) end

--[[
	Returns an array of nodes that have been added as connections to this node.

	https://sdk.play.date/inside-playdate/#m-pathfinder.node.connectedNodes
]]
---@return playdate.pathfinder.node[]
function playdate.pathfinder.node:connectedNodes() end

--[[
	Removes a connection to node, if it exists. If removeReciprocal is true the reverse connection will also be removed, if it exists.

	https://sdk.play.date/inside-playdate/#m-pathfinder.node.removeConnection
]]
---@param node playdate.pathfinder.node
---@param removeReciprocal boolean
function playdate.pathfinder.node:removeConnection(node, removeReciprocal) end

--[[
	Removes all connections from the calling node.

	If removeIncoming is true, all connections from other nodes to the calling node are also removed. False by default. Please note: this can signficantly increase the time this function takes as it requires a full search of the graph - O(1) vs O(n)).

	https://sdk.play.date/inside-playdate/#m-pathfinder.node.removeAllConnections
]]
---@param removeIncoming boolean
function playdate.pathfinder.node:removeAllConnections(removeIncoming) end

--[[
	Sets the x and y values for the node.

	https://sdk.play.date/inside-playdate/#m-pathfinder.node.setXY
]]
---@param x integer
---@param y integer
function playdate.pathfinder.node:setXY(x, y) end
