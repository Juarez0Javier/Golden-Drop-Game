extends Node

@onready var pjcaja = get_node("../PJCaja")
@onready var fadeOut = get_node("../FadeOut")
@onready var menuGanar = get_node("../MenuGanar")

var humedad = 0
var maxHumedad = 100

var enRefugio = false
var inputHabilitado = true

var cartones = 0
var gotaD = false
var chekpointUlt = null		##Ulimo checkpoint
var collUlti = [] 			##Lista de coleccionables hasta ultimo chekcpoint

var meta = Vector2(0,0)
var inicio = Vector2(0,0)

func _ready():
	
	pjcaja.cajaAnimationFinished.connect(on_cajaAnimationFinished)
	fadeOut.fadeOutEnd.connect(on_fadeOutEnd)
	fadeOut.fadeOutFullBlock.connect(on_fadeOutFullBlock)
	pass
	
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
	pjcaja.position = chekpointUlt.position
	
	for coll in collUlti:
		if coll.name.find("Carton") != -1:
			cartones -= 1
		if coll.name.find("Gota") != -1:
			gotaD = false
		coll.enablePickup()
		
	collUlti.clear()
	
	humedad = 0
	pass
	
func on_cajaAnimationFinished(animName):
	if animName == "Muerte":
		fadeOut.playFadeOut()
	pass

func on_fadeOutFullBlock():
	print("Reset!")
	reset()
	pass
	
func on_fadeOutEnd():
	print("End")
	inputHabilitado = true
	pass
