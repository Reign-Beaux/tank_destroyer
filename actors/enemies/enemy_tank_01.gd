extends ActorBase

var player_direction: = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var direction = player_direction.normalized()
	sprite_position(direction)
	_velocity = calculate_move_velocity(_velocity, direction, speed)
	_velocity = move_and_slide(_velocity)
#	global_rotation = atan2(vec_to_player.y, vec_to_player.x)
#	move_and_collide(vec_to_player * MOVE_SPEED * delta)
	pass

func sprite_position(direction: Vector2) -> void:
	if not (direction.x == 0.0 and direction.y == 0.0):
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
	
func player_focus(player_global_position: Vector2) -> void:
	player_direction = player_global_position - global_position