extends State

@export var idle_state: State

func process_input(event: InputEvent) -> State:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("clicked")
			parent.current_tile.reparent(parent.connected_tiles)
			parent.current_tile.add_to_group("connected_tile")
			parent.current_tile.remove_from_group("loose_tiles")
			return idle_state
	
	return null


func process_frame(delta: float) -> State:
	
	
	return null


func process_physics(delta: float) -> State:
	parent.current_tile.position = parent.get_global_mouse_position().snapped(Vector2(16,16))
	
	return null
