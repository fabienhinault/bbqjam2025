extends Node


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://niveau_1.tscn")


func _on_create_pressed() -> void:
	get_tree().change_scene_to_file("res://chart_creator.tscn")
