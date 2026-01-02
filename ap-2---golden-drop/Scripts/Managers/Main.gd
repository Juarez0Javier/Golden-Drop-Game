extends Node

const Escenas = {
	MenuPrincipal = "Menues/MenuPrincipal",
	Cinematica = "Cinematicas/CinematicaInicio",
	SeleccionNivel = "Menues/seleccion_de_nivel",
	Nivel1 = "Niveles/nv_1_taller"
}

#var escena_actual : Node
#var musica = ""

func _ready() -> void:
	pass
	##print("Ready: Main")
	##escena_actual = obtener_instancia(Escenas.MenuPrincipal)
	
	#gestionar_musica()
	

func cambiar_escena(nombre_escena: String):
	'''
	if escena_actual != null:
		escena_actual.call_deferred("queue_free")
		escena_actual = null
	'''
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Escenas/" + nombre_escena + ".tscn")
	
	#var siguiente_escena = obtener_instancia(nombre_escena)
	#get_parent().add_child(siguiente_escena)
	#escena_actual = siguiente_escena

	#gestionar_musica()
	
'''
func obtener_instancia(nombre_escena):
	var ruta = "res://Escenas/" + nombre_escena + ".tscn"
	var instancia = load(ruta).instantiate()
	return instancia
'''
	
#func gestionar_musica():
	#if(escena_actual.name == Escenas.MenuPrincipal or escena_actual.name == Escenas.SeleccionNivel):
		#musica = "res://Assets/sound/menus/menu.wav"
	#else:
		#musica = ""
	#
	#if MusicManager.musica_actual() != musica:
		#MusicManager.detener_musica()
	#
	#if musica == "" or MusicManager.musica_actual() == musica:
		#return 
	#else:
		#MusicManager.reproducir_musica(musica)
