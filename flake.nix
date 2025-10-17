{
  description = "tofi-emoji: tiny emoji picker for Wayland (clipboard only)";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
  let
    systems = [ "x86_64-linux" "aarch64-linux" ];
    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
  in {
    packages = forAllSystems (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        default = pkgs.callPackage ./pkgs/tofi-emoji.nix { };
        tofi-emoji = self.packages.${system}.default;
      });

    apps = forAllSystems (system: {
      default = {
        type = "app";
        program = "${self.packages.${system}.tofi-emoji}/bin/tofi-emoji";
      };
    });

    devShells = forAllSystems (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        default = pkgs.mkShell { nativeBuildInputs = with pkgs; [ shellcheck shfmt ]; };
      });

    overlays.default = final: prev: {
      tofi-emoji = final.callPackage ./pkgs/tofi-emoji.nix { };
    };
  };
}
