extends Area2D

var speed :=300
var direction := Vector2.RIGHT

func _ready():
	add_to_group("bullet")
	await get_tree().create_timer(3.0).timeout
	queue_free()
	

func _physics_process(delta):
	position += direction * speed * delta
	#if position.x > 2000 or position.x < -2000: # offscreen
		#queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _on_body_entered(body):
	#if body.is_in_group("enemies"):
		#body
