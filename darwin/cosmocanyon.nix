{...}: {
  imports = [./common.nix];

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfree = true;
  };

  users.users.eugene = {
    name = "eugene";
    home = "/Users/eugene";
  };
}
