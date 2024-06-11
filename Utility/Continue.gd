extends Button


func _ready() -> void:
	var window_size := get_viewport().get_visible_rect().size
	var button_size := self.get_size()
	self.set_position(Vector2((window_size.x - button_size.x) / 2.0, window_size.y / 3.0))


func _physics_process(delta: float) -> void:
	self.set_text(Global.language[Global.game_language]["pause"]["continue"])


func _on_pressed() -> void:
	self.get_parent().get_parent().set_visible(false)
	get_tree().paused = false
