extends ActorBase

var current_direction: = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var direction: = get_direction()
	move_tank(direction)
	if Input.is_action_just_pressed("shoot"):
		action_shoot(direction)
	
func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	
func move_tank(direction: Vector2) -> void:
	sprite_position(direction)
	_velocity = calculate_move_velocity(_velocity, direction, speed)
	_velocity = move_and_slide(_velocity)

func sprite_position(direction: Vector2) -> void:
	if not (direction.x == 0.0 and direction.y == 0.0):
		current_direction = direction
		rotation = direction.angle()

func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2
	) -> Vector2:
	var out = linear_velocity
	out.x = speed.x * direction.x
	out.y = speed.y * direction.y
	return out

func action_shoot(direction: Vector2) -> void:
	var new_base_bullet = BASE_BULLET.instance()
	new_base_bullet.global_position = get_node("BulletSpawn").global_position
	new_base_bullet._direction = current_direction
	get_parent().add_child(new_base_bullet)
