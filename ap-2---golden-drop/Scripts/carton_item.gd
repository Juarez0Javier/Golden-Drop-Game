extends Area2D

@onready var gamestate = get_node("../../../GameState")

@export var crtVar: Array[Texture]

func _ready() -> void:
	$'Sprite2D'.texture = crtVar.pick_random()
	enablePickup()
	pass



func _on_body_entered(body: Node2D) -> void:
	if body.name == gamestate.pjcaja.name:
		$'AnimationPlayer'.stop()
		$'CollisionShape2D'.set_deferred("disabled",true)
		$'Sprite2D'.visible = false
		$'AudioStreamPlayer2D'.play()
		gamestate.cartones += 1
		gamestate.collUlti.append(self)
	pass # Replace with function body.
	
func enablePickup():
	$'Sprite2D'.visible = true
	$'CollisionShape2D'.set_deferred("disabled",false)
	$'AnimationPlayer'.play("Idle")
