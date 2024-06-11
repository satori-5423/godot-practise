extends Button


func _ready() -> void:
	var window_size := get_viewport().get_visible_rect().size
	var button_size := self.get_size()
	self.set_position(Vector2((window_size.x - button_size.x) / 1.35, window_size.y / 2.6))


func _on_pressed() -> void:
	Global.game_language = "japanese"
