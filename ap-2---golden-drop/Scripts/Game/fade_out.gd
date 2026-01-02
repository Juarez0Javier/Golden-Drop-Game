extends CanvasLayer

@onready var animate = $AnimationPlayer

signal fadeOutEnd
signal fadeOutFullBlock

func _process(_delta: float):
	if animate.current_animation == "Flush" and snapped(animate.current_animation_position,0.1) == animate.current_animation_length / 2:
		fadeOutFullBlock.emit()
	pass

func playFadeOut():
	animate.play("Flush")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	fadeOutEnd.emit()
	pass # Replace with function body.
