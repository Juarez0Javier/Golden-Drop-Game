class_name GameState
extends Node

@onready var pjcaja = get_node("../PJCaja")
@onready var fadeOut = get_node("../FadeOut")
@onready var menuGanar = get_node("../MenuGanar")
@onready var timerEstado = $TimerEstado

var humedad = 0
var maxHumedad = 100

var enRefugio = false
var inputHabilitado = true

var cartones = 0
var gotaD = false
var chekpointUlt = null		##Ulimo checkpoint
var collUlti = [] 			##Lista de coleccionables hasta ultimo checkpoint

var meta = Vector2(0,0)
var inicio = Vector2(0,0)

func _ready():
	pjcaja.cajaAnimationFinished.connect(on_cajaAnimationFinished)
	fadeOut.fadeOutEnd.connect(on_fadeOutEnd)
	fadeOut.fadeOutFullBlock.connect(on_fadeOutFullBlock)
	chekpointUlt = pjcaja.position
	
func _process(_delta: float):
	##print(inputHabilitado)
	humedad = clamp(humedad,0,maxHumedad)
	
	if humedad == maxHumedad:
		pjcaja.morir()
		inputHabilitado = false
	pass

func ganar():
	menuGanar.mostrarMenu(humedad,cartones,gotaD,get_parent().name)

func reset():
	pjcaja.position = Vector2(chekpointUlt.x, chekpointUlt.y - 200)
	
	print("reset: ", chekpointUlt)
	pjcaja.velocity = Vector2(0,0)
	
	for coll in collUlti:
		if coll.name.find("Carton") != -1:
			cartones -= 1
		if coll.name.find("Gota") != -1:
			gotaD = false
		coll.enablePickup()
		
	collUlti.clear()
	
	enRefugio = true
	humedad = 0
	
	
func on_cajaAnimationFinished(animName):
	if animName == "Muerte":
		fadeOut.playFadeOut()
	

func on_fadeOutFullBlock():
	print("Reset!")
	reset()
	
	
func on_fadeOutEnd():
	print("End")
	inputHabilitado = true
	
	
func aumentar_humedad(daño: float):
	humedad += daño
	pjcaja.modulate = Color.DEEP_SKY_BLUE
	timerEstado.start()
	
func disminuir_humedad(vida: int):
	humedad -= vida
	pjcaja.modulate = Color.GOLD
	timerEstado.start()
	
func _on_timer_estado_timeout() -> void:
	pjcaja.modulate = Color.WHITE
