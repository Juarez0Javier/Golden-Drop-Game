extends ParallaxBackground

@onready var gamestate = get_node ("../GameState")

var estadoLluvia = {"Activa": Color(0,1,1,0.5),
					"Apagada": Color(1,1,1,0.15)}
				

func _ready():
	$'ParallaxLayer/AnimationPlayer'.play("Lluvia")
	pass

func _process(delta: float) -> void:
	
	if gamestate.enRefugio:
		##DimTexture
		$'ParallaxLayer/LluviaSprite'.modulate = estadoLluvia["Apagada"]
		pass
	else:
		$'ParallaxLayer/LluviaSprite'.modulate = estadoLluvia["Activa"]
		pass
	
	pass

func _on_timer_timeout() -> void:
	if gamestate.enRefugio == false:
		gamestate.humedad += 1
	pass # Replace with function body.
