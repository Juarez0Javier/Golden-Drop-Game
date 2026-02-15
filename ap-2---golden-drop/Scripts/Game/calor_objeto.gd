extends Area2D

@onready var gamestate = $"../../../GameState"

var enRango = false

@export var curaMax = 10
var cura = curaMax
var secado = 1

@export var cooldown = 5

func _ready() -> void:
	$'HeatSprite'.play("Idle")
	$'Cooldown'.wait_time = cooldown

	
func _process(_delta: float) -> void:
	if cura == 0:
		$HealTimer.stop()
		$'HeatSprite'.play("Apagar")
		$'AudioStreamPlayer2D'.volume_db = -3
		cura = -1


func _on_body_entered(body: Node2D) -> void:
	if body.name == gamestate.pjcaja.name:
		enRango = true
		$HealTimer.start()



func _on_body_exited(body: Node2D) -> void:
	if body.name == gamestate.pjcaja.name:
		enRango = false
		$HealTimer.stop()
		if cura == -1:
			$'Cooldown'.start()
			$'CollisionShape2D'.set_deferred("disabled",true)
			


func _on_heal_timer_timeout() -> void:
	gamestate.disminuir_humedad(secado)
	cura -= 1
	pass # Replace with function body.

func _on_cooldown_timeout() -> void:
	$'CollisionShape2D'.set_deferred("disabled",false)
	$'HeatSprite'.play("Encender")
	$'AudioStreamPlayer2D'.volume_db = 0
	cura = curaMax


func _on_heat_sprite_animation_finished() -> void:
	var calor_nodo = get_node_or_null("calor")
	
	if $'HeatSprite'.animation == "Apagar":
		$'HeatSprite'.play("Idle Apagado")
		
		if(calor_nodo):
			calor_nodo.visible = false
			
	elif $'HeatSprite'.animation == "Encender":
		$'HeatSprite'.play("Idle")
		if(calor_nodo):
			calor_nodo.visible = true
	
