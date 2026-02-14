{
  self,
  inputs,
  ...
}: let
  username = "eugene";
  hostname = "cosmocanyon";
in {
  imports = [
    ../../modules/darwin/common.nix
  ];

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfree = true;
  };

  networking.hostName = hostname;

  system = {
    primaryUser = username;
    configurationRevision = self.rev or self.dirtyRev or null;
    stateVersion = 5;
  };

  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    verbose = true;
    extraSpecialArgs = {inherit inputs;};
    users.${username} = import ../../home/darwin.nix;
  };
}
