extends TileMap
@onready var building_mode:bool = 0
@onready var building = Sprite2D.new()
@onready var building_type:String =""



func _process(delta):
	
	var tile = local_to_map(get_global_mouse_position())
	if building_mode:
		building.show()
		building.position = map_to_local(tile)
		if Input.is_action_just_pressed("left_mouse"):
			set_cell(0,tile,0,Vector2(0,0),0)
			building.hide()
			building_mode = false	
		if Input.is_action_just_pressed("right_mouse"):
			building.hide()
			building_mode = false
			
func activate():
	building_mode = 1

	
func update_building_texture():
	var texture = load("res://assets/SpriteSheet.png")
	building.texture = texture
	add_child(building)
	building.hide()
	
func build_mode():
	activate()


func _on_house_1_pressed():
	activate()
	building_type = "1"
	update_building_texture()


func _on_house_2_pressed():
	activate()
	building_type = "2"
	update_building_texture()
