extends Control
@onready var playButton = $MarginContainer/VBoxContainer/VBoxContainer/PlayContainer/Play

func _ready():
	playButton.grab_focus()
	pass
	
func _on_play_pressed():
	GameManager.setPlayerName(0, "alucard")
	GameManager.setPlayerName(1, "alucard")
	GameManager.setNetplay(true)
	get_tree().change_scene_to_file("res://main.tscn")
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
	pass # Replace with function body.


func _on_local_port_text_changed(newText):
	GameManager.setLocalPort(newText)
	pass # Replace with function body.


func _on_remote_ip_text_changed(newText):
	GameManager.setRemoteIp(newText)
	pass # Replace with function body.


func _on_remote_port_text_changed(newText):
	GameManager.setRemotePort(newText)
	pass # Replace with function body.


func _on_net_p_num_text_changed(newText):
	GameManager.setNetPnum(newText)
	pass # Replace with function body.
