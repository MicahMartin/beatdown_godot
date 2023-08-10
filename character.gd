extends Node3D
@onready var FGServer = get_node("/root/Main/FightingGameServer")
@onready var cam = get_node("/root/Main/Camera3D")
@onready var pNum = get_meta("pnum")
@onready var charModel = "res://characters/" + FGServer.getModelName(pNum - 1)
@onready var character = load(charModel).instantiate()
var anim
var modelScale
var timesLooped
var stateTime
var faceRight
var stateNum
var animLoops
var currentAnim
var stateObj
var posX
var posY

func animGoToFrame(animation, frame, loops):
	var animLength = animation.current_animation_length
	var offsetMult = 0
	var seconds = float(frame/60.0)
	if((loops) and (seconds > animLength) and (animLength != 0)):
		offsetMult = animLength * int(seconds / animLength)
		seconds -= offsetMult
	animation.seek(seconds, true)
	

func _ready():
	position.z = 7
	
	modelScale = FGServer.getModelScale(pNum - 1)
	scale *= modelScale
	
	add_child(character)
	anim = get_child(0).get_node("AnimationPlayer")
	anim.set_process_callback(anim.ANIMATION_PROCESS_MANUAL)
	timesLooped = 0
	pass 


func _process(_delta):
	stateObj = FGServer.getGameState()
	faceRight = stateObj["char"+str(pNum)+"FaceRight"]
	stateNum = stateObj["char"+str(pNum)+"StateNum"]
	stateTime = stateObj["char"+str(pNum)+"StateTime"]
	animLoops = stateObj["char"+str(pNum)+"LoopAnimation"]
	currentAnim = stateObj["char"+str(pNum)+"CurrentAnim"]
	posX = stateObj["char"+str(pNum)+"PosX"]
	posY = stateObj["char"+str(pNum)+"PosY"]
	if(stateTime == 0):
		timesLooped = 0
	
	if (anim.current_animation != currentAnim):
		anim.current_animation = currentAnim
		
	
	position.x = stateObj["char"+str(pNum)+"PosX"] * 0.00001
	position.y = stateObj["char"+str(pNum)+"PosY"] * 0.00001
	if(!faceRight):
		scale.x = -modelScale
		rotation.y = -1
	else:
		scale.x = modelScale
		rotation.y = 1
	if(anim.current_animation):
		animGoToFrame(anim, stateTime, animLoops)
	pass
