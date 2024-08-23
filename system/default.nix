{ inputs, ... }:
{
  imports = [
    ./hardware
    ./settings
    ./nixpkgs

    inputs.stylix.nixosModules.stylix
  ];

  disabledModules = [ ];
}
