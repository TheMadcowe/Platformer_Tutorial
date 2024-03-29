extends KinematicBody2D

const UP = Vector2(0, -1)
const ACCELERATION = 50
const GRAVITY = 20
const MAX_SPEED = 200
const JUMP_HEIGHT = -550
var motion = Vector2()

export var max_jumps = 1
var jumps = max_jumps

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else:
		
		$Sprite.play("Idle")
		friction = true
	if Input.is_action_just_pressed("ui_down"):
		
			changeColor(randf(),randf(),randf())
	if Input.is_action_just_pressed("ui_accept"):
		changeColor(1,1,1)


		
	if Input.is_action_just_pressed("ui_up") && jumps > 0:
			motion.y = JUMP_HEIGHT
			jumps-=1
			
	if is_on_floor():
		jumps = max_jumps 
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
			
		
	else:
		if motion.y < 0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
		

	
	motion = move_and_slide(motion, UP)


func changeColor(r,g,b):
		print(r)
		$Sprite.modulate = Color(r, g, b)

