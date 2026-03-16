{
  description = "eugene's nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";

    nix-darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pwndbg = {
      url = "github:pwndbg/pwndbg";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
    nixvim,
    home-manager,
    pwndbg,
    ...
  }: let
    old-nixpkgs-src = builtins.fetchGit {
      # Descriptive name to make the store path easier to identify
      name = "my-old-revision";
      url = "https://github.com/NixOS/nixpkgs/";
      ref = "refs/heads/nixpkgs-unstable";
      rev = "21808d22b1cda1898b71cf1a1beb524a97add2c4";
    };

    old-pkgs = import old-nixpkgs-src {
      system = "x86_64-linux";
    };

    temurin-bin-23 = old-pkgs.temurin-bin-23;

    mkDarwin = host:
      nix-darwin.lib.darwinSystem {
        specialArgs = {inherit self inputs;};
        modules = [home-manager.darwinModules.home-manager ./hosts/${host}];
      };
    mkServer = system: username: host:
      home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            (import ./overlays/r.nix)
            (final: prev: {
              inherit temurin-bin-23;
              pwndbg = pwndbg.packages.${system}.default;
            })
          ];
        };
        extraSpecialArgs = {inherit inputs username;};
        modules = [./hosts/${host}];
      };
  in {
    darwinConfigurations = {
      cosmocanyon = mkDarwin "cosmocanyon";
      gongaga = mkDarwin "gongaga";
    };
    homeConfigurations = {
      "eugebe@dennard" = mkServer "x86_64-linux" "eugebe" "dennard";
      "eugebe@moore" = mkServer "x86_64-linux" "eugebe" "moore";
      "eugebe@xenon" = mkServer "x86_64-linux" "eugebe" "xenon";
    };
  };
}
