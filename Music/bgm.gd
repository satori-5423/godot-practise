extends AudioStreamPlayer


func _physics_process(_delta: float) -> void:
	if Global.has_music:
		self.set_stream_paused(false)
	else:
		self.set_stream_paused(true)
