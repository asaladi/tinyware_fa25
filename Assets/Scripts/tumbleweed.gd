extends Area2D
#
var init_speed := 10
var speed := init_speed
#var wave_amplitude := 50
#var wave_frequency := 2.0
#
var target_position := Vector2.ZERO
var start_position := Vector2.ZERO
var time_passed := 0.0

func _ready():
	body_entered.connect(_on_body_entered)
	start_position = global_position
	
	if time_passed >= 15:
		queue_free()

func _physics_process(delta):
	if time_passed < 1:
		speed  = init_speed + 10
	else:
		speed  = init_speed
	
	time_passed += delta
	global_position.x -= speed
	
func _on_body_entered(body):
	print("TUMBLED COLLIDED WITH:", body)
	queue_free()
	# emit_signal("body_entered", body)
	
