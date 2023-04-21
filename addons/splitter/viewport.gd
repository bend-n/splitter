extends TextureRect
class_name PlayerViewport

var player_count: int
var viewport: Viewport
var id: int
var scal := 1.0

func _init(_id: int, _scale: float) -> void:
	viewport = SubViewport.new()
	add_child(viewport)
	texture = viewport.get_texture()
	id = _id
	scal = _scale
	player_count = _id # id should be count + 1

## size this viewport
func _size(to: Vector2) -> void:
	viewport.size = to * scal
	size = to

## resize this viewport to fit over [param area], while calculating the best positions.
func resize_port(area: Vector2) -> void:
	match player_count:
		1: _size(area)
		2: _size(Vector2(area.x, area.y / 2)) # split vertically instead of horizontally
		3: _size(Vector2(area.x, area.y / 2) if id == 3 else area / 2)
		4: _size(area / 2)
		5: _size(area / 2 if id == 5 or id == 4 else Vector2(area.x / 3, area.y / 2))
		6: _size(Vector2(area.x / 3, area.y / 2))
	if id == 1:
		global_position = Vector2.ZERO
	else:
		match player_count:
			2, 4: match id:
				2: global_position = Vector2(0, size.y)
				3: global_position = Vector2(area.x / 2, 0)
				4: global_position = size
			3: match id:
				2: global_position = Vector2(area.x / 2, 0)
				3: global_position = Vector2(0, size.y)
			5: match id:
				2: global_position = Vector2(size.x, 0)
				3: global_position = Vector2(size.x * 2, 0)
				4: global_position = Vector2(0, size.y)
				5: global_position = size
			6: match id:
				2: global_position = Vector2(0, size.y)
				3: global_position = Vector2(size.x, 0)
				4: global_position = size
				5: global_position = Vector2(size.x * 2, 0)
				6: global_position = Vector2(size.x * 2, size.y)


func kill() -> void:
	viewport.queue_free()
	queue_free()
