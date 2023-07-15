extends Node3D
@onready var FGServer = get_node("/root/Main/FightingGameServer")
@onready var cam = get_node("/root/Main/Camera3D")
# Called when the node enters the scene tree for the first time.
func _ready():
	position.z = 7
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var camPos = cam.get_camera_transform().origin
	var P = cam.unproject_position(position)
	var stateObj = FGServer.getGameState()
	var pNum = get_meta("pnum")
	var faceRight = stateObj["char"+str(pNum)+"FaceRight"]
	var stateNum = stateObj["char"+str(pNum)+"StateNum"]
	var stateTime = stateObj["char"+str(pNum)+"StateTime"]
	position.x = stateObj["char"+str(pNum)+"PosX"] * 0.00001
	position.y = stateObj["char"+str(pNum)+"PosY"] * 0.00001
	if(!faceRight):
		scale.x = -2.5
		rotation.y = -1
	else:
		scale.x = 2.5
		rotation.y = 1
		
	if(stateNum == 1):
		$AnimationPlayer.play("idle1")
	elif(stateNum == 2):
		$AnimationPlayer.play("WalkF")
	elif(stateNum == 3):
		$AnimationPlayer.play("WalkB")
	elif(stateNum == 4):
		$AnimationPlayer.play("idlecrouch")
	elif(stateNum == 5 or stateNum == 6 or stateNum == 7
		or stateNum == 42 or stateNum == 43 or stateNum == 44):
		$AnimationPlayer.play("Hop")
	elif(stateNum == 8):
		$AnimationPlayer.play("Attack7")
	elif(stateNum == 15):
		$AnimationPlayer.play("Attack9")
	elif(stateNum == 20):
		$AnimationPlayer.play("Attack3")
	elif(stateNum == 21):
		$AnimationPlayer.play("Attack2")
	elif(stateNum == 40):
		$AnimationPlayer.play("Attack1")
	elif(stateNum == 9):
		$AnimationPlayer.play("Hurt2")
	elif(stateNum == 29):
		$AnimationPlayer.play("hurt1")
	elif(stateNum == 10):
		$AnimationPlayer.play("Run")

	$AnimationPlayer.seek(float(stateTime/60.0), true)
	pass
