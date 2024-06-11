extends Node


var count := 3
var curr_level: int

func _ready() -> void:
	curr_level = Global.level_no


func _physics_process(delta: float) -> void:
	if curr_level != Global.level_no:
		curr_level = Global.level_no
		count = 0
