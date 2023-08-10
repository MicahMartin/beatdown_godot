extends Control

@onready var playButton = $MenuItemContainer/MarginContainer/arcade
@onready var photo = $optionPhoto
@onready var menuChangeSound = preload("res://sound/ui/dj-scratch-sound-effect_C_minor.wav")
@onready var menuSelectSound = "res://sound/ui/dj-scratch-brake-quick_C_minor.wav"

# Called when the node enters the scene tree for the first time.
func _ready():
	playButton.grab_focus()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_arcade_focus_entered():
	var myText : Texture2D = preload("res://art/UI/ninja_girl_color.png")
	photo.set_texture(myText)
	
	pass # Replace with function body.

func _on_arcade_focus_exited():
	$AudioStreamPlayer2D.stream = menuChangeSound
	$AudioStreamPlayer2D.play()
	pass # Replace with function body.


func _on_story_focus_entered():
	var myText : Texture2D = preload("res://art/UI/eli.png")
	photo.set_texture(myText)
	pass # Replace with function body.
func _on_story_focus_exited():
	$AudioStreamPlayer2D.stream = menuChangeSound
	$AudioStreamPlayer2D.play()
	pass


func _on_versus_focus_entered():
	var myText : Texture2D = preload("res://art/UI/gideon_trans.png")
	photo.set_texture(myText)
	pass # Replace with function body.
func _on_versus_focus_exited():
	if(is_inside_tree()):
		$AudioStreamPlayer2D.stream = menuChangeSound
		$AudioStreamPlayer2D.play()
	pass

func _on_network_focus_entered():
	var myText : Texture2D = preload("res://art/UI/jonothong.png")
	photo.set_texture(myText)
	pass # Replace with function body.

func _on_network_focus_exited():
	if(is_inside_tree()):
		$AudioStreamPlayer2D.stream = menuChangeSound
		$AudioStreamPlayer2D.play()
	pass


func _on_training_focus_entered():
	var myText : Texture2D = preload("res://art/UI/baby_haiti_frfr.png")
	photo.set_texture(myText)
	pass # Replace with function body.

func _on_training_focus_exited():
	if(is_inside_tree()):
		$AudioStreamPlayer2D.stream = menuChangeSound
		$AudioStreamPlayer2D.play()
	pass

func _on_mission_focus_entered():
	var myText : Texture2D = preload("res://art/UI/thikiyana.png")
	photo.set_texture(myText)
	pass # Replace with function body.
	
func _on_mission_focus_exited():
	$AudioStreamPlayer2D.stream = menuChangeSound
	$AudioStreamPlayer2D.play()
	pass


func _on_gallery_focus_entered():
	var myText : Texture2D = preload("res://art/UI/logo_trans.png")
	photo.set_texture(myText)
	pass # Replace with function body.
	
func _on_gallery_focus_exited():
	$AudioStreamPlayer2D.stream = menuChangeSound
	$AudioStreamPlayer2D.play()
	pass


func _on_options_focus_entered():
	var myText : Texture2D = preload("res://art/UI/angry_eli_trans.png")
	photo.set_texture(myText)
	pass # Replace with function body.
func _on_options_focus_exited():
	$AudioStreamPlayer2D.stream = menuChangeSound
	$AudioStreamPlayer2D.play()
	pass


func _on_store_focus_entered():
	var myText : Texture2D = preload("res://art/UI/logo_trans.png")
	photo.set_texture(myText)
	pass # Replace with function body.

func _on_store_focus_exited():
	$AudioStreamPlayer2D.stream = menuChangeSound
	$AudioStreamPlayer2D.play()
	pass

func _on_title_focus_entered():
	var myText : Texture2D = preload("res://art/UI/logo_trans.png")
	photo.set_texture(myText)
	pass # Replace with function body.
	
func _on_title_focus_exited():
	$AudioStreamPlayer2D.stream = menuChangeSound
	$AudioStreamPlayer2D.play()
	pass


func _on_versus_pressed():
	AudioStreamManager.play(menuSelectSound)
	GameManager.setPlayerName(0, "alucard")
	GameManager.setPlayerName(1, "alucard")
	get_tree().change_scene_to_file("res://main.tscn")
	pass # Replace with function body.

func _on_network_pressed():
	AudioStreamManager.play(menuSelectSound)
	GameManager.setPlayerName(0, "alucard")
	GameManager.setPlayerName(1, "alucard")
	get_tree().change_scene_to_file("res://menu.tscn")
	pass # Replace with function body.

func _on_training_pressed():
	AudioStreamManager.play(menuSelectSound)
	GameManager.setPlayerName(0, "alucard")
	GameManager.setPlayerName(1, "alucard")
	get_tree().change_scene_to_file("res://main.tscn")
	pass # Replace with function body.


