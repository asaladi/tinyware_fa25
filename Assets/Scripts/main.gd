extends Node

const CHAR_START_POS := Vector2i(92, 237)
const TRAIN_START_POS := Vector2i(0, 90)
const CAM_START_POS := Vector2i(240, 180)

var speed : float
const START_SPEED : float = 10.0
const MAX_SPEED : int = 25

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game() 

func new_game():
	$chara.position = CHAR_START_POS
	$chara.velocity = Vector2i(0,0)
	$Camera2D.position = CAM_START_POS
	$train.position = TRAIN_START_POS

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	speed = START_SPEED
	
	$chara.position.x -= speed
	$Camera2D.position.x -= speed
	$train.position.x -= speed
	
	
