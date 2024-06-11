extends Sprite2D


func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		self.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		self.flip_h = true
