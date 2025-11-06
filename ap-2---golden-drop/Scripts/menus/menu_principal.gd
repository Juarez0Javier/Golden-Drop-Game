extends Control


@warning_ignore("UNUSED_SIGNAL")
signal iniciar_cinematica
var config = ConfigFile.new()
var progress = ConfigFile.new()


# Called when the node enters the scene tree for the first time.
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
	##$BotonesPrincipal.hide()
	##$MenuOpciones.show()
	pass


func _on_selec_nivel_pressed() -> void:
	get_parent().cambiar_escena("Menues/seleccion_de_nivel")
	self.call_deferred("queue_free")
	

func _on_jugar_pressed() -> void:
	emit_signal("iniciar_cinematica")


func _on_volver_pressed() -> void:
	config.set_value("Volumen", "Master", $MenuOpciones/BarraVolumen.value)
	config.set_value("Volumen", "Musica", $MenuOpciones/BarraVolumen2.value)
	config.set_value("Volumen", "Efectos", $MenuOpciones/BarraVolumen3.value)
	config.save("user://opciones.cfg")
	$MenuOpciones.hide()
	$BotonesPrincipal.show()
