extends Button


func _on_pressed() -> void:
	Global.character = "Blue"
	get_tree().change_scene_to_file("res://Utility/option_page.tscn")
