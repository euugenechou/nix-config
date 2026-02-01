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
