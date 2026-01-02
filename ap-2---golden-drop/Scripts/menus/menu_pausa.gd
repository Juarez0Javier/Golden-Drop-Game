extends CanvasLayer

@onready var gameState = get_node("../GameState")

var habilitado = true

func _ready() -> void:
	hide()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Pausar"):
		pausar()

func pausar():
	if gameState.inputHabilitado:
		if self.visible == true:
				get_tree().paused = false
				hide()
		else:
			get_tree().paused = true
			show()

func _on_continuar_pressed() -> void:
	pausar()


func _on_menu_principal_pressed() -> void:
	pausar()
	Main.cambiar_escena(Main.Escenas.MenuPrincipal)


func _on_opciones_pressed() -> void:
	$Control/TextureRect/MarginContainer/MenuPausa/BotonesPrincipal.hide()
	$Control/TextureRect/MarginContainer/MenuPausa/MenuOpciones.show()
