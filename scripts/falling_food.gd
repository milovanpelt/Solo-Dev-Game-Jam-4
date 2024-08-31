extends Area2D

var speed = 60.0
var texture_scale: Vector2 = Vector2(1, 1)

const FOOD_DATA = {
	"apple": "res://assets/sprites/foods/Apple.png",
	"bacon": "res://assets/sprites/foods/Bacon.png",
	"beer": "res://assets/sprites/foods/Beer.png",
	"honey": "res://assets/sprites/foods/Honey.png",
	"jam": "res://assets/sprites/foods/Jam.png"
}

func _process(delta):
	self.position.y += speed * delta
	
func delete_food():
	var sprite_node = get_node("Sprite2D")
	sprite_node.texture = null

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
	sprite_node.scale = texture_scale
