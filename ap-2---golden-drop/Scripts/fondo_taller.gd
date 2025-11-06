extends ParallaxBackground

@onready var gamestate = get_node("../GameState")
@onready var piso = get_node("PisoInfinito")

@onready var altoPiso = $FondoAlto.motion_mirroring.y
@onready var pisoBajoSprite = $FondoBajo/Sprite2D
@onready var pisoAltoSprite = $FondoAlto/Sprite2D

@export var colorPiso: Array[Color]

var offsetPisoPos = 20
var lerpLimit = 200

var color
var t = 0.0
var pisoAct = 0



func _process(delta: float) -> void:
	##Calculando Posicion de Piso
	piso.position.x = gamestate.pjcaja.position.x
	
	##Calculando Transicion de Colores
	
	var limiteSup = -1 * altoPiso + offsetPisoPos
	
	pisoAct = (int(gamestate.pjcaja.position.y) / int(limiteSup))
	
	limiteSup *= pisoAct + 1
	var limiteInf = limiteSup + lerpLimit

	if gamestate.pjcaja.position.y < limiteInf:
		t = 1 - (limiteSup - gamestate.pjcaja.position.y) / (limiteSup - limiteInf)
	else:
		t = 0
	
	if pisoAct + 1 < colorPiso.size():
		color = lerp(colorPiso[pisoAct],colorPiso[pisoAct+1],t)
	else:
		color = colorPiso[colorPiso.size() - 1]
	
	pisoBajoSprite.modulate = color
	pisoAltoSprite.modulate = color
