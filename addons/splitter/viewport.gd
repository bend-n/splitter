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

func size_port(to: Vector2) -> void:
	viewport.size = to
	size = to
	global_position = Vector2.ZERO if id == 1 else Vector2(0, size.y)

func kill() -> void:
	viewport.queue_free()
	queue_free()