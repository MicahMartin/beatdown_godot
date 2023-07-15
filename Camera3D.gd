extends Camera3D

@export var center_offset : Vector2 = Vector2(0, 3.0)
@export_range(0.1, 1.0) var move_speed : float = 0.5
@export_range(0.1, 0.4) var smoothing : float = 0.3

var initial_distance : = 0.0
var initial_proportion : = 0.0
var viewport_rect : Rect2

@onready var players = [
	get_node("/root/Main/char1"),
	get_node("/root/Main/char2")
]
func _ready() -> void:
	viewport_rect = get_viewport().get_visible_rect()


func _process(_delta: float) -> void:
	position = calculate_position(calculate_targets_rect(), calculate_unprojected_rect())


func calculate_unprojected_rect() -> Rect2:
	var rect : = Rect2(unproject_position(players[0].position), Vector2())
	rect = rect.expand(unproject_position(players[1].position))
	return rect


func calculate_targets_rect() -> Rect2:
	var rect : = Rect2(vec3_to_vec2(players[0].position), Vector2())
	rect = rect.expand(vec3_to_vec2(players[1].position))
	return rect


func vec3_to_vec2(vector: Vector3) -> Vector2:
	return Vector2(vector.x, vector.y)


func calculate_center(rect: Rect2) -> Vector2:
	return Vector2(rect.position.x + rect.size.x / 2, rect.position.y + rect.size.y / 2)


func calculate_position(rect: Rect2, unprojected_rect: Rect2) -> Vector3:
	var center : = calculate_center(rect)
	
	
#	if initial_proportion == 0 or initial_distance == 0:
#		initial_proportion = unprojected_rect.size.x / viewport_rect.size.x
#		initial_distance = position.distance_to(players[0].position)
#
#	var z_position = position.z
#	if unprojected_rect.size.x / viewport_rect.size.x > initial_proportion:
#		z_position = position.z + move_speed
#	elif unprojected_rect.size.x / viewport_rect.size.x < initial_proportion and z_position > initial_distance:
#		z_position = position.z - move_speed
	
	return Vector3(center.x + center_offset.x, center.y + center_offset.y, position.z)
