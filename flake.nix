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

    # homr = {
    #   url = "path:./packages/homr";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
    home-manager,
    ...
  }: let
    mkDarwin = config:
      nix-darwin.lib.darwinSystem {
        specialArgs = {inherit self;};
        modules = [
          config
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              verbose = true;
              extraSpecialArgs = {inherit inputs;};
              users.eugene = import ./home-manager/darwin.nix;
            };
          }
        ];
      };
    mkNixos = system: hostname: username:
      nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/${hostname}/configuration.nix
          ./hosts/${hostname}/hardware-configuration.nix
          home-manager.nixosModules.home-manager 
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              verbose = true;
              extraSpecialArgs = {inherit inputs username;};
              users.${username} = import ./home-manager/server.nix;
            };
          }
        ];
      };
    mkServer = system: username:
      home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
        };
        extraSpecialArgs = {
          inherit inputs;
          inherit username;
        };
        modules = [./home-manager/server.nix];
      };
  in {
    nixosConfigurations = {
      nixos = mkNixos "x86_64-linux" "nixos" "eugene";
    };
    darwinConfigurations = {
      cosmocanyon = mkDarwin ./darwin/cosmocanyon.nix;
    };
    homeConfigurations = {
      "euchou@dennard" = mkServer "x86_64-linux" "euchou";
      "euchou@banana" = mkServer "x86_64-linux" "euchou";
      "euchou@obliviate" = mkServer "aarch64-linux" "euchou";
    };
  };
}
