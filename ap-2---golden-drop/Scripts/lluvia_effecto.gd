extends ParallaxBackground

@onready var dmgtimer = get_node("DmgTimer")
@onready var gamestate = get_node ("../GameState")

func _ready():
	$ParallaxLayer/AnimationPlayer.play("Lluvia")
	pass

func _on_timer_timeout() -> void:
	gamestate.vida -= 1
	#print(gamestate.vida)
	pass # Replace with function body.
