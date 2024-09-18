# Hackeroni Game Template

## Features

### Game

Game Autoload to change Scenes with transitions and parameters.

```gd
Game.change_scene("res://scenes/gameplay/gameplay.tscn", {kek = "lel"})
```

### Audio

Audio singleton to play a sound without the need to create a AudioStreamPlayer.

```gd
Audio.play(enter_sound_file.resource_path)
```

### Credits

Reads out the `ATTRIBUTIONS.md` and scrolls through the credits.

### Pause Layer

When added to a Scene and the `Pause` button is pressed the game will stop and the Pause Layer will be shown.

### Transitions

Scene with transition animations. Currently `fade-in` and `fade-out` available.

### Components

#### AnimationComponent

Add this to a node to create a Tween animation for the scale property.

#### HoverComponent

Add this to a node to add sounds to `mouse_enter`, `mouse_exited` and `pressed` events.

### Shaders

#### Scroll

Scrolls a `TextureRect` infinitely.

#### Blur

Blurs a `ColorRect`. Currently no Web support :( [Issue](https://github.com/godotengine/godot/issues/91717)

### Github Actions

Builds the project on push to main branch. Also has the ablility to deploy on itch.io

#### How to setup itch.io deployment

1. Get itch io API Key from [here](https://itch.io/user/settings/api-keys).
2. Create a new Project on itch.io and remember the last part of the url. E.g. `space-taxi`.
3. Go to `.github/workflows/export.yml` and set `ITCH_IO` to true.
4. Go to `Settings -> Secrets and variables -> Actions`.
5. Add the following secrets.

- `BUTLER_CREDENTIALS` = your itch.io API Key.
- `ITCH_GAME` = the last part of the project URl.
- `ITCH_USER` = your itch.io username.

#### Github Pages Deployent

This pipeline also deploys to Github Pages. Make sure the repository is public and the Github Pages are set to the branch set in the workflow.
