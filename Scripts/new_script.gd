extends Node

var health
var ammo
var ammo_max

func _ready():
	health = 1
	ammo = 0

func change_health(amount):
	health += amount

func change_ammo(amount):
	ammo += amount
	ammo = clamp(ammo, 0, ammo_max)

func get_health():
	return health

func get_ammo():
	return ammo
