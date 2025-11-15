extends Control

@warning_ignore("UNUSED_SIGNAL")

var progress = ConfigFile.new()

func _ready() -> void:
	var err = progress.load("user://progreso.cfg")
	if(err != OK):
		progress.set_value("Niveles", "Completados", 0)
		progress.set_value("Nivel1", "FragmentosTotales", "?")
		progress.set_value("Nivel1", "Fragmentos", "0")
		progress.set_value("Nivel1", "Gota", "0")
		progress.set_value("Nivel2", "FragmentosTotales", "?")
		progress.set_value("Nivel2", "Fragmentos", "0")
		progress.set_value("Nivel2", "Gota", "0")
		progress.set_value("Nivel3", "FragmentosTotales", "?")
		progress.set_value("Nivel3", "Fragmentos", "0")
		progress.set_value("Nivel3", "Gota", "0")
		progress.set_value("Nivel4", "FragmentosTotales", "?")
		progress.set_value("Nivel4", "Fragmentos", "0")
		progress.set_value("Nivel4", "Gota", "0")
		progress.set_value("Nivel5", "FragmentosTotales", "?")
		progress.set_value("Nivel5", "Fragmentos", "0")
		progress.set_value("Nivel5", "Gota", "0")
		progress.save("user://progreso.cfg")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_salir_pressed() -> void:
	get_tree().quit()


func _on_opciones_pressed() -> void:
	$BotonesPrincipal.hide()
	$MenuOpciones.show()


func _on_selec_nivel_pressed() -> void:
	Main.cambiar_escena(Main.Escenas.SeleccionNivel)
	self.call_deferred("queue_free")
	

func _on_jugar_pressed() -> void:
	Main.cambiar_escena(Main.Escenas.Cinematica)
	self.call_deferred("queue_free")
	
