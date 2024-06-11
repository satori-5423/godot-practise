extends Label


func _ready() -> void:
	var window_size := get_viewport().get_visible_rect().size
	var button_size := Vector2(
		(get_node("CheckButton").get_size().x + get_node("CheckButton").get_position().x + self.get_position().x) / 2.0,
		self.get_size().y
	)
	self.set_position(Vector2((window_size.x - button_size.x) / 2.0, window_size.y / 1.8))


func _physics_process(delta: float) -> void:
	self.set_text(Global.language[Global.game_language]["option_page"]["music"])
