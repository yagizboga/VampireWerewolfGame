extends Control

@onready var building_mode:bool = 0
@onready var building = Sprite2D.new()

func _ready():
	var texture = load("res://assets/part-Slice 36.png")
	building.texture = texture
	add_child(building)
	building.hide()
	
func _process(delta):
	if building_mode:
		building.position = get_global_mouse_position()
		building.show()
		if Input.is_action_just_pressed("left_mouse"):
			building_mode = false
		if Input.is_action_just_pressed("right_mouse"):
			building.hide()
			building_mode = false


func activate():
	building_mode = 1
	
