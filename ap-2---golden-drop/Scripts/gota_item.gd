extends Area2D

@onready var pjcaja = get_node("../../../PJCaja")
@onready var gamestate = get_node("../../../GameState")


func _ready() -> void:
	enablePickup()
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.name == pjcaja.name:
		$'AnimationPlayer'.stop()
		$'CollisionShape2D'.set_deferred("disabled",true)
		$'Sprite2D'.visible = false
		gamestate.gotaD = true
	pass # Replace with function body.
	
func enablePickup():
	$'Sprite2D'.visible = true
	$'CollisionShape2D'.set_deferred("disabled",false)
	$'AnimationPlayer'.play("Bob")
