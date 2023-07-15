extends Node
@onready var FGServer = get_node("FightingGameServer")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	pass
	
func _process(_delta):
	var scale = 0.00001
	var stateObj = FGServer.getGameState()
	var colors = [
		Color(255,0,125), 
		Color(0,255,0),
		Color(255,0,0),
		Color(125,125,255), 
		Color(0,0,255), 
		Color(255,255,0), 
		Color(255,125,0)
		]
	
	var p1charPointX = stateObj["char1PosX"]
	var p1charPointY = stateObj["char1PosY"]
	DebugGeometry.draw_debug_point(0, Vector3(p1charPointX * scale, p1charPointY * scale, 7), .5, Color(0,0,125))
	var p1cbs = stateObj["p1CollisionBoxes"]
	for cb in p1cbs:
		var width = cb["width"]
		var height = cb["height"]
		var posX = cb["posX"]
		var posY = cb["posY"]
		var type = cb["type"]
		var disabled = cb["disabled"]
		if !disabled:
			DebugGeometry.draw_debug_cube(0, Vector3((posX*scale)+(width/2*scale),(posY*scale)+(height/2*scale),7), Vector3(width*scale, height*scale, 0), colors[type])
		
	var p2charPointX = stateObj["char2PosX"]
	var p2charPointY = stateObj["char2PosY"]
	DebugGeometry.draw_debug_point(0, Vector3(p2charPointX * scale, p2charPointY * scale, 7), .5, Color(0,0,125))
	var p2cbs = stateObj["p2CollisionBoxes"]
	for cb in p2cbs:
		var width = cb["width"]
		var height = cb["height"]
		var posX = cb["posX"]
		var posY = cb["posY"]
		var type = cb["type"]
		var disabled = cb["disabled"]
		if !disabled:
			DebugGeometry.draw_debug_cube(0, Vector3((posX*scale)+(width/2*scale),(posY*scale)+(height/2*scale),7), Vector3(width*scale, height*scale, 0), colors[type])

	pass
