#!/usr/bin/env bash
set -euo pipefail
nix develop .#default --command shellcheck scripts/tofi-emoji scripts/build-emoji-cache
echo OK
