extends Button


func _ready() -> void:
	var window_size := get_viewport().get_visible_rect().size
	var label_size := self.get_size()
	self.set_position(Vector2((window_size.x - label_size.x) / 2.0, window_size.y / 1.65))


func _physics_process(delta: float) -> void:
	self.set_text(Global.language[Global.game_language]["main"]["exit"])


func _on_pressed() -> void:
	get_tree().quit()
