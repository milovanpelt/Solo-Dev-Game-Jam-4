extends Node2D
@onready var food_counter_text = $FoodCounter_Text

var food_eaten = 0

const FALLING_FOOD = preload("res://scenes/falling_food.tscn")

func _on_spawn_timer_timeout():
	var falling_food_instance = FALLING_FOOD.instantiate()
	
	var falling_food_x_position = randf_range(-200, 0)
	var falling_food_y_position = -100
	var falling_food_spawn_position = Vector2(falling_food_x_position, falling_food_y_position)
	
	falling_food_instance.create_food_at(falling_food_spawn_position)
	add_child((falling_food_instance))

func add_food_eaten():
	food_eaten += 1
	food_counter_text.text = "Food Eaten: " + str(food_eaten)
