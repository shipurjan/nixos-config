{ pkgs, inputs, ... }:
{
  nixpkgs.overlays = [
    inputs.nix-your-shell.overlays.default
  ];

  environment.systemPackages = [
    pkgs.nix-your-shell
  ];
}
