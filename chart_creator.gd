extends Control

@export var bpm:float
var chart = []
var buffer = ""
var finish = false

func _ready() -> void:
	$clock.wait_time = 60 / bpm
	$clock.start()
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("HitNote1") and not "1" in buffer:
		buffer += "1"
	if Input.is_action_just_pressed("HitNote2") and not "2" in buffer:
		buffer += "2"
	if Input.is_action_just_pressed("HitNote3") and not "3" in buffer:
		buffer += "3"
	if Input.is_action_just_pressed("HitNote4") and not "4" in buffer:
		buffer += "4"
	

func play_note() -> void:
		chart.append(buffer)
		buffer = ""

func _on_button_pressed() -> void:
	chart.append(buffer)
	print("here is your chart:   ")
	print(chart)
