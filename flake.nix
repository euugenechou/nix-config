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

    verusfmt = {
      url = "path:./packages/verusfmt";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
    nixvim,
    home-manager,
    ...
  }: let
    mkDarwin = host:
      nix-darwin.lib.darwinSystem {
        specialArgs = {inherit self inputs;};
        modules = [
          home-manager.darwinModules.home-manager
          ./hosts/${host}
        ];
      };
    mkServer = system: username:
      home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {inherit system;};
        extraSpecialArgs = {inherit inputs username;};
        modules = [
          ./home/server.nix
        ];
      };
  in {
    darwinConfigurations = {
      cosmocanyon = mkDarwin "cosmocanyon";
    };
    homeConfigurations = {
      "eugebe@dennard" = mkServer "x86_64-linux" "eugebe";
      "eugebe@moore" = mkServer "x86_64-linux" "eugebe";
      "eugebe@xenon" = mkServer "x86_64-linux" "eugebe";
    };
  };
}
