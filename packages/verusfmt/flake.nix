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
        packages.verusfmt = rustPlatform.buildRustPackage rec {
          pname = "verusfmt";
          version = "0.5.7";

          src = pkgs.fetchFromGitHub {
            owner = "verus-lang";
            repo = "verusfmt";
            rev = "refs/tags/v${version}";
            sha256 = "sha256-qsJOJs1im4Alzp3Jw9TMsTTBlrBLCL30vE27/QUjVOk=";
          };

          cargoHash = "sha256-ZQWNEyJdG5CFUvpd27HbXEuTPw4c/3vVA2GbquVTAHw=";

          nativeBuildInputs = [pkgs.rustfmt];
        };

        defaultPackage = self.packages.${system}.verusfmt;
      }
    );
}
