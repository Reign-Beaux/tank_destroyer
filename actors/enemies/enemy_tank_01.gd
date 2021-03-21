extends ActorBase

var player_direction: = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var direction = player_direction.normalized()
	rotation = direction.angle()
	_velocity = calculate_move_velocity(_velocity, direction, speed)
	_velocity = move_and_slide(_velocity)

func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2
	) -> Vector2:
	var out = linear_velocity
	out.x = speed.x * direction.x
	out.y = speed.y * direction.y
	return out
	
func player_focus(player_global_position: Vector2) -> void:
	player_direction = player_global_position - global_position
