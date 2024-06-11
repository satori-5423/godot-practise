extends CharacterBody2D


const SPEED = 20.0
const MAX_SPEED = 300.0
const MAX_DOWN = 800.0
const JUMP_VELOCITY = -650.0


var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var friction := 600.0
var is_fall := true
var is_dead := false
var is_jumped := false


func _ready() -> void:
	get_node("Area2D").body_entered.connect(_on_body_entered)


func _on_body_entered(body: PhysicsBody2D) -> void:
	if body is StaticBody2D and body.get_name().begins_with("Cier"):
		velocity.x = -MAX_DOWN
		velocity.y = JUMP_VELOCITY / 1.2
		is_dead = true
		move_and_slide()
	elif body is StaticBody2D and body.get_name().begins_with("Jumper"):
		velocity.y = -MAX_DOWN
		move_and_slide()
	elif body is StaticBody2D and body.get_name().begins_with("Door"):
		Global.level_no += 1
		match  Global.level_no:
			1:
				self.queue_free()
				get_tree().change_scene_to_file("res://End.tscn")
				return
		self.queue_free()
		get_tree().change_scene_to_file(Global.level.replace("*", str(Global.level_no)))


func _physics_process(delta: float) -> void:
	set_character_action()
	set_friction_and_gravity(delta)
	move_and_slide()


func move_character() -> void:
	if Input.is_action_pressed("ui_accept") or Input.is_action_pressed("ui_up"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY / 1.36
			is_jumped = true
		elif is_jumped and (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_up")):
			velocity.y = JUMP_VELOCITY / 1.36
			is_jumped = false
	velocity.x += (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) * SPEED


func set_character_action() -> void:
	if velocity.y < 0:
		$AnimatedSprite2D.play("jump")
		is_fall = true
	if velocity.y > 0 and (is_fall or not is_on_floor()):
		$AnimatedSprite2D.play("fall")
	if is_on_floor():
		if is_fall:
			$AnimatedSprite2D.play("stand")
			is_fall = false
		if Input.is_action_pressed("ui_right"):
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("walk")
		elif Input.is_action_pressed("ui_left"):
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("walk")
	if Input.is_action_pressed("ui_down") and is_on_floor():
		$AnimatedSprite2D.play("duck")
	if not has_action() and is_on_floor():
		$AnimatedSprite2D.stop()
	if is_dead:
		if is_on_floor():
			is_dead = false
		else:
			$AnimatedSprite2D.play("dead")
	else:
		move_character()


func set_friction_and_gravity(delta: float) -> void:
	velocity.x = clamp(velocity.x, -MAX_SPEED, MAX_SPEED)
	if is_on_floor():
		velocity.x = maxf(0, velocity.x - friction * delta) if velocity.x > 0 else minf(0, velocity.x + friction * delta)
	else:
		velocity = Vector2(
			maxf(0, velocity.x - friction / 10.0 * delta) if velocity.x > 0 else minf(0, velocity.x + friction / 10.0 * delta),
			minf(velocity.y + gravity * delta, MAX_DOWN)
		)


func has_action() -> bool:
	return Input.is_action_pressed("ui_accept") \
		or Input.is_action_pressed("ui_up")     \
		or Input.is_action_pressed("ui_down")   \
		or Input.is_action_pressed("ui_right")  \
		or Input.is_action_pressed("ui_left")

