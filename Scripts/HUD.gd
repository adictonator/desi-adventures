extends CanvasLayer

onready var player = get_node('../Player')
onready var HealthBar = $GUIWrapper/PlayerStat/StatContainer/Panel/VBoxContainer/HealthBar
onready var StaminaBar = $GUIWrapper/PlayerStat/StatContainer/Panel/VBoxContainer/StaminaBar
var health : int = 0

func _ready() -> void:
	HealthBar.set_value(player.health)
	StaminaBar.set_value(player.stamina)

func _process(delta: float) -> void:
	HealthBar.set_value(player.health)
	StaminaBar.set_value(player.stamina)
