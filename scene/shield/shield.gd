extends StaticBody2D

const COLOR = Color.CYAN

var rect 


func _ready() -> void:
	var v_rect = get_viewport_rect().size
	rect = Rect2(-v_rect.x/2, 0, v_rect.x, 5)


func _draw() -> void:
	draw_rect(rect, COLOR)
