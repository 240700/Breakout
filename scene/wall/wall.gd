class_name Wall
extends RefCounted

const LAYER = Global.Layer.WALL
const MASK = 0
const COLOR = Color.TOMATO

var rect_size: Rect2
var ci_rid: RID
var body: RID
var shape: RID


func _init(_rect_size: Rect2) -> void:
	self.rect_size = _rect_size


func build_wall(parent_rid: RID, space: RID) -> void:
	ci_rid = RenderingServer.canvas_item_create()
	RenderingServer.canvas_item_set_parent(ci_rid, parent_rid)
	RenderingServer.canvas_item_add_rect(ci_rid, rect_size, COLOR)
	
	body = PhysicsServer2D.body_create()
	PhysicsServer2D.body_set_mode(body, PhysicsServer2D.BODY_MODE_STATIC)
	PhysicsServer2D.body_set_space(body, space)
	PhysicsServer2D.body_set_collision_layer(body, LAYER)
	PhysicsServer2D.body_set_collision_mask(body, MASK)
	
	shape = PhysicsServer2D.rectangle_shape_create()
	PhysicsServer2D.shape_set_data(shape, rect_size.size / 2)
	var transfor2d = Transform2D.IDENTITY
	transfor2d.origin = (rect_size.position + rect_size.end) / 2
	PhysicsServer2D.body_add_shape(body, shape, transfor2d)
