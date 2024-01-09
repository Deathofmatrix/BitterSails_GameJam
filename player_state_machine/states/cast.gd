extends State

@export var reel_in_state: State


func process_input(event: InputEvent) -> State:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			cast_line(parent.get_local_mouse_position())
			print("clicked")
			return reel_in_state
	
	return null

func cast_line(pos: Vector2):
	parent.fishing_line.set_point_position(0, Vector2(0,0))
	parent.fishing_line.set_point_position(1, pos)
