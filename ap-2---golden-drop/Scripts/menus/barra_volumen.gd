extends HSlider


var nombreBus : String
var indexBus : int
var config = ConfigFile.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	nombreBus = get_meta("Bus")
	indexBus = AudioServer.get_bus_index(nombreBus)
	var err = config.load("user://opciones.cfg")
	if(err != OK):
		value = db_to_linear(AudioServer.get_bus_volume_db(indexBus))
	else:
		value = config.get_value("Volumen",nombreBus)

func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(indexBus,linear_to_db(value))
