extends Node2D


var enterable := false
var locked := true

func _on_body_entered(body: CharacterBody2D) -> void:
	print("ok")
	if locked:
		locked = false
		if Key.count > 0:
			self.set_visible(true)
			Key.count -= 1
