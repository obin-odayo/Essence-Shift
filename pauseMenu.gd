extends Control

@onready var player = $"../"

func _on_resume_button_pressed():
	player.showPauseMenu()	

func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://mainMenu.tscn")
