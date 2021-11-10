extends Node

onready var cheat_code = []
onready var music = AudioStreamPlayer.new()

#This creates dictionary for music track sounds.
var music_tracks = {

}

#This creates a dictionary for sound effects.
var sound_effects = {
	"do_dash":"res://SoundFiles/fire_dash_crisp.wav",
}

#This checks the inputs for cheatcodes that change the sound effects.
func _unhandled_key_input(event):
	if event.pressed:
		cheat_code.append(event.scancode)
		print(cheat_code.slice(-3,-1))
	if cheat_code.slice(-8,-1) == [73,76,79,86,69,89,79,85]:
		sound_effects.accelerate = "res://Music & SFX/meme_revised.mp3"
	if cheat_code.slice(-5,-1) == [83,72,82,69,75]:
		sound_effects.accelerate = "res://Music & SFX/Shrek Argues with Obi-Wan on Mustafar.wav"
	if cheat_code.slice(-3,-1) == [80,69,84]:
		music.stream = load("res://Music & SFX/WonderPets.wav")
#Volume
var music_db = 1
var sound_db = 1

func change_music_db(val):
	music_db = linear2db(val)

func change_sound_db(val):
	sound_db = linear2db(val)
#This plays the music.
#func _ready():
	#music.stream = load(music_tracks[""])
	#add_child(music)
	#music.play()
	#print(music.stream)
	#print("playing music")

#This plays sound effects.
func play_sound_effect(sfx):
	var sound = AudioStreamPlayer.new()
	sound.stream = load(sound_effects[sfx])
	add_child(sound)
	sound.play()
	
	yield(sound,"finished")
	sound.queue_free()
	#return sound
