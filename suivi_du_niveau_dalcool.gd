extends Control

func _process(delta: float) -> void:
	$ProgressBar.value = get_parent().find_child("ZonePartition").consecutive_hits
