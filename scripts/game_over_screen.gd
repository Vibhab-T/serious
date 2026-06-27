extends Node2D
@onready var game_over_label: Label = $Control/GameOverLabel
@onready var wheel: Sprite2D = $Wheel

func spawn_text() -> void:
	if GameController.get_percent() < 0.5:
		game_over_label.text =  "Unacceptable! Put in a serious effort and collect atleast half of the documents!"
	elif GameController.get_percent() >= 0.5 and GameController.get_percent()<0.75:
		game_over_label.text = "Almost got it all, if only you were a bit more serious, you would've gotten them all"
	elif GameController.get_percent() >= 0.75 and GameController.get_percent()<1:
		game_over_label.text = "Good job, almost got them all. Seriosly though, get them all."
	else:
		game_over_label.text = "CONGRATULATIONS for securing all the documents! Please enjoy this gift card for a 5 minute visit with the family!"
		


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_text()

func rotate_sprite(delta: float) -> void:
	wheel.rotate(delta * 10 * delta)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_sprite(delta)



func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_play_again_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_one.tscn")
