extends Node2D
@onready var ball: Ball = $Ball
@onready var paddle: Paddle = $Paddle

var is_emited = false

func _ready() -> void:
	ball.global_position = paddle.global_position + Vector2.UP * (Paddle.HEIGHT / 2 )
	ball.reparent(paddle) 


func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("emit"):
		if not is_emited:
			emit()
			


func emit() -> void:
	ball.reparent(self)
	ball.emit()
	is_emited = true


func _on_button_pressed() -> void:
	emit()
