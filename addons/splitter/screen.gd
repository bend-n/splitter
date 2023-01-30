extends Node
class_name Splitscreen

var players: Array[PlayerViewport] = []

func _ready() -> void:
    get_window().size_changed.connect(resize_players)

func resize_players():
    # plan:
    #┌----┐
    #├────┤
    #└────┘
    var size := Vector2(get_window().size) if len(players) == 1 else Vector2(get_window().size.x, get_window().size.y / 2.0)
    for p in players:
        p.player_count = len(players)
        p.size_port(size)

func join() -> Viewport:
    if len(players) > 1:
        push_error("no slots")
        return

    var player := PlayerViewport.new(len(players) + 1)
    player.name = "player %d" % (len(players) + 1)
    players.append(player)
    add_child(player)
    resize_players()
    return player.viewport # so you can add a camera

func leave(id: int) -> void:
    var p := players.pop_at(id)
    if p == null:
        push_error("no player")
        return
    p.kill()
    resize_players()
