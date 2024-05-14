extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -200.0
	
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var collision_shape = $CollisionShape2D
@onready var animated_sprite = $AnimatedSprite2D
@onready var attack_box = $Attackbox
var isAttacking = false
var isRolling = false


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	
	#flip the sprite
	if direction > 0:
		animated_sprite.flip_h = false
		
		
	elif direction < 0:
		animated_sprite.flip_h = true
	

		#attackbox direction
	if Input.is_action_pressed("right"):
		get_node("Attackbox").set_scale(Vector2(1, 1))
	elif Input.is_action_pressed("left"):
		get_node("Attackbox").set_scale(Vector2(-1, 1))
		attack_box.position.x =+ 10
		
		
	#animations
	if is_on_floor():
		if direction == 0 && isAttacking == false && isRolling == false:
			animated_sprite.play("idle")
			
		elif direction != 0 && isAttacking == false && isRolling == false:
			animated_sprite.play("run")
			
		if Input.is_action_just_pressed("attack"):
			animated_sprite.play("Slash")
			isAttacking = true
			$Attackbox/CollisionShape2D.disabled = false
			
	else:
		animated_sprite.play("jump")
	
	if is_on_floor() && Input.is_action_just_pressed("dash"):
		animated_sprite.play("roll")
		isRolling = true
		
		
	#apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_animated_sprite_2d_animation_finished():
	if animated_sprite.animation == ("Slash"):
		isAttacking = false
		$Attackbox/CollisionShape2D.disabled = true
	elif animated_sprite.animation == ("roll"):
		isRolling = false


func _on_animated_sprite_2d_animation_looped():
	if animated_sprite.animation == ("roll"):
		isRolling = false
	elif animated_sprite.animation == ("Slash"):
		isAttacking = false
