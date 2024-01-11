class_name Tile
extends StaticBody2D

signal mouse_entered_tile(pos:Vector2)
signal mouse_exited_tile(pos:Vector2)

var is_snapped: bool = false

func _on_mouse_entered():
	emit_signal("mouse_entered_tile", position)


func _on_mouse_exited():
	emit_signal("mouse_exited_tile", position)
