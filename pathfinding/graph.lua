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
	An implementation of the popular A* pathfinding algorithm. To find a path first create a playdate.pathfinder.graph containing connected playdate.pathfinder.nodes then call findPath on the graph. A heuristic function callback can be specified for determining an estimate of the distance between two nodes, otherwise the manhattan distance between nodes will be used. In that case it is important to set appropriate x and y values on the nodes.

	https://sdk.play.date/inside-playdate/#M-pathfinder
]]
---@class playdate.pathfinder.graph : Object
playdate.pathfinder.graph = {}

--[[
	Returns a new empty playdate.pathfinder.graph object.

	If nodeCount is supplied, that number of nodes will be allocated and added to the graph. Their IDs will be set from 1 to nodeCount.

	coordinates, if supplied, should be a table containing tables of x, y values, indexed by node IDs. For example, {{10, 10}, {50, 30}, {20, 100}, {100, 120}, {160, 130}}.

	https://sdk.play.date/inside-playdate/#f-pathfinder.graph.new
]]
---@param nodeCount? integer
---@param coordinates? integer[][]
---@return playdate.pathfinder.graph
function playdate.pathfinder.graph.new(nodeCount, coordinates) end

--[[
	Convenience function that returns a new playdate.pathfinder.graph object containing nodes for for each grid position, even if not connected to any other nodes. This allows for easier graph modification once the graph is generated. Weights for connections between nodes are set to 10 for horizontal and vertical connections and 14 for diagonal connections (if included), as this tends to produce nicer paths than using uniform weights. Nodes have their indexes set from 1 to width * height, and have their x, y values set appropriately for the node’s position.

	https://sdk.play.date/inside-playdate/#f-pathfinder.graph.new2DGrid
]]
---@param width integer The width of the grid to be created.
---@param height integer The height of the grid to be created.
---@param allowDiagonals? boolean If true, diagonal connections will also be created.
---@param includedNodes? (0|1)[] A one-dimensional array of length width * height. Each entry should be a 1 or a 0 to indicate nodes that should be connected to their neighbors and nodes that should not have any connections added. If not provided, all nodes will be connected to their neighbors.
---@return playdate.pathfinder.graph
function playdate.pathfinder.graph.new2DGrid(width, height, allowDiagonals, includedNodes) end

--[[
	Creates a new playdate.pathfinder.node and adds it to the graph.

	https://sdk.play.date/inside-playdate/#m-pathfinder.graph.addNewNode
]]
---@param id integer id value for the new node.
---@param x integer Optional x value for the node
---@param y integer Optional y value for the node
---@param connectedNodes integer[] Array of existing nodes to create connections to from the new node
---@param weights number[] Array of weights for the new connections. Array must be the same length as connectedNodes. Weights affect the path the A* algorithm will solve for. A longer, lighter-weighted path will be chosen over a shorter heavier path, if available.
---@param addReciprocalConnections boolean If true, connections will also be added in the reverse direction for each node.
---@overload fun(id: integer)
---@overload fun(id: integer, x: integer, y: integer)
function playdate.pathfinder.graph:addNewNode(id, x, y, connectedNodes, weights, addReciprocalConnections) end

--[[
	Creates count new nodes, adding them to the graph, and returns them in an array-style table. The new node’s id_s will be assigned values 1 through _count-1.

	This method is useful to improve performance if many nodes need to be allocated at once rather than one at a time, for example when creating a new graph.

	https://sdk.play.date/inside-playdate/#m-pathfinder.graph.addNewNodes
]]
---@param count integer
---@return playdate.pathfinder.node[]
function playdate.pathfinder.graph:addNewNodes(count) end

--[[
	Adds an already-existing node to the graph. The node must have originally belonged to the same graph.

	https://sdk.play.date/inside-playdate/#m-pathfinder.graph.addNode
]]
---@param node playdate.pathfinder.node Node to be added to the graph.
---@param connectedNodes playdate.pathfinder.node[] Array of existing nodes to create connections to from the new node.
---@param weights number[] Array of weights for the new connections. Array must be the same length as connectedNodes. Weights affect the path the A* algorithm will solve for. A longer, lighter-weighted path will be chosen over a shorter heavier path, if available.
---@param addReciprocalConnections boolean If true, connections will also be added in the reverse direction for each connection added.
---@overload fun(node: playdate.pathfinder.node)
function playdate.pathfinder.graph:addNode(node, connectedNodes, weights, addReciprocalConnections) end

--[[
	Adds an array of already-existing nodes to the graph.

	https://sdk.play.date/inside-playdate/#m-pathfinder.graph.addNodes
]]
---@param nodes playdate.pathfinder.node[]
function playdate.pathfinder.graph:addNodes(nodes) end

--[[
	Returns an array containing all nodes in the graph.

	https://sdk.play.date/inside-playdate/#m-pathfinder.graph.allNodes
]]
---@return playdate.pathfinder.node[]
function playdate.pathfinder.graph:allNodes() end

--[[
	Removes node from the graph. Also removes all connections to and from the node.

	https://sdk.play.date/inside-playdate/#m-pathfinder.graph.removeNode
]]
---@param node playdate.pathfinder.node
function playdate.pathfinder.graph:removeNode(node) end

--[[
	Returns the first node found with coordinates matching x, y, after removing it from the graph and removing all connections to and from the node.

	https://sdk.play.date/inside-playdate/#m-pathfinder.graph.removeNodeWithXY
]]
---@param x integer
---@param y integer
---@return playdate.pathfinder.node|nil
function playdate.pathfinder.graph:removeNodeWithXY(x, y) end

