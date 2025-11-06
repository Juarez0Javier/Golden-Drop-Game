extends Control


var progress = ConfigFile.new()


func _ready() -> void:
	var err = progress.load("user://progreso.cfg")
	if(err == OK):
		$"Nivel 1/Fragmentos".text = progress.get_value("Nivel1", "Fragmentos") + "/" + progress.get_value("Nivel1","FragmentosTotales")			
		$"Nivel 1/Gota".text = progress.get_value("Nivel1", "Gota") + "/1"
		$FragmentosColor.visible = comparar($"Nivel 1/Fragmentos".text)
		$FragmentosByN.visible = !$FragmentosColor.visible
		$GotaColor.visible = comparar($"Nivel 1/Gota".text)
		$GotaByN.visible = !$GotaColor.visible
		var cantidad = progress.get_value("Niveles","Completados")
		if cantidad > 0:
			$"Nivel 2/Candado".visible = false
			$"Nivel 2/Fragmentos".text = progress.get_value("Nivel2", "Fragmentos") + "/" + progress.get_value("Nivel2","FragmentosTotales")			
			$"Nivel 2/Gota".text = progress.get_value("Nivel2", "Gota") + "/1"
			if cantidad > 1:
				$"Nivel 3/Candado".visible = false
				$"Nivel 3/Fragmentos".text = progress.get_value("Nivel3", "Fragmentos") + "/" + progress.get_value("Nivel3","FragmentosTotales")			
				$"Nivel 3/Gota".text = progress.get_value("Nivel3", "Gota") + "/1"
				if cantidad > 2:
					$"Nivel 4/Candado".visible = false
					$"Nivel 4/Fragmentos".text = progress.get_value("Nivel4", "Fragmentos") + "/" + progress.get_value("Nivel4","FragmentosTotales")			
					$"Nivel 4/Gota".text = progress.get_value("Nivel4", "Gota") + "/1"
					if cantidad > 3:
						$"Nivel 5/Candado".visible = false
						$"Nivel 5/Fragmentos".text = progress.get_value("Nivel5", "Fragmentos") + "/" + progress.get_value("Nivel5","FragmentosTotales")			
						$"Nivel 5/Gota".text = progress.get_value("Nivel5", "Gota") + "/1"


func comparar(texto):
	var comparacion = texto.split("/")
	if comparacion[0] == comparacion[1]:
		return true
	else:
		return false
		

func _on_jugar_pressed() -> void:
	if($"Nivel 1".visible == true):
		get_parent().cambiar_escena("Niveles/nv_1_taller")
		self.call_deferred("queue_free")
	#elif($"Nivel 2".visible == true):
		#var level = nivel2.instantiate()
		#self.get_parent().add_child(level)
		#self.call_deferred("queue_free")
	#elif($"Nivel 3".visible == true):
		#var level = nivel3.instantiate()
		#self.get_parent().add_child(level)
		#self.call_deferred("queue_free")
	#elif($"Nivel 4".visible == true):
		#var level = nivel4.instantiate()
		#self.get_parent().add_child(level)
		#self.call_deferred("queue_free")
	#elif($"Nivel 5".visible == true):
		#var level = nivel5.instantiate()
		#self.get_parent().add_child(level)
		#self.call_deferred("queue_free")


func _on_salir_pressed() -> void:
	get_parent().cambiar_escena("MenuPrincipal")
	self.call_deferred("queue_free")


func _on_salir_mouse_entered() -> void:
	$Salir.scale = Vector2(1,1)


func _on_salir_mouse_exited() -> void:
	$Salir.scale = Vector2(0.8,0.8)
	
	
