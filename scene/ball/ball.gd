class_name Ball
extends CharacterBody2D

const RADIUS = 5
const MIN_SPEED = 600
const MAX_SPEED = 800


func emit() -> void:
	velocity = Vector2(0, -MIN_SPEED)


func _draw() -> void:
	draw_circle(Vector2.ZERO, RADIUS, Color.WHITE)


func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	
	if collision :
		velocity += collision.get_collider_velocity()
		velocity = velocity.bounce(collision.get_normal()).limit_length(MAX_SPEED)
		if velocity.length() < MIN_SPEED:
			velocity = velocity.normalized() * MIN_SPEED
		EventBus.ball_collided.emit(collision.get_collider_rid())
