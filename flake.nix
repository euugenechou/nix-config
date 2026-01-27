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
            (final: prev: {
              rPackages =
                prev.rPackages
                // {
                  httpgd = prev.rPackages.buildRPackage {
                    name = "httpgd";

                    src = prev.fetchurl {
                      url = "https://cran.r-project.org/src/contrib/Archive/httpgd/httpgd_2.0.3.tar.gz";
                      sha256 = "sha256-vVp4T3zVR5v6KRMUiCy5/aLen0t+aX3ODl/99UBp6Qo=";
                    };

                    propagatedBuildInputs = with prev.rPackages; [
                      unigd
                      cpp11
                      AsioHeaders
                    ];
                  };
                };
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
