extends Node2D

@export var texture_entries : Array[TextureEntry]

var texture_data : Dictionary = {}

func _ready():
	_setup_texture_data()
		
func _setup_texture_data():
	for entry in texture_entries:
		texture_data[entry.name] = entry.texture_path
		
	print(texture_data)
