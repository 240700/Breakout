class_name Paddle
extends CharacterBody2D

const WIDTH = 100
const HEIGHT = 10
const INIT_SPEED = 1000

const rect_size = Rect2(-WIDTH / 2.0, -HEIGHT / 2.0, WIDTH, HEIGHT)

func _ready() -> void:
	pass


func _draw() -> void:
	draw_rect(rect_size, Color.WHITE)


func _physics_process(delta: float) -> void:
	var xAxis = Input.get_axis("left", "right")
	
	velocity = Vector2(xAxis * INIT_SPEED, 0)
	
	move_and_collide(velocity * delta)
	
