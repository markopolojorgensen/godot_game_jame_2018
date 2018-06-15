extends Node

export(bool) var skip = false

func _ready():
	$animation_player.connect("animation_finished", self, "animation_finished")
	
	resize_window()
	
	if skip:
		start_game()
	else:
		$animation_player.play("intro_fade_in")

func resize_window():
	OS.set_window_size(Vector2(320, 180) * 4)
	
	var screen_size = OS.get_screen_size(0)
	var window_size = OS.get_window_size()
	
	OS.set_window_position(screen_size*0.5 - window_size*0.5)

func animation_finished(animation):
	match animation:
		"intro_fade_in":
			$animation_player.play("intro_fade_out")
		"intro_fade_out":
			start_game()

func start_game():
	print("change to game scene")
	get_tree().quit()
