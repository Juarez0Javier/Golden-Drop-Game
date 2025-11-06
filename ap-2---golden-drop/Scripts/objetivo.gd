extends Area2D

@onready var gamestate = get_node("../../../GameState")

func _ready() -> void:
	gamestate.meta = self.position;
		
func _on_body_entered(body: Node2D) -> void:
	if body.name == gamestate.pjcaja.name:
		gamestate.ganar()
	pass # Replace with function body.
