class_name Brick
extends RefCounted

const WIDTH = 40
const HEIGHT = 15

const SIZE = Vector2(WIDTH, HEIGHT)
const LAYER = Global.Layer.BRICK
const MASK = 0
const BORDER_COLOR = Color.BLACK
const COLOR = Color.WHITE

static var shape: RID = PhysicsServer2D.rectangle_shape_create()

var ci_rid: RID
var body: RID
var position: Vector2


static func _static_init() -> void:
	PhysicsServer2D.shape_set_data(shape, SIZE / 2)


func _init(_position: Vector2) -> void:
	self.position = _position


func build_brick(parent_rid: RID, space: RID) -> void:
	ci_rid = RenderingServer.canvas_item_create()
	RenderingServer.canvas_item_set_parent(ci_rid, parent_rid)
	RenderingServer.canvas_item_add_rect(ci_rid, Rect2(position, SIZE), BORDER_COLOR)
	RenderingServer.canvas_item_add_rect(ci_rid, Rect2(position, SIZE).grow(-1), COLOR)
	
	body = PhysicsServer2D.body_create()
	PhysicsServer2D.body_set_mode(body, PhysicsServer2D.BODY_MODE_STATIC)
	PhysicsServer2D.body_set_space(body, space)
	PhysicsServer2D.body_set_collision_layer(body, LAYER)
	PhysicsServer2D.body_set_collision_mask(body, MASK)
	
	var transfor2d = Transform2D.IDENTITY
	transfor2d.origin = position + SIZE / 2
	PhysicsServer2D.body_add_shape(body, shape, transfor2d)



func hit() -> void:
	RenderingServer.free_rid(ci_rid)
	PhysicsServer2D.free_rid(body)
	
