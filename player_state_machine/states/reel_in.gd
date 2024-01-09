extends State

@export var place_tile_state: State
@export var idle_state: State

var is_hooked: bool
var tile_on_hook: StaticBody2D

func exit() -> void:
	parent.fishing_line.set_point_position(1, parent.fishing_line.get_point_position(0))


func process_frame(delta: float) -> State:
	if parent.fishing_line.get_point_position(0).distance_to(parent.fishing_line.get_point_position(1)) <= 20:
		if tile_on_hook == null: return idle_state
		parent.current_tile = tile_on_hook
		tile_on_hook = null
		return place_tile_state
	
	return null


func process_physics(delta: float) -> State:
	var line_pos = parent.fishing_line.get_point_position(1).move_toward(parent.fishing_line.get_point_position(0), delta * 50)
	parent.fishing_line.set_point_position(1, line_pos)
	if tile_on_hook == null: return
	tile_on_hook.position = parent.position + parent.fishing_line.get_point_position(1)
	
	return null


func fishing_hook_body_entered(body) -> State:
	if tile_on_hook != null: return
	print("caught")
	if body.is_in_group("connected_tile"): return
	tile_on_hook = body
	
	return null
