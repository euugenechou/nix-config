{
  description = "Nix flake for verus-lang/verusfmt";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
        rustPlatform = pkgs.rustPlatform;
      in {
        packages.verusfmt = rustPlatform.buildRustPackage {
          pname = "verusfmt";
          version = "0.5.7";

          src = pkgs.fetchFromGitHub {
            owner = "verus-lang";
            repo = "verusfmt";
            rev = "v0.5.7";
            sha256 = "0000000000000000000000000000000000000000000000000000";
          };

          cargoHash = "0000000000000000000000000000000000000000000000000000";
        };

        defaultPackage = self.packages.${system}.verusfmt;
      }
    );
}
