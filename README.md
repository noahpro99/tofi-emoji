# tofi-emoji

Clipboard-only emoji picker powered by `tofi`. Picks a glyph and copies it via `wl-copy`. You can use the same arguments as `tofi` to customize the appearance and behavior.

## Build

```
nix build .#tofi-emoji
```

## Run

```
nix run .#tofi-emoji
```

## Hyprland bind

```
bind = SUPER, E, exec, tofi-emoji
```
