extends Area2D

@onready var gameState = get_node("../GameState")
@export var dañoCharco = 2


func _on_body_entered(body: Node2D) -> void:
	if body.name == gameState.pjcaja.name:
		$Timer.start()
		pass
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	gameState.humedad += dañoCharco
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	if body.name == gameState.pjcaja.name:
		$Timer.stop()
		pass
