extends Area2D

const SPEED = 60.0

const FOOD_DATA = {
	"apple": "res://sprites/Apple.png",
	"bacon": "res://sprites/Bacon.png",
	"beer": "res://sprites/Beer.png",
	"honey": "res://sprites/Honey.png",
	"jam": "res://sprites/Jam.png"
}

func create_food_at(position : Vector2):
	var food_name = get_random_food_name()
	var food_texture = load_food_texture(food_name)
	
	set_meta("name", food_name)
	update_food_texture(food_texture)
	self.position = position

func get_random_food_name() -> String:
	return FOOD_DATA.keys().pick_random()

func load_food_texture(food_name: String) -> Texture2D:
	var food_path = FOOD_DATA[food_name]
	return load(food_path) as Texture2D
	
func update_food_texture(texture: Texture2D):
	var sprite_node = get_node("Sprite2D")
	sprite_node.set_texture(texture)
	
func _process(delta):
	self.position.y += SPEED * delta
