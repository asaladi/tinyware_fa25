extends Node

const CHAR_START_POS := Vector2i(92, 237)
const TRAIN_START_POS := Vector2i(0, 90)
const CAM_START_POS := Vector2i(240, 180)

var speed : float
const START_SPEED : float = 10.0
const MAX_SPEED : int = 25

var score : int = 0
var health : int = 3

var time : float = 0.0

var tumbleweed_scene = preload("res://Assets/Scenes/tumbleweed.tscn")
var spawn_timer = 0.0
var spawn_interval = 5.0

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game() 
	hide_help(5.0)
	
func hide_help(seconds: float):
	$HUD.get_node("GameOverLabel").visible = false
	await get_tree().create_timer(seconds).timeout
	$HUD.get_node("HelpLabel").visible = false

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
	
	time += delta
	$train.position.y = TRAIN_START_POS.y + (1.0*sin(30*time))
	
	$HUD.get_node("ScoreLabel").text = "SCORE: " + str(score)
	$HUD.get_node("HealthLabel").text = "LIVES: " + str(health)
	
	if (health <= 0):
		$HUD.get_node("GameOverLabel").visible = true
	
	spawn_timer -= delta
	if spawn_timer <= 0:
		spawn_tumbleweed()
		spawn_timer = spawn_interval

func spawn_tumbleweed():
	var tumbleweed = tumbleweed_scene.instantiate()
	tumbleweed.global_position = Vector2($chara.position.x+400, randi_range(50,220))
	tumbleweed.init_speed = speed
	tumbleweed.body_entered.connect(hit_obs)
	add_child(tumbleweed)
	
func hit_obs(body): 
	if body.name == "chara":
		health -= 1
	elif body.is_in_group("bullet"):
		score += 1
	print("hit")
	
