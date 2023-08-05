extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"Durability Bar".value = $"../Player".durability*100/($"../Player".max_durability)
	$"Enemies Left Label".text = str($"../Waves".enemies)
	$"Waves Label".bbcode_text = "[right]" + "Wave " + str($"../Waves".wave) + " [/right]"
	$"Score Label".bbcode_text = "[center]" + str($"../Waves".score) + " [/center]"
