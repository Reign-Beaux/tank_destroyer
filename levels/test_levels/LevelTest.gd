extends Node2D

#func _ready() -> void:
func _physics_process(delta: float) -> void:
	var player: KinematicBody2D = get_node("TankTest")
	for enemy in get_node("Enemies").get_children():
		enemy.player_focus(player.global_position)
