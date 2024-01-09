class_name Player
extends Node2D

var current_tile: StaticBody2D

@onready var connected_tiles = $connected_tiles
@onready var animations = $animations
@onready var fishing_line = $fishing_line
@onready var state_machine = $state_machine

func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _on_fishing_hook_body_entered(body):
	state_machine.fishing_hook_body_entered(body)
