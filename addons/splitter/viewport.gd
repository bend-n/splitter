extends TextureRect
class_name PlayerViewport

var player_count: int
var viewport: Viewport
var id: int

func _init(_id: int) -> void:
	viewport = SubViewport.new()
	add_child(viewport)
	texture = viewport.get_texture()
	id = _id
	player_count = _id # id should be count + 1

## size this viewport
func _size(to: Vector2) -> void:
	viewport.size = to
	size = to

## resize this viewport to fit over [param area], while calculating the best positions.
func resize_port(area: Vector2) -> void:
	match player_count:
		1: _size(area)
		2: _size(Vector2(area.x, area.y / 2)) # split vertically instead of horizontally
		3: _size(Vector2(area.x, area.y / 2) if id == 3 else area / 2)
		4: _size(area / 2)
	if id == 1:
		global_position = Vector2.ZERO
	else:
		match player_count:
			3: match id:
				2: global_position = Vector2(area.x / 2, 0)
				3: global_position = Vector2(0, size.y)
			_: match id:
				2: global_position = Vector2(0, size.y)
				3: global_position = Vector2(area.x / 2, 0)
				4: global_position = size


func kill() -> void:
	viewport.queue_free()
	queue_free()
