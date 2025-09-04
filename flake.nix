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

    verus = {
      url = "path:./packages/verus";
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
    home-manager,
    ...
  }: let
    mkDarwin = config: username:
      nix-darwin.lib.darwinSystem {
        specialArgs = {inherit self username;};
        modules = [
          config
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              verbose = true;
              extraSpecialArgs = {inherit inputs;};
              users.${username} = import ./home-manager/darwin.nix;
            };
          }
        ];
      };
    mkServer = system: username:
      home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {inherit system;};
        extraSpecialArgs = {inherit inputs username;};
        modules = [./home-manager/server.nix];
      };
  in {
    darwinConfigurations = {
      cosmocanyon = mkDarwin ./darwin/cosmocanyon.nix "eugene";
    };
    homeConfigurations = {
      "euchou@dennard" = mkServer "x86_64-linux" "euchou";
      "euchou@banana" = mkServer "x86_64-linux" "euchou";
      "euchou@obliviate" = mkServer "aarch64-linux" "euchou";
    };
  };
}
