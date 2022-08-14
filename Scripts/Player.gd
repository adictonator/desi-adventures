extends KinematicBody2D

export var speed: int = 400
export var gravity: int = 30
var velocity: Vector2 = Vector2.ZERO
var jumpForce: int = 850

func _physics_process(delta: float) -> void:
	#velocity = Vector2.ZERO
	if Input.is_action_pressed('move_left'):
		velocity.x = -speed
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed('move_right'):
		velocity.x = speed
		$AnimatedSprite.flip_h = false
	else:
		pass


	velocity.y += gravity

	#if !is_on_floor():
	#	$AnimatedSprite.play('jump')

	if is_on_floor() && Input.is_action_just_pressed('jump'):
		velocity.y = -jumpForce

	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x, 0, 0.3)
