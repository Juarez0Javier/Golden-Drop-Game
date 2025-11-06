extends VBoxContainer


var config = ConfigFile.new()


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_volver_pressed() -> void:
	config.set_value("Volumen", "Master", $BarraVolumen.value)
	config.set_value("Volumen", "Musica", $BarraVolumen2.value)
	config.set_value("Volumen", "Efectos", $BarraVolumen3.value)
	config.save("user://opciones.cfg")
	hide()
	$"../BotonesPrincipal".show()
