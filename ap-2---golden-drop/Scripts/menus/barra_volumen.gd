extends HSlider


var nombreBus : String
var indexBus : int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	nombreBus = get_meta("Bus")
	indexBus = AudioServer.get_bus_index(nombreBus)
	value = db_to_linear(AudioServer.get_bus_volume_db(indexBus))

func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(indexBus,linear_to_db(value))
