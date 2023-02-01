extends Node
class_name Splitscreen

var players: Array[PlayerViewport] = []

func _ready() -> void:
	set_process(false)
	get_window().size_changed.connect(set_process.bind(true))

func _process(_delta: float) -> void:
	resize_players()
	set_process(false)

func resize_players():
	# plan:
	#┌----┐
	#├────┤
	#└────┘
	for p in players:
		p.player_count = len(players)
		p.resize_port(get_window().size)

func join() -> PlayerViewport:
	if len(players) > 3:
		push_error("no slots")
		return
	var player := PlayerViewport.new(len(players) + 1)
	player.name = "player %d" % (len(players) + 1)
	players.append(player)
	add_child(player)
	set_process(true)
	return player

func leave(id: int) -> void:
	var p := players.pop_at(4 - id)
	if p == null:
		push_error("no player")
		return
	p.kill()
	set_process(true)
