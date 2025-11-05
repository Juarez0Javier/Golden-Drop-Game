extends Control

var progress = ConfigFile.new()
var nivel : int

func _ready() -> void:
	hide()
	

func mostrarMenu(humedad,fragmentos,gota,nivel):
	var err = progress.load("user://progreso.cfg")
	if(err == OK):
		if humedad == 100:
			$Incompleto.show()
			$Reintentar.show()
			$Completado.hide()
			$SiguienteNivel.hide()
		else:
			$Completado.show()
			$SiguienteNivel.show()
			$Incompleto.hide()
			$Reintentar.hide()
		if nivel == "Nv1Taller":
			if $Completado.visible == true and progress.get_value("Niveles","Completados") == 0:
				progress.set_value("Niveles","Completados",1)
			$Fragmentos.text = str(fragmentos) + "/" + progress.get_value("Nivel1","FragmentosTotales")
			if fragmentos > int(progress.get_value("Nivel1","Fragmentos")):
				progress.set_value("Nivel1","Fragmentos",str(fragmentos))
			if gota == true:
				$Gota.text = "1/1"
				progress.set_value("Nivel1","Gota","1")
			else:
				$Gota.text = "0/1"
		progress.save("user://progreso.cfg")
	for child in get_parent().get_children():
		if(child is ColorRect):
			child.show()
	show()
	$"../Pausa".ganarperder = true
	get_tree().paused = true


func continuar():
	get_tree().paused = false
	for child in get_parent().get_children():
		if(child is ColorRect):
			child.hide()
	$"../Pausa".ganarperder = false
	hide()

func _on_menu_principal_pressed() -> void:
	self.get_parent().get_parent().get_parent().cambiar_escena("MenuPrincipal")
	get_tree().paused = false
	self.get_parent().get_parent().call_deferred("queue_free")


func _on_siguiente_nivel_pressed() -> void:
	_on_menu_principal_pressed()


func _on_reintentar_pressed() -> void:
	continuar()
	$"../../GameState".reset()
	
