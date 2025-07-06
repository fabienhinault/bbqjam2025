extends Node2D

@export var bpm:float = 249
var chart = ["", "", "", "", "3", "3", "32", "4", "1", "3", "2", "4", "", "2", "31", "", "32", "4", "2", "3", "", "3", "1", "3", "2", "4", "2", "3", "1", "3", "2", "4", "", "1", "3", "2", "", "", "1", "3", "2", "4", "2", "3", "1", "3", "2", "4", "", "13", "3", "1", "", "", "", "24", "1", "3", "2", "2", "4", "1", "3", "3", "", "2", "", "4", "1", "3", "2", "4", "1", "3", "2", "4", "2", "3", "1", "", "", "4", "2", "4", "2", "4", "2", "", "31", "4", "2", "3", "1", "3", "", "", "", "2", "", "4", "", "1", "", "1", "", "2", "3", "4", "3", "2", "", "1", "", "1", "", "23", "2", "3", "2", "3", "2", "4", "23", "23", "23", "23", "23", "23", "23", "24", "", "", "", "4", "3", "", "1", "31", "3", "", "", "2", "", "", "", "1", "2", "3", "4", "3", "2", "1", "2", "3", "4", "3", "2", "1", "2", "3", "4", "3", "", "", "", "2", "3", "", "", "", "14", "1", "4", "2", "3", "", "", "1", "3", "2", "4", "1", "3", "2", "3", "1", "4", "2", "3", "2", "", "", "", "", "", ""]
#var chart = ["1", "2"] #test
@export var vertical_mode = true

func _ready() -> void:
	if vertical_mode:
		$ZonePartition.rotation_degrees -= 90
	#play_song()
	
func play_song():
	## This will create a note each beat based on the chart var
	## uses a timer to wait between each note
	$clock.wait_time = 60 / bpm
	$clock.start()
	for i in chart:
		for j in i.split():
			find_child("ZonePartition").create_note(int(j))
			
		#wait between each note
		await $clock.timeout
		
	#when all notes are played
	print("song finished")
