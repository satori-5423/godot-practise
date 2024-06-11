extends Button


func _ready() -> void:
	var window_size := get_viewport().get_visible_rect().size
	var button_size := self.get_size()
	self.set_position(Vector2((window_size.x - button_size.x) / 2.0, window_size.y / 5.75))


func _physics_process(delta: float) -> void:
	self.set_text(Global.language[Global.game_language]["main"]["play"])


func _on_pressed() -> void:
	get_tree().change_scene_to_file(Global.level.replace("*", str(Global.level_no)))
