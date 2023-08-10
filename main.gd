extends Node
@onready var FGServer = get_node("FightingGameServer")
var p1charPointX
var p1charPointY
var p2charPointX
var p2charPointY
# Called when the node enters the scene tree for the first time.
func _init():
	set_meta("p1Name", GameManager.getPlayerName(0))
	set_meta("p2Name", GameManager.getPlayerName(1))
	set_meta("netPnum", GameManager.getNetPnum())
	set_meta("isNetPlay", GameManager.getNetPlay())
	set_meta("localPort", GameManager.getLocalPort())
	set_meta("remotePort", GameManager.getRemotePort())
	set_meta("remoteIp", GameManager.getRemoteIp())
	pass
	
func _ready():
	$p1DebugStats.add_property($char1, "stateNum", "")
	$p1DebugStats.add_property($char1, "stateTime", "")
	$p1DebugStats.add_property($char1, "faceRight", "")
	$p1DebugStats.add_property($char1, "currentAnim", "")
	$p1DebugStats.add_property($char1, "animLoops", "")
	$p1DebugStats.add_property($char1, "posX", "")
	$p1DebugStats.add_property($char1, "posY", "")
	
	$p2DebugStats.add_property($char2, "stateNum", "")
	$p2DebugStats.add_property($char2, "stateTime", "")
	$p2DebugStats.add_property($char2, "faceRight", "")
	$p2DebugStats.add_property($char2, "currentAnim", "")
	$p2DebugStats.add_property($char2, "animLoops", "")
	$p2DebugStats.add_property($char2, "posX", "")
	$p2DebugStats.add_property($char2, "posY", "")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	pass
	
func _process(_delta):
	displayCbs()

	pass

func displayCbs():
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
	
	p1charPointX = stateObj["char1PosX"]
	p1charPointY = stateObj["char1PosY"]
	#$impactEffect.showImpact(p1charPointX * scale)
	DebugGeometry.draw_debug_point(0, Vector3(p1charPointX * scale, p1charPointY * scale, 7), .5, Color(0,0,125))
	var p1cbs = stateObj["p1CollisionBoxes"]
	for cb in p1cbs:
		var width = cb["width"]
		var height = cb["height"]
		var posX = cb["posX"]
		var posY = cb["posY"]
		var type = cb["type"]
		var disabled = cb["disabled"]
		if !disabled and (type == 1 or type == 2):
			DebugGeometry.draw_debug_cube(0, Vector3((posX*scale)+(width/2*scale),(posY*scale)+(height/2*scale),7), Vector3(width*scale, height*scale, 0), colors[type])
	
	var p1FireballPosX = stateObj["char1FireballPosX"]
	var p1FireballPosY = stateObj["char1FireballPosY"]
	DebugGeometry.draw_debug_point(0, Vector3(p1FireballPosX * scale, p1FireballPosY * scale, 7), .5, Color(0,0,125))
	var p1FireballBoxes = stateObj["p1FireballBoxes"]
	for cb in p1FireballBoxes:
		var width = cb["width"]
		var height = cb["height"]
		var posX = cb["posX"]
		var posY = cb["posY"]
		var type = cb["type"]
		var disabled = cb["disabled"]
		if !disabled and (type == 1 or type == 2):
			DebugGeometry.draw_debug_cube(0, Vector3((posX*scale)+(width/2*scale),(posY*scale)+(height/2*scale),7), Vector3(width*scale, height*scale, 0), colors[type])
	p2charPointX = stateObj["char2PosX"]
	p2charPointY = stateObj["char2PosY"]
	DebugGeometry.draw_debug_point(0, Vector3(p2charPointX * scale, p2charPointY * scale, 7), .5, Color(0,0,125))
	var p2cbs = stateObj["p2CollisionBoxes"]
	for cb in p2cbs:
		var width = cb["width"]
		var height = cb["height"]
		var posX = cb["posX"]
		var posY = cb["posY"]
		var type = cb["type"]
		var disabled = cb["disabled"]
		if !disabled and (type == 1 or type == 2):
			DebugGeometry.draw_debug_cube(0, Vector3((posX*scale)+(width/2*scale),(posY*scale)+(height/2*scale),7), Vector3(width*scale, height*scale, 0), colors[type])
	pass
