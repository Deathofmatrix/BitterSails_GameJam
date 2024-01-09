extends State

@export var cast_state: State

func process_input(event: InputEvent) -> State:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			return cast_state
	return null
