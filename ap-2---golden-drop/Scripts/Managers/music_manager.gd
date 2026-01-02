extends Node
var reproductor := AudioStreamPlayer.new()

func _enter_tree() -> void:
	add_child(reproductor)
	reproductor.finished.connect(_on_music_finished)
	reproductor.bus = "Musica"
	
	
func reproducir_musica(ruta: String):
	var cancion := load(ruta) as AudioStream
		
	if reproductor.stream != cancion:
		reproductor.stream = cancion
		reproductor.play()
	
	
func detener_musica():
	reproductor.stop()
	reproductor.stream = null


func musica_actual():
	if reproductor.stream == null:
		return ""
	return reproductor.stream.resource_path
	
	
func _on_music_finished():
	if reproductor.stream != null:
		reproductor.play()	
