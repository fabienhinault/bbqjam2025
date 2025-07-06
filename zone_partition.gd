extends Area2D
@export var noteScene : PackedScene
var score = 0
var drink = false
var taux_alcoolémie = 0
var hit_daffilé = 0
var malus = 0
var compte = true
var nmbr_miss = 0


func create_note(noteLabel):
	if noteLabel == 0 : #if no note in chart, donùt try to spawn ghost note
		if malus == 4 :
			noteLabel = randi_range(1, 4)
			var note:Area2D = noteScene.instantiate()
			var note_sprite = note.find_child("sprite") # le animatedsprite de la note
			note_sprite.frame = noteLabel # set to correct color
			add_child(note)
			note.global_position = find_child("NoteSpawn" + str(noteLabel)).global_position
			note.modulate.a = 0.3
			note.compte = false
		return
	## create note
	var note:Area2D = noteScene.instantiate()
	var note_sprite = note.find_child("sprite") # le animatedsprite de la note
	note_sprite.frame = noteLabel # set to correct color
	add_child(note)
	note.global_position = find_child("NoteSpawn" + str(noteLabel)).global_position
	if malus == 2 :
		note.global_position = find_child("NoteSpawn" + str(randi_range(1,4))).global_position
	if malus == 1 :
		var note2:Area2D = noteScene.instantiate()
		note2.find_child("sprite").frame = noteLabel # set to correct color
		note2.modulate.a = 0.5
		note2.compte = false
		add_child(note2)
		note2.global_position = find_child("NoteSpawn" + str(randi_range(1,4))).global_position


func _on_test_timer_timeout() -> void:
	if drink == false :
		create_note(randi_range(1, 4))
	else :
		create_note(5)
	
func hit_success():
	score += 10
	$score.text = str("Score: ", score)
	hit_daffilé += 1
	
func hit_miss():
	score -= 10
	$score.text = str("Score: ", score)
	hit_daffilé = 0
	nmbr_miss += 1

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("GetDrunk") and hit_daffilé >= 10:
		score += 100
		hit_daffilé = 0
		$score.text = str(score)
		taux_alcoolémie += 1


func _on_alcool_timer_timeout() -> void:
	drink = false
	$Sprite2D.frame = 0
	taux_alcoolémie += 1


func _on_effettimer_timeout() -> void:
	var effet = randi_range(1,10)
	if effet < taux_alcoolémie :
		malus = randi_range(1,4)
	else:
		malus = 0
