extends BulletAttrbs

func _physics_process(delta: float) -> void:
	sprite_position(_direction)
	_velocity = calculate_move_velocity(_velocity, _direction, speed)
	_velocity = move_and_slide(_velocity)

func sprite_position(direction: Vector2) -> void:
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
