extends Area2D

@onready var gamestate = get_node("../../../GameState")


func _on_body_entered(body: Node2D) -> void:
	if body.name == gamestate.pjcaja.name:
		gamestate.enRefugio = true
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	if body.name == gamestate.pjcaja.name:
		gamestate.enRefugio = false
	pass # Replace with function body.
