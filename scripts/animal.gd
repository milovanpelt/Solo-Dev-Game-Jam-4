extends Area2D

func _on_area_entered(area):
	var game_manager = get_node("/root/World/GameManager")	
	if game_manager:
		var food_name: String = area.get_meta("name")
		game_manager.checkfood(food_name)
		area.queue_free()