func _on_izquierda_pressed() -> void:
	if($"Nivel 1".visible == false):
		if($"Nivel 2".visible == true):
			$"Nivel 2".visible = false
			$"Nivel 1".visible = true
			$FragmentosColor.visible = comparar($"Nivel 1/Fragmentos".text)
			$FragmentosByN.visible = !$FragmentosColor.visible
			$GotaColor.visible = comparar($"Nivel 1/Gota".text)
			$GotaByN.visible = !$GotaColor.visible
			$Jugar.disabled = false
		if($"Nivel 3".visible == true):
			$"Nivel 3".visible = false
			$"Nivel 2".visible = true
			$FragmentosColor.visible = comparar($"Nivel 2/Fragmentos".text)
			$FragmentosByN.visible = !$FragmentosColor.visible
			$GotaColor.visible = comparar($"Nivel 2/Gota".text)
			$GotaByN.visible = !$GotaColor.visible
			if($"Nivel 2/ImgNivel".visible == true):
				$Jugar.disabled = false
		if($"Nivel 4".visible == true):
			$"Nivel 4".visible = false
			$"Nivel 3".visible = true
			$FragmentosColor.visible = comparar($"Nivel 3/Fragmentos".text)
			$FragmentosByN.visible = !$FragmentosColor.visible
			$GotaColor.visible = comparar($"Nivel 3/Gota".text)
			$GotaByN.visible = !$GotaColor.visible
			if($"Nivel 3/ImgNivel".visible == true):
				$Jugar.disabled = false
		if($"Nivel 5".visible == true):
			$"Nivel 5".visible = false
			$"Nivel 4".visible = true
			$FragmentosColor.visible = comparar($"Nivel 4/Fragmentos".text)
			$FragmentosByN.visible = !$FragmentosColor.visible
			$GotaColor.visible = comparar($"Nivel 4/Gota".text)
			$GotaByN.visible = !$GotaColor.visible
			if($"Nivel 4/ImgNivel".visible == true):
				$Jugar.disabled = false	


func _on_izquierda_mouse_entered() -> void:
	if($"Nivel 1".visible == false):
		$Izquierda.scale = Vector2(1.2,1.2)


func _on_izquierda_mouse_exited() -> void:
	$Izquierda.scale = Vector2(1,1)

	
func _on_derecha_pressed() -> void:
	if($"Nivel 5".visible == false):
		if($"Nivel 1".visible == true):
			$"Nivel 1".visible = false
			$"Nivel 2".visible = true
			$FragmentosColor.visible = comparar($"Nivel 2/Fragmentos".text)
			$FragmentosByN.visible = !$FragmentosColor.visible
			$GotaColor.visible = comparar($"Nivel 2/Gota".text)
			$GotaByN.visible = !$GotaColor.visible
			if($"Nivel 2/ImgNivelByN".visible == true):
				$Jugar.disabled = true
		elif($"Nivel 2".visible == true):
			$"Nivel 2".visible = false
			$"Nivel 3".visible = true
			$FragmentosColor.visible = comparar($"Nivel 3/Fragmentos".text)
			$FragmentosByN.visible = !$FragmentosColor.visible
			$GotaColor.visible = comparar($"Nivel 3/Gota".text)
			$GotaByN.visible = !$GotaColor.visible
			if($"Nivel 3/ImgNivelByN".visible == true):
				$Jugar.disabled = true
		elif($"Nivel 3".visible == true):
			$"Nivel 3".visible = false
			$"Nivel 4".visible = true
			$FragmentosColor.visible = comparar($"Nivel 4/Fragmentos".text)
			$FragmentosByN.visible = !$FragmentosColor.visible
			$GotaColor.visible = comparar($"Nivel 4/Gota".text)
			$GotaByN.visible = !$GotaColor.visible
			if($"Nivel 4/ImgNivelByN".visible == true):
				$Jugar.disabled = true
		elif($"Nivel 4".visible == true):
			$"Nivel 4".visible = false
			$"Nivel 5".visible = true
			$FragmentosColor.visible = comparar($"Nivel 5/Fragmentos".text)
			$FragmentosByN.visible = !$FragmentosColor.visible
			$GotaColor.visible = comparar($"Nivel 5/Gota".text)
			$GotaByN.visible = !$GotaColor.visible
			if($"Nivel 5/ImgNivelByN".visible == true):
				$Jugar.disabled = true


func _on_derecha_mouse_entered() -> void:
	if($"Nivel 5".visible == false):
		$Derecha.scale = Vector2(1.2,1.2)
	

func _on_derecha_mouse_exited() -> void:
	$Derecha.scale = Vector2(1,1)
