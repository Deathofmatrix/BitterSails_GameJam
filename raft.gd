extends Node2D

@export var fishing_line: Line2D

var tile_on_hook: StaticBody2D

var is_line_cast = false
var line_speed = 100

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			cast_line(get_local_mouse_position())
			print("clicked")


func _process(delta):
	if fishing_line.get_point_position(0).distance_to(fishing_line.get_point_position(1)) <= 150:
		tile_on_hook = null


func _physics_process(delta):
	if is_line_cast:
		var line_pos = fishing_line.get_point_position(1).move_toward(fishing_line.get_point_position(0), delta * line_speed)
		fishing_line.set_point_position(1, line_pos)
		if tile_on_hook == null: return
		tile_on_hook.position = position + fishing_line.get_point_position(1)


func cast_line(pos:Vector2):
	fishing_line.set_point_position(0, Vector2(0,0))
	fishing_line.set_point_position(1, pos)
	is_line_cast = true


func _on_fishing_hook_body_entered(body):
	print("caught")
	if body.is_in_group("connected_tile"): return
	tile_on_hook = body
