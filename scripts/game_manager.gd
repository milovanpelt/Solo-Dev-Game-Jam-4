extends Node2D
@onready var food_score_text = $FoodScore_Text

@onready var food_request_1_texture = $Food_Requests/Food_Request_1
@onready var food_request_2_texture = $Food_Requests/Food_Request_2

@onready var food_request_1_text = $Food_Requests/Food_Request_1/Food_Request_1_Text
@onready var food_request_2_text = $Food_Requests/Food_Request_2/Food_Request_2_Text

var food_request_1_name: String = ""
var food_request_2_name: String = ""

var current_food_request_1_number: int = 0
var current_food_request_2_number: int = 0
var food_request_1_number: int = 0
var food_request_2_number: int = 0

var current_food_score = 0
var food_score_addition = 100

var food_request_instance_1
var food_request_instance_2

const FALLING_FOOD = preload("res://scenes/falling_food.tscn")

func _ready():
	create_animal_food()

func _on_spawn_timer_timeout():
	var falling_food_instance = FALLING_FOOD.instantiate()
	
	var falling_food_x_position = randf_range(-225, 15)
	var falling_food_y_position = -100
	var falling_food_spawn_position = Vector2(falling_food_x_position, falling_food_y_position)
	
	falling_food_instance.create_food_at(falling_food_spawn_position)
	add_child((falling_food_instance))

func add_food_score():
	current_food_score += food_score_addition
	food_score_text.text = "Score: " + str(current_food_score)
	
func create_animal_food():
	# first one
	food_request_instance_1 = FALLING_FOOD.instantiate()
	food_request_instance_1.delete_food()
	var food_request_1_x_position = food_request_1_texture.position.x
	var food_request_1_y_position = food_request_1_texture.position.y
	var food_request_1_spawn_position = Vector2(food_request_1_x_position, food_request_1_y_position)
	
	food_request_instance_1.scale = Vector2(2, 2)
	food_request_instance_1.speed = 0
	
	food_request_instance_1.create_food_at(food_request_1_spawn_position)
	food_request_1_name = food_request_instance_1.get_meta("name")
	add_child((food_request_instance_1))
	
	food_request_1_number = randf_range(1, 4)
	food_request_1_text.text = str(food_request_1_number)
	
	# second one
	food_request_instance_2 = FALLING_FOOD.instantiate()
	food_request_instance_2.delete_food()
	var food_request_2_x_position = food_request_2_texture.position.x
	var food_request_2_y_position = food_request_2_texture.position.y
	var food_request_2_spawn_position = Vector2(food_request_2_x_position, food_request_2_y_position)
	
	food_request_instance_2.scale = Vector2(2, 2)
	food_request_instance_2.speed = 0
	
	food_request_instance_2.create_food_at(food_request_2_spawn_position)
	food_request_2_name = food_request_instance_2.get_meta("name")
	add_child((food_request_instance_2))
	
	food_request_2_number = randf_range(1, 4)
	food_request_2_text.text = str(food_request_2_number)
	
func checkfood(food_name: String):
	if (current_food_request_1_number == food_request_1_number && current_food_request_2_number == food_request_2_number):
		current_food_request_1_number = 0
		current_food_request_2_number = 0
		food_request_instance_1.delete_food()
		food_request_instance_2.delete_food()
		create_animal_food()
	if (food_name == food_request_1_name && current_food_request_1_number != food_request_1_number):
		current_food_request_1_number += 1
		add_food_score()
	if (food_name == food_request_2_name && current_food_request_2_number != food_request_2_number):
		current_food_request_2_number += 1
		add_food_score()
		
