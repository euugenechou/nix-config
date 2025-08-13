{
  description = "Nix flake for liebharc/homr";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    # Last working commit from nixos-small-unstable
    nixpkgs.url = "github:NixOS/nixpkgs-unstable";
    poetry2nix = {
      url = "github:nix-community/poetry2nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    poetry2nix,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        src = pkgs.fetchFromGitHub {
          owner = "liebharc";
          repo = "homr";
          rev = "3a2ddf4196202e82ec4619ffaa8dc1b5628871be";
          sha256 = "sha256-J3Um169kiL9RI1u0xbX3FmKiGHl3O3rfZFs7uWvD9NU=";
        };

        # see https://github.com/nix-community/poetry2nix/tree/master#api for more functions and examples.
        homr = {
          poetry2nix,
          lib,
        }:
          poetry2nix.mkPoetryApplication {
            projectDir = src;
            overrides = poetry2nix.overrides.withDefaults (
              final: super:
                lib.mapAttrs
                (attr: systems:
                  super.${attr}.overridePythonAttrs
                  (old: {
                    nativeBuildInputs = (old.nativeBuildInputs or []) ++ map (a: final.${a}) systems;
                  }))
                {
                  # https://github.com/nix-community/poetry2nix/blob/master/docs/edgecases.md#modulenotfounderror-no-module-named-packagename
                  # package = [ "setuptools" ];
                }
            );
          };
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            poetry2nix.overlays.default
            (final: _: {
              homr = final.callPackage homr {};
            })
          ];
        };
      in {
        packages.default = pkgs.homr;
        devShells = {
          # Shell for app dependencies.
          #
          #     nix develop
          #
          # Use this shell for developing your app.
          default = pkgs.mkShell {
            inputsFrom = [pkgs.homr];
          };

          # Shell for poetry.
          #
          #     nix develop .#poetry
          #
          # Use this shell for changes to pyproject.toml and poetry.lock.
          poetry = pkgs.mkShell {
            packages = [pkgs.poetry];
          };
        };
        legacyPackages = pkgs;
      }
    );
}
