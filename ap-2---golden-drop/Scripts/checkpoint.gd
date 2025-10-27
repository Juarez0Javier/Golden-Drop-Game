extends Area2D

@onready var gamestate = get_node("../../../GameState")

func _on_body_entered(body: Node2D) -> void:
	if body.name == gamestate.pjcaja.name:
		gamestate.chekpointUlt = self
		gamestate.collUlti.clear()
	pass # Replace with function body.
