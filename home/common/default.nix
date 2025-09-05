{inputs, ...}: {
  imports = [
    inputs.nixvim.homeModules.nixvim

    ./nvim
    ./fzf.nix
  ];
}
