extends Control



@onready var start_button = $CenterContainer/MenuVbox/StartButton



func _physics_process(delta):
	pass


func _on_start_button_button_up():
	var game_start = load("res://Levels/Main.tscn")
	get_tree().change_scene_to_packed(game_start)
