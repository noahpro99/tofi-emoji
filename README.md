# tofi-emoji

<img alt="tofi-emoji picker" src="https://github.com/user-attachments/assets/6d18ee4d-d37b-4188-bca3-8430b07e65b8" />


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
