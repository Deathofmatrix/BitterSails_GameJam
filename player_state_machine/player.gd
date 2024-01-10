class_name Player
extends Node2D

var current_tile: Tile
var placed_tile_positions: Array[Vector2]
var empty_space_positions: Array[Vector2]

@onready var connected_tiles = $connected_tiles
@onready var animations = $animations
@onready var fishing_line = $fishing_line
@onready var state_machine = $state_machine

func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	placed_tile_positions.append($connected_tiles/Tile.position)
	empty_space_positions.append(placed_tile_positions[0] - Vector2(0, 16))
	empty_space_positions.append(placed_tile_positions[0] - Vector2(16, 0))
	empty_space_positions.append(placed_tile_positions[0] + Vector2(0, 16))
	empty_space_positions.append(placed_tile_positions[0] + Vector2(16, 0))
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _on_fishing_hook_body_entered(body):
	state_machine.fishing_hook_body_entered(body)
