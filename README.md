# splitter

[![version](https://img.shields.io/badge/4.x-blue?logo=godot-engine&logoColor=white&label=godot&style=for-the-badge)](https://godotengine.org "Made with godot")
[![package](https://img.shields.io/npm/v/@bendn/splitter?label=version&style=for-the-badge)](https://www.npmjs.com/package/@bendn/remap)
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

## Installation

<details open>
  <summary><h3>With the Godot Package Manager</h3></summary>

> **Note** The information here may not be up to date. For most up to date information, see [gpm#using-packages](https://github.com/godot-package-manager#using-packages-quickstart)

> **Warning** This addon is not compatible with being used as a sub addon(a addon to another addon), as it uses classes.

This addon is installable via the [gpm](https://github.com/godot-package-manager).
To install, create a [`godot.package`](https://github.com/godot-package-manager#godotpackage) file.
It should look something like this.

```jsonc
packages: {
  @bendn/splitter: 1.0.1 // this is the package version.
}
```

Then download the [latest version](https://github.com/godot-package-manager/cli/releases/latest) of the [cli](https://github.com/godot-package-manager/cli#installation), move the executable to your `PATH` as `gpm` (`wget "https://github.com/godot-package-manager/cli/releases/latest/download/godot-package-manager.x86_64" -O /bin/gpm`).

And finally, to download[^1]:

```bash
gpm update # in the same dir as your godot.package
# or, if in a different dir,
# gpm update --config-file path-to-godot.package
```

</details>
<details>
  <summary><h3>Manually<h3></summary>

- Download the repo (`wget https://github.com/bend-n/splitter/archive/refs/heads/main.zip && unzip main.zip`).
- Move the `splitter-main/addons/splitter` folder into your `addons` folder (`mkdir addons && mv splitter-main/addons/splitter addons/`)

</details>

[^1]: [Usage instructions for the cli](https://github.com/godot-package-manager/cli#usage)
