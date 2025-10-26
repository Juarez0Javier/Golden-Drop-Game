extends CanvasLayer

@onready var gamestate = get_node("../GameState")
@export var vidaEstados: Array[Texture]


func _process(_delta: float) -> void:
	var humedad = $"Control/Progresso Barra".max_value - gamestate.vida
	var vidaTextura = $'Control/Progresso Barra/TextureRect'
	
	$"Control/Progresso Barra".value = humedad
	$'Control/Progresso Barra/Label'.text = "%3d" % humedad + "%"
	
	
	if humedad == 100:
		vidaTextura.texture = vidaEstados[4]
	elif humedad > 75:
		vidaTextura.texture = vidaEstados[3]
	elif humedad > 50:
		vidaTextura.texture = vidaEstados[2]
	elif humedad > 25:
		vidaTextura.texture = vidaEstados[1]
	else:
		vidaTextura.texture = vidaEstados[0]
	pass
