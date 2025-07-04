extends Node2D

func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("HitNote1"):
		hit_note(1)
	if Input.is_action_just_pressed("HitNote2"):
		hit_note(2)
	if Input.is_action_just_pressed("HitNote3"):
		hit_note(3)
	if Input.is_action_just_pressed("HitNote4"):
		hit_note(4)
	
	if Input.is_action_just_released("HitNote1"):
		release_note(1)
	if Input.is_action_just_released("HitNote2"):
		release_note(2)
	if Input.is_action_just_released("HitNote3"):
		release_note(3)
	if Input.is_action_just_released("HitNote4"):
		release_note(4)
	

func hit_note(note): #player hits a button
	var note_button = get_note_button_node(note)
	note_button.frame = 1 #change sprite
	
func release_note(note): #player releases a button
	var note_button = get_note_button_node(note)
	note_button.frame = 0
	
func get_note_button_node(note): # get the Note button node based on number
	var note_button:AnimatedSprite2D = find_child(str("Note", note))
	return note_button
