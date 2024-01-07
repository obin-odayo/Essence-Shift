extends CharacterBody2D

# variables for player movement
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# variables for pause menu
@onready var pauseMenu = $pauseMenu
var gamePaused = false

# function which shows and hides the pause menu
func showPauseMenu():
	# if game not paused
	if gamePaused:
		pauseMenu.hide()
		Engine.time_scale = 1
		
	# if game paused
	else:
		# show pause menu
		pauseMenu.show()
		
		# make game freeze
		Engine.time_scale = 0
	
	# toggle the value for game paused
	gamePaused = !gamePaused

func _physics_process(delta):
	# check if escape button is pressed
	if Input.is_action_just_pressed("escape"):
		# if button is pressed show pause menu
		showPauseMenu()
	
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var direction = Input.get_axis("moveLeft", "moveRight")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
