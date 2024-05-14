extends TileMap
@onready var building_mode:bool = 0
@onready var building = Sprite2D.new()

func _ready():
	var texture = load("res://scripts/tile.png")
	building.texture = texture
	add_child(building)
	building.hide()

func _process(delta):
	var tile = local_to_map(get_global_mouse_position())
	if building_mode:
		change_tile_texture(1)
		if Input.is_action_just_pressed("left_mouse"):
			#if get_cell_source_id(0,tile) == 4:
				set_cell(0,tile,5,Vector2(0,0),0)
				building.hide()
				building_mode = false
			
		if Input.is_action_just_pressed("right_mouse"):
			erase_cell(1,Vector2(local_to_map(get_global_mouse_position()).x,local_to_map(get_global_mouse_position()).y))
			building_mode = false
func activate():
	building_mode = 1

func change_tile_texture(new_tile):
	set_cell(1,local_to_map(get_global_mouse_position()),new_tile,Vector2(0,0),0)
	
	
	
	
	
