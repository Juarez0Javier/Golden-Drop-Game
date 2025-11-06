extends CanvasLayer

@onready var gamestate = get_node("../GameState")
@export var vidaEstados: Array[Texture]

func _ready() -> void:
	$"Control/CartonLabel/AnimatedSprite2D".play("Idle")
	$"Control/GotaLabel".play("Idle")
	
	$"Control/CartonLabel/AnimatedSprite2D".frame = 0
	$"Control/GotaLabel".frame = 0
	
	$"Control/GotaLabel".visible = false

func _process(_delta: float) -> void:
	

	
	
	##Controlando Progreso
	var inicioAMeta = gamestate.inicio.distance_to(gamestate.meta)
	var jugadorAMeta = gamestate.pjcaja.position.distance_to(gamestate.meta)
	$"Control/ProgresoBarra".value = $"Control/ProgresoBarra".max_value - (jugadorAMeta * 100)/inicioAMeta
	
	##Controlando Humedad
	var vidaTextura = $'Control/VidaBarra/TextureRect'
	
	$"Control/VidaBarra".value =  clamp(gamestate.humedad,0,gamestate.maxHumedad)
	$'Control/VidaBarra/Label'.text = "%3d" % clamp(gamestate.humedad,0,gamestate.maxHumedad) + "%"

	
	if gamestate.humedad >= 100:
		vidaTextura.texture = vidaEstados[4]
	elif gamestate.humedad >= 75:
		vidaTextura.texture = vidaEstados[3]
	elif gamestate.humedad >= 50:
		vidaTextura.texture = vidaEstados[2]
	elif gamestate.humedad >= 25:
		vidaTextura.texture = vidaEstados[1]
	else:
		vidaTextura.texture = vidaEstados[0]
	
	##Controlando Cartones
	$"Control/CartonLabel".text = "x " + str(gamestate.cartones)
	
	##Controlando Gota
	if gamestate.gotaD == true:
		$"Control/GotaLabel".visible = true
	else:
		$"Control/GotaLabel".visible = false
		
	pass
	
	
