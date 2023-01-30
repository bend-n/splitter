# splitter

[![version](https://img.shields.io/badge/4.x-blue?logo=godot-engine&logoColor=white&label=godot&style=for-the-badge)](https://godotengine.org "Made with godot")
<a href='https://ko-fi.com/bendn' title='Buy me a coffee' target='_blank'><img height='28' src='https://storage.ko-fi.com/cdn/brandasset/kofi_button_red.png' alt='Buy me a coffee'> </a>

Small addon for multiplayer splitscreen

[![image](https://raw.githubusercontent.com/bend-n/splitter/main/.github/image.png)](_blank "Picture!")

## Usage

```GDScript
extends Splitscreen

func _ready() -> void:
  super()
  var cam := Camera3D.new()
  join().add_child(cam)
  await get_tree().create_timer(1).timeout
  cam = Camera3D.new()
  join().add_child(cam)
```
