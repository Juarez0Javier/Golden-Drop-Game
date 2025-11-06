extends CanvasLayer


func _ready() -> void:
	hide()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Pausar"):
		print("Pausar")
		pausar()

func pausar():
	if self.visible == true:
			get_tree().paused = false
			hide()
	else:
		get_tree().paused = true
		show()

func _on_continuar_pressed() -> void:
	pausar()


func _on_menu_principal_pressed() -> void:
	self.get_parent().get_parent().cambiar_escena("TallerNv1")
	self.get_parent().call_deferred("queue_free")
	pass
