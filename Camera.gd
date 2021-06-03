extends Camera

var camera_pos = Vector3.ZERO
var camera_follow = true
onready var player_follow = get_parent().get_node("Player")

func _process(delta):
	if camera_follow:
		camera_pos.z= player_follow.translation.z
		camera_pos.y = player_follow.translation.y + 3
		camera_pos.x= get_translation().x
		set_translation(camera_pos)
	else:
		camera_pos.y = player_follow.translation.y + 3
		camera_pos.x= get_translation().x
		set_translation(camera_pos)
