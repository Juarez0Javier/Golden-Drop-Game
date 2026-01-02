extends CanvasLayer

var progress = ConfigFile.new()
var nivel : int
var nivel_actual

@onready var gameState = get_node("../GameState")

func _ready() -> void:
	hide()
	

func mostrarMenu(humedad,fragmentos,gota,nivel):
	
	## Manejo del Guardado de Progreso
	var err = progress.load("user://progreso.cfg")
	if(err == OK):
		if nivel == "Nv1Taller":
			if $Control/Fondo/Completado.visible == true and progress.get_value("Niveles","Completados") == 0:
				progress.set_value("Niveles","Completados",1)
			$Control/Fondo/LabelFargmentos/Fragmentos.text = str(fragmentos) + "/" + progress.get_value("Nivel1","FragmentosTotales")
			if fragmentos > int(progress.get_value("Nivel1","Fragmentos")):
				progress.set_value("Nivel1","Fragmentos",str(fragmentos))
			if gota == true:
				$Control/Fondo/LabelGota/Gota.text = "1/1"
				progress.set_value("Nivel1","Gota","1")
			else:
				$Control/Fondo/LabelGota/Gota.text = "0/1"
		progress.save("user://progreso.cfg")
		
	
		
	for child in get_parent().get_children():
		if(child is ColorRect):
			child.show()
	show()
	get_tree().paused = true
	gameState.inputHabilitado = false
	
	
	nivel_actual = nivel

func _on_menu_principal_pressed() -> void:
	Main.cambiar_escena(Main.Escenas.MenuPrincipal)


func _on_siguiente_nivel_pressed() -> void:
	_on_menu_principal_pressed()
	