--[[
	Returns the first node found with a matching id, after removing it from the graph and removing all connections to and from the node.

	https://sdk.play.date/inside-playdate/#m-pathfinder.graph.removeNodeWithID
]]
---@param id integer
---@return playdate.pathfinder.node|nil
function playdate.pathfinder.graph:removeNodeWithID(id) end

--[[
	Returns the first node found in the graph with a matching id, or nil if no such node is found.

	https://sdk.play.date/inside-playdate/#m-pathfinder.graph.nodeWithID
]]
---@param id integer
---@return playdate.pathfinder.node|nil
function playdate.pathfinder.graph:nodeWithID(id) end

--[[
	Returns the first node found in the graph with matching x and y values, or nil if no such node is found.

	https://sdk.play.date/inside-playdate/#m-pathfinder.graph.nodeWithXY
]]
---@param x integer
---@param y integer
---@return playdate.pathfinder.node|nil
function playdate.pathfinder.graph:nodeWithXY(x, y) end

--[[
	connections should be a table of array-style tables. The keys of the outer table should correspond to node IDs, while the inner array should be a series if connecting node ID and weight combinations that will be assigned to that node. For example, {[1]={2, 10, 3, 12}, [2]={1, 20}, [3]={1, 20, 2, 10}} will create a connection from node ID 1 to node ID 2 with a weight of 10, and a connection to node ID 3 with a weight of 12, and so on for the other entries.

	https://sdk.play.date/inside-playdate/#m-playdate.pathfinder.graph.addConnections
]]
---@param connections {[integer]: integer[]}
function playdate.pathfinder.graph:addConnections(connections) end

--[[
	Adds a connection from the node with id fromNodeID to the node with id toNodeID with a weight value of weight. Weights affect the path the A* algorithm will solve for. A longer, lighter-weighted path will be chosen over a shorter heavier path, if available. If addReciprocalConnection is true, the reverse connection will also be added.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#m-playdate.pathfinder.graph.addConnectionToNodeWithID
]]
---@param fromNodeID integer
---@param toNodeID integer
---@param weight number
---@param addReciprocalConnection boolean
function playdate.pathfinder.graph:addConnectionToNodeWithID(fromNodeID, toNodeID, weight, addReciprocalConnection) end

--[[
	Removes all connections from all nodes in the graph.

	https://sdk.play.date/inside-playdate/#m-playdate.pathfinder.graph.removeAllConnections
]]
function playdate.pathfinder.graph:removeAllConnections() end

--[[
	Removes all connections from the matching node.

	If removeIncoming is true, all connections from other nodes to the calling node are also removed. False by default. Please note: this can signficantly increase the time this function takes as it requires a full search of the graph - O(1) vs O(n)).

	https://sdk.play.date/inside-playdate/#m-playdate.pathfinder.graph.removeAllConnectionsFromNodeWithID
]]
---@param id integer
---@param removeIncoming? boolean
function playdate.pathfinder.graph:removeAllConnectionsFromNodeWithID(id, removeIncoming) end

--[[
	Returns an array of nodes representing the path from startNode to goalNode, or nil if no path can be found.

	https://sdk.play.date/inside-playdate/#m-pathfinder.graph.findPath
]]
---@param startNode playdate.pathfinder.node
---@param goalNode playdate.pathfinder.node
---@param heuristicFunction? fun(startNode: playdate.pathfinder.node, goalNode: playdate.pathfinder.node): integer If provided, this function should be of the form function(startNode, goalNode) and should return an integer value estimate or underestimate of the distance from startNode to goalNode. If not provided, a manhattan distance function will be used to calculate the estimate. This requires that the x, y values of the nodes in the graph have been set properly.
---@param findPathToGoalAdjacentNodes? boolean If true, a path will be found to any node adjacent to the goal node, based on the x, y values of those nodes and the goal node. This does not rely on connections between adjacent nodes and the goal node, which can be entirely disconnected from the rest of the graph.
---@return playdate.pathfinder.node[]
function playdate.pathfinder.graph:findPath(startNode, goalNode, heuristicFunction, findPathToGoalAdjacentNodes) end

--[[
	Works the same as findPath, but looks up nodes to find a path between using startNodeID and goalNodeID and returns a list of nodeIDs rather than the nodes themselves.

	https://sdk.play.date/inside-playdate/#m-pathfinder.graph.findPathWithIDs
]]
---@param startNodeID integer
---@param goalNodeID integer
---@param heuristicFunction? fun(startNode: playdate.pathfinder.node, goalNode: playdate.pathfinder.node): integer If provided, this function should be of the form function(startNode, goalNode) and should return an integer value estimate or underestimate of the distance from startNode to goalNode. If not provided, a manhattan distance function will be used to calculate the estimate. This requires that the x, y values of the nodes in the graph have been set properly.
---@param findPathToGoalAdjacentNodes? boolean If true, a path will be found to any node adjacent to the goal node, based on the x, y values of those nodes and the goal node. This does not rely on connections between adjacent nodes and the goal node, which can be entirely disconnected from the rest of the graph.
---@return playdate.pathfinder.node[]
function playdate.pathfinder.graph:findPathWithIDs(startNodeID, goalNodeID, heuristicFunction, findPathToGoalAdjacentNodes) end

--[[
	Sets the matching node’s x and y values.

	https://sdk.play.date/inside-playdate/#m-playdate.pathfinder.graph.setXYForNodeWithID
]]
---@param id integer
---@param x integer
---@param y integer
function playdate.pathfinder.graph:setXYForNodeWithID(id, x, y) end
