extends Control


var mainmenu : PackedScene
var nivel1 : PackedScene
#var nivel2 : PackedScene
#var nivel3 : PackedScene
#var nivel4 : PackedScene
#var nivel5 : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mainmenu = load("res://Escenas/Main.tscn")
	nivel1 = load("res://Escenas/Niveles/nv_1_taller.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_jugar_pressed() -> void:
	if($"Nivel 1".visible == true):
		var level = nivel1.instantiate()
		self.get_parent().add_child(level)
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
	var main = mainmenu.instantiate()
	self.get_parent().add_child(main)
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
			$Jugar.disabled = false
		if($"Nivel 3".visible == true):
			$"Nivel 3".visible = false
			$"Nivel 2".visible = true
			if($"Nivel 2/Candado".visible == false):
				$Jugar.disabled = false
		if($"Nivel 4".visible == true):
			$"Nivel 4".visible = false
			$"Nivel 3".visible = true
			if($"Nivel 3/Candado".visible == false):
				$Jugar.disabled = false
		if($"Nivel 5".visible == true):
			$"Nivel 5".visible = false
			$"Nivel 4".visible = true
			if($"Nivel 4/Candado".visible == false):
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
			if($"Nivel 2/Candado".visible == true):
				$Jugar.disabled = true
		elif($"Nivel 2".visible == true):
			$"Nivel 2".visible = false
			$"Nivel 3".visible = true
			if($"Nivel 3/Candado".visible == true):
				$Jugar.disabled = true
		elif($"Nivel 3".visible == true):
			$"Nivel 3".visible = false
			$"Nivel 4".visible = true
			if($"Nivel 4/Candado".visible == true):
				$Jugar.disabled = true
		elif($"Nivel 4".visible == true):
			$"Nivel 4".visible = false
			$"Nivel 5".visible = true
			if($"Nivel 5/Candado".visible == true):
				$Jugar.disabled = true


func _on_derecha_mouse_entered() -> void:
	if($"Nivel 5".visible == false):
		$Derecha.scale = Vector2(1.2,1.2)
	

func _on_derecha_mouse_exited() -> void:
	$Derecha.scale = Vector2(1,1)
