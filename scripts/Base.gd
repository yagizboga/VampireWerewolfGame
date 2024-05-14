extends Node2D
@onready var dragger = $build_ui/hud/dragger
var buildMode: bool = false

func build_mode():
	dragger.activate()
	

