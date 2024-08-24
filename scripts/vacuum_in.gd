extends CharacterBody2D

const SPEED = 100.0

var destination

func _ready():
	var VacuumDestinationAttached = get_node("VacuumDestination")
	if VacuumDestinationAttached:
		var VacuumDestination = VacuumDestinationAttached.get_global_position()
		destination = VacuumDestination

func _physics_process(delta):
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_area_2d_area_entered(area):
	area.set_position(destination)
