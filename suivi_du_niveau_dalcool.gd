extends Control

func _process(delta: float) -> void:
	$ProgressBar.value = get_parent().find_child("ZonePartition").hit_daffilé
	$ProgressBar2.value = get_parent().find_child("ZonePartition").taux_alcoolémie
