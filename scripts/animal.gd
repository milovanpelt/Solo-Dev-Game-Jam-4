extends Area2D

func _on_area_entered(area):
	var game_manager = get_node("/root/World/GameManager")	
	if game_manager:
		game_manager.add_food_eaten()
		area.queue_free()
