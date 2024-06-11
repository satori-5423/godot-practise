extends Node2D

const y_down := -200
var pause_tscn: Node
var player_instance: Node


func _ready() -> void:
	set_pause_tscn()
	set_character()


func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		pause_tscn.set_visible(true)
		get_tree().paused = true


func set_pause_tscn() -> void:
	pause_tscn = preload("res://Utility/texture_rect.tscn").instantiate()
	# add_sibling(pause_tscn)
	add_sibling.call_deferred(pause_tscn)
	pause_tscn.process_mode = Node.PROCESS_MODE_ALWAYS
	pause_tscn.set_visible(false)


func set_character() -> void:
	var player_scene: Resource
	match Global.character:
		"Blue": player_scene = preload("res://Players/blue_player.tscn")
		"Green": player_scene = preload("res://Players/green_player.tscn")
		"Grey": player_scene = preload("res://Players/grey_player.tscn")
		_: player_scene = preload("res://Players/red_player.tscn")
	player_instance = player_scene.instantiate()
	# add_sibling(player_instance)
	add_sibling.call_deferred(player_instance)
	player_instance.position = Global.position
	player_instance.add_child(creat_camera())


func creat_camera() -> Camera2D:
	var camera := Camera2D.new()
	camera.limit_top = -y_down
	camera.limit_bottom = 900 - y_down
	camera.limit_left = 0
	camera.limit_right = 2304
	camera.offset.y = y_down
	camera.position_smoothing_enabled = true
	camera.position_smoothing_speed = 10.0
	return camera
