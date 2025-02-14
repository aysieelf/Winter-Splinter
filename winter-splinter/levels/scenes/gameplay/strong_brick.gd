extends StaticBody2D

var max_health = Constants.STRONG_BRICK_MAX_HEALTH
var current_health = max_health

func _ready() -> void:
	reset_brick()

func take_damage(damage):
	current_health -= damage
	if current_health == 2:
		SoundManager.play_sfx("snowball-bounce")
		$HealthBreakTwo.visible = true
	elif current_health == 1:
		SoundManager.play_sfx("snowball-bounce")
		$HealthBreakOne.visible = true
	elif current_health <= 0:
		$BrickBreak.emitting = true
		$BrickBreak.process_mode = Node.PROCESS_MODE_ALWAYS
		$BrickBreak.reparent(get_parent()) 
		SoundManager.play_sfx("brick-break")
		queue_free() 
		
func reset_brick() -> void:
	$HealthBreakTwo.visible = false
	$HealthBreakOne.visible = false
