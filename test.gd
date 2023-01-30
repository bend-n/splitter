extends Splitscreen

func _ready() -> void:
	super()
	var cam := Camera3D.new()
	join().add_child(cam)
	await get_tree().create_timer(1).timeout
	cam = Camera3D.new()
	join().add_child(cam)