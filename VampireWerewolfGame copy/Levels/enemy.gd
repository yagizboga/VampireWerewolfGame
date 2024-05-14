extends Area2D

var dead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if dead == false:
		$AnimatedSprite2D.play("idle")


func _on_area_entered(area):
	if area.is_in_group("Sword"):
		dead = true
		$AnimatedSprite2D.play("destroyed")


func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation == "destroyed":
		queue_free()
