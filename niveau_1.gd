extends Node2D



func _ready() -> void:
	$Joueur.position = $JoueurPosition.position
	$ZonePartition.position = $ZonePartitionPosition.position



func _process(delta: float) -> void:
	pass
