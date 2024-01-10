extends State

@export var idle_state: State

func enter() -> void:
	super()
	parent.current_tile.reparent(parent.connected_tiles)


func exit() -> void:
	add_tile_to_array(parent.current_tile.position)


func process_input(event: InputEvent) -> State:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("clicked")
			parent.current_tile.add_to_group("connected_tile")
			parent.current_tile.remove_from_group("loose_tiles")
			return idle_state
	
	if event is InputEvent:
		if event.is_action_pressed("rotate"):
			parent.current_tile.rotation_degrees += 90
	
	return null


func process_frame(delta: float) -> State:
	
	
	return null


func process_physics(delta: float) -> State:
	var grid_pos = parent.connected_tiles.get_local_mouse_position().snapped(Vector2(16,16))
	for pos in parent.empty_space_positions:
		if grid_pos == pos:
			parent.current_tile.position = pos
	
	return null


func add_tile_to_array(tile_pos: Vector2):
	parent.placed_tile_positions.append(tile_pos)
	remove_tile_from_empty_space_array(tile_pos)
	check_tile_filled_and_add_to_array(tile_pos - Vector2(0, 16))
	check_tile_filled_and_add_to_array(tile_pos - Vector2(16, 0))
	check_tile_filled_and_add_to_array(tile_pos + Vector2(0, 16))
	check_tile_filled_and_add_to_array(tile_pos + Vector2(16, 0))


func remove_tile_from_empty_space_array(tile_pos: Vector2):
	for i in parent.empty_space_positions.size():
		print(i)
		var pos = parent.empty_space_positions[i]
		if pos == tile_pos:
			parent.empty_space_positions.remove_at(i)
			print(pos)
			return


func check_tile_filled_and_add_to_array(tile_pos: Vector2):
	for pos in parent.placed_tile_positions:
		if pos == tile_pos:
			return false
	
	parent.empty_space_positions.append(tile_pos)
	return true
