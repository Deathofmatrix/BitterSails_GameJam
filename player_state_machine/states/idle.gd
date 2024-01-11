extends State

@export var cast_state: State

func exit() -> void:
	parent.fishing_line.set_point_position(0, parent.hovered_tile)


func process_input(event: InputEvent) -> State:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if not parent.is_hovering_tile: return null
			return cast_state
	return null
