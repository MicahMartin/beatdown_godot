extends Node3D

@onready var FGServer = get_node("/root/Main/FightingGameServer")
@onready var pNum = get_meta("pnum")
@onready var hitspark = preload("res://hitspark.tscn").instantiate()
var stateTime
var stateObj
var isActive
var posX
var posY
# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(hitspark)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	stateObj = FGServer.getGameState()
	posX = stateObj["p"+str(pNum)+"HitsparkX"]
	posY = stateObj["p"+str(pNum)+"HitsparkY"]
	stateTime = stateObj["p"+str(pNum)+"HitsparkStatetTime"]
	isActive = stateObj["p"+str(pNum)+"HitsparkActive"]
	
	if(isActive and stateTime == 1):
		hitspark.restart()
		print("EMITTING")
		hitspark.emitting = true
		position.x = posX * 0.00001
		position.y = posY * 0.00001
		
	pass
