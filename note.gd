extends Area2D
## script of each note that spawns, handles the player hitting or missing them

@export var vitesse = 100
var noteLabel = 0
var canBeHit = false
var hithit = false
var malus = false

func _ready() -> void:
	noteLabel = $sprite.frame
	print($sprite.frame)
	canBeHit = false

func _process(delta: float) -> void:
	global_position.x -= vitesse * delta

func _on_area_entered(area: Area2D) -> void:
	if area == get_parent(): #player can hit a note
		print("emit")
		canBeHit = true
		print("HitNote" + str(noteLabel))
	elif area ==  get_parent().find_child("NoteDespawnArea"): #player missed the note and it despawns
		print("despawn")
		get_parent().hit_miss()
		queue_free()
	
func _input(event: InputEvent) -> void:
	## player hits a note
	if canBeHit == true and Input.is_action_just_pressed("HitNote" + str(noteLabel)):
		get_parent().hit_success()
		queue_free()
