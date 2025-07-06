extends Area2D
## script of each note that spawns, handles the player hitting or missing them

@export var vitesse = 400
var noteLabel = 0
var canBeHit = false
var hithit = false
var malus = false
var compte = true

func _ready() -> void:
	noteLabel = $sprite.frame
	canBeHit = false

func _process(delta: float) -> void:
	if get_parent().malus == 3:
		global_position.x -= vitesse * delta * randf_range(0.1, 2)
	else :
		global_position.x -= vitesse * delta

func _on_area_entered(area: Area2D) -> void:
	if area == get_parent(): #player can hit a note
		canBeHit = true
	elif area ==  get_parent().find_child("NoteDespawnArea"): #player missed the note and it despawns
		if compte == true :
			get_parent().hit_miss()
		queue_free()
	
func _input(event: InputEvent) -> void:
	## player hits a note
	if canBeHit == true and Input.is_action_just_pressed("HitNote" + str(noteLabel)):
		if compte == true:
			get_parent().hit_success()
		queue_free()
		
func _on_malus_timer_timeout() -> void:
	print("timer stop")
	get_parent().malus = 0
