extends Splitscreen

func _ready() -> void:
	super()
	for i in 6:
		var cam := Camera3D.new()
		var p := join()
		p.viewport.add_child(cam)
		var l := Label.new(); l.position += Vector2.ONE * 10; l.add_theme_font_size_override("font_size", 20); l.text = str(p.id)
		p.add_child(l)
		await get_tree().create_timer(1).timeout
	for i in 6:
		await get_tree().create_timer(2).timeout
		leave()
	get_tree().quit()
