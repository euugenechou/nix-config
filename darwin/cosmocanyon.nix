{ ... }: {
  imports = [ ./common.nix ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.eugene = {
    name = "eugene";
    home = "/Users/eugene";
  };
}
