class_name Arena
extends Node2D

const THICKNESS = 10

var walls: Array[Wall] = []
var bricks: Dictionary = {}
@onready var rect = get_viewport_rect()

func _ready() -> void:
	EventBus.ball_collided.connect(_on_ball_collided)
	start()


func start() -> void:
	_build_wall()
	_build_brick()


func _build_wall() -> void:
	walls.append(Wall.new(Rect2(0, 0, THICKNESS, rect.size.y)))
	walls.append(Wall.new(Rect2(0, 0, rect.size.x, THICKNESS)))
	walls.append(Wall.new(Rect2(rect.size.x - THICKNESS, 0, THICKNESS, rect.size.y)))

	for wall in walls:
		wall.build_wall(get_canvas_item(), get_world_2d().space)


func _build_brick() -> void:
	var gap = Vector2(10, 10)
	for i in 15:
		for j in 15:
			var pos = Vector2((Brick.SIZE.x + gap.x) * i , (Brick.SIZE.y + gap.y) * j) + Vector2(25, 25)
			var brick = Brick.new(pos)
			brick.build_brick(get_canvas_item(), get_world_2d().space)
			bricks[brick.body] = brick


func _on_ball_collided(collider_rid: RID) -> void:
	var brick = bricks.get(collider_rid)
	if brick:
		bricks.erase(collider_rid)
		brick.hit()
