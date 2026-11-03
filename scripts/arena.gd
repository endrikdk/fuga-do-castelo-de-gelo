# Horda que traz os inimigos: script da folha de consulta da Aula 09 (Prof. Ezefferth)
extends Node2D

@export var cena_inimigo: PackedScene

@onready var horda: Timer = $Horda

func _on_horda_timeout() -> void:
	var inimigo := cena_inimigo.instantiate()
	inimigo.global_position = $Nascedouros.get_children().pick_random().global_position
	add_child(inimigo)

	# A horda aperta: cada inimigo chega um pouco mais cedo que o anterior.
	horda.wait_time = max(0.5, horda.wait_time * 0.95)
