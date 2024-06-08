extends Node2D
#############################################################################
var timberman_count = 0
var warrior_count = 0
var villager_count = 0

var villager = Node2D.new()
var warrior
var timberman
var villager_spawn_timer : Timer
#############################################################################

func _ready():
	villager_spawn_timer = Timer.new()
	add_child(villager_spawn_timer)
	villager_spawn_timer.wait_time = 1
	villager_spawn_timer.timeout.connect(timer_timeout)
	villager_spawn_timer.start()

func timer_timeout():
	if villager_count < 10:
		new_villager()
	else:
		villager_spawn_timer.stop()

func take_task(base_task):
	if base_task == warrior:
		base_task = timberman
	elif base_task == timberman:
		base_task = timberman


func new_villager():
	add_child(villager)
	var villager_texture = Sprite2D.new()
	villager_texture.texture = load("res://villager_texture.png")
	villager.add_child(villager_texture)
	villager.global_position = Vector2(randi_range(0,500),randi_range(0,500))
	villager_count+=1

func new_warrior():
	add_child(warrior)
	var warrior_texture = Sprite2D.new()
	warrior_texture.texture = load()
	warrior.add_child(warrior_texture)
	
