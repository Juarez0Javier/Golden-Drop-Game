extends Area2D

@onready var gamestate = get_node("../../../GameState")
@export var esInicio = false

func _ready() -> void:
	pass
	#if esInicio == true:
		#gamestate.chekpointUlt = self
		#gamestate.inicio = self.position

func _on_body_entered(body: Node2D) -> void:
	if body.name == gamestate.pjcaja.name:
		if gamestate.chekpointUlt != self.position:
			$AudioStreamPlayer2D.play()
			gamestate.chekpointUlt = self.position
			gamestate.collUlti.clear()
	pass # Replace with function body.
