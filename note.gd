extends RigidBody2D

signal hit
signal fail
var vitesse = 400


func _ready() -> void:
	pass



func _process(delta: float) -> void:
	position.x -= vitesse
