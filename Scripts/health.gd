extends Node

var health
var ammo
var ammo_max
var wall_jump = false
var dash = false
var double_jump = false

var sound

func _ready():
	health = 1
	ammo = 0

func change_health(amount):
	health -= amount
	print(health)
	if health == 0:
		sound = SoundPlayer.play_sound_effect("death")
		get_tree().reload_current_scene()
		health = 1

func change_ammo(amount):
	ammo += amount
	ammo = clamp(ammo, 0, ammo_max)

func get_health():
	
	return health

func get_ammo():
	return ammo
