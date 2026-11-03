# Tela de fim de partida: script da folha de consulta da Aula 09 (Prof. Ezefferth)
extends Control

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://scenes/arena.tscn")
