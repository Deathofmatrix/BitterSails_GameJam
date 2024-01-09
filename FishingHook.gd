extends Area2D

func _process(_delta):
	position = get_parent().get_point_position(1)
