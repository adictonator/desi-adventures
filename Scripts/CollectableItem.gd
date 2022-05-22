class_name CollectableItem extends Area2D

onready var player = get_viewport().get_node('Level1/Player')
onready var soundEffect = $SoundEffect
onready var item

export (float, 1, 1000) var frequency = 15
export (float, 1000) var amplitude = 10
var time = 0

func _onPlayerInteracted(body:Node) -> void:
	# Disable collison.
	set_collision_layer_bit(2, false)
	# Play soundeffect.
	soundEffect.play()
	# Update the HUD value.
	player[item] += 1


func _physics_process(delta):
	time += delta * 0.5
	var movement = cos(time*frequency)*amplitude
	position.y += movement * delta


func _onSoundEffectFinished() -> void:
	queue_free()
