extends Node2D


func _ready() -> void:
	get_node("Music/CheckButton").set_pressed(Global.has_music)


func _process(_delta: float) -> void:
	Global.has_music = get_node("Music/CheckButton").is_pressed()
