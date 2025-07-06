extends Node2D

var pressed4 = false
var pressed3 = false
var pressed2 = false
var pressed1 = false

@onready var jmj:AnimatedSprite2D = get_parent().get_parent().find_child("jmj")

func _ready() -> void:
	disable_drunk_effect()


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("HitNote1"):
		hit_note(1)
		pressed4 = true
	if Input.is_action_just_pressed("HitNote2"):
		hit_note(2)
		pressed3 = true
	if Input.is_action_just_pressed("HitNote3"):
		hit_note(3)
		pressed1 = true
	if Input.is_action_just_pressed("HitNote4"):
		hit_note(4)
		pressed2 = true
	
	if Input.is_action_just_released("HitNote1"):
		release_note(1)
		pressed4 = false
	if Input.is_action_just_released("HitNote2"):
		release_note(2)
		pressed3 = false
	if Input.is_action_just_released("HitNote3"):
		release_note(3)
		pressed2 = false
	if Input.is_action_just_released("HitNote4"):
		release_note(4)
		pressed1 = false
	if get_parent().drink == true:
		$AlcoolTimer.start()
		enable_drunk_effect()

func hit_note(note): #player hits a button
	jmj.frame = 1
	var note_button = get_note_button_node(note)
	note_button.frame = 1 #change sprite
	$NoteA.frame = 1
	
func release_note(note): #player releases a button
	jmj.frame = 0
	var note_button = get_note_button_node(note)
	note_button.frame = 0
	$NoteA.frame = 0
	
func get_note_button_node(note): # get the Note button node based on number
	var note_button:AnimatedSprite2D = find_child(str("Note", note))
	return note_button


func _on_alcool_timer_timeout() -> void:
	disable_drunk_effect()

func disable_drunk_effect():
	$NoteA.hide()
	$Note1.show()
	$Note2.show()
	$Note3.show()
	$Note4.show()

func enable_drunk_effect() :
	jmj.frame = 2
	$NoteA.show()
	$Note1.hide()
	$Note2.hide()
	$Note3.hide()
	$Note4.hide()
