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
        old_pkgs = import (builtins.fetchGit {
          name = "my-old-revision";
          url = "https://github.com/NixOS/nixpkgs/";
          ref = "refs/heads/nixpkgs-25.05-darwin";
          rev = "8374ab2113c7522766acf5ab1af9d8c6824c06d4";
        }) {};

        version = "release/0.2025.07.05.8bd7c32";
      in {
        packages.verus = pkgs.stdenv.mkDerivation rec {
          pname = "verus";
          version = "release/0.2025.07.05.8bd7c32";
          src = pkgs.fetchFromGitHub {
            owner = "verus-lang";
            repo = "verus";
            rev = "refs/tags/${version}";
            sha256 = "sha256-6uPDQVYLprnm/1dI3aBGxBr/kM02W2x/CuZUxeS/keo=";
          };

          nativeBuildInputs = [pkgs.rustup old_pkgs.z3_4_12 pkgs.which pkgs.zlib];

          buildPhase = ''
            HOME=$PWD
            cd source
            ln -sf $(which z3) .
            source ../tools/activate
            vargo build --release
          '';

          installPhase = ''
            mkdir -p $out/bin
            cp target/release/cargo-verus $out/bin/
            cp target/release/rust_verify $out/bin/
            cp target/release/verus $out/bin/
          '';
        };

        defaultPackage = self.packages.${system}.verus;
      }
    );
}
