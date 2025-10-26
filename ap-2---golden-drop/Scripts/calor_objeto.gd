extends Area2D

@onready var pjcaja = get_node("../../PJCaja")
@onready var gamestate = get_node("../../GameState")

var enRango = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == pjcaja.name:
		enRango = true
		$HealTimer.start()
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	if body.name == pjcaja.name:
		enRango = false
		$HealTimer.stop()
	pass # Replace with function body.


func _on_heal_timer_timeout() -> void:
	gamestate.vida += 1
	pass # Replace with function body.
