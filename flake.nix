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
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nixvim }:
    let
      mkDarwin = (config:
        nix-darwin.lib.darwinSystem {
          specialArgs = { inherit self; };
          modules = [
            config
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                verbose = true;
                extraSpecialArgs = { inherit inputs; };
                users.eugene = import ./home-manager/darwin.nix;
              };
            }
          ];
        });
      mkHome = (system: username:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          extraSpecialArgs = {
            inherit inputs;
            inherit username;
          };
          modules = [ ./home-manager/linux-server.nix ];
        });
    in {
      darwinConfigurations = {
        cosmocanyon = mkDarwin ./darwin/cosmocanyon.nix;
      };
      homeConfigurations = {
        "euchou@dennard" = mkHome "x86_64-linux" "euchou";
      };
    };
}
