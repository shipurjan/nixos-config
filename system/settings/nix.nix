{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  mappedRegistry = lib.pipe inputs [
    (lib.filterAttrs (_: lib.isType "flake"))
    (lib.mapAttrs (_: flake: { inherit flake; }))
    (x: x // { nixpkgs.flake = inputs.nixpkgs; })
  ];
in
{
  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well
    nixPath = lib.mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;

    optimise.automatic = pkgs.stdenv.isLinux;

    # pin the registry to avoid downloading and evaluating a new nixpkgs version every time
    # this will add each flake input as a registry to make nix3 commands consistent with your flake
    registry = mappedRegistry;

    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      experimental-features = "nix-command flakes";
      flake-registry = "/etc/nix/registry.json";
      http-connections = 50;
      keep-derivations = true;
      keep-going = true;
      keep-outputs = true;
      log-lines = 200;
      sandbox = true;
      warn-dirty = false;

      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
        "https://anyrun.cachix.org"
        "https://hyprland.cachix.org"
        "https://nix-gaming.cachix.org"
        "https://nixpkgs-wayland.cachix.org"
        "https://nixpkgs-unfree.cachix.org"
        "https://numtide.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
        "nixpkgs-unfree.cachix.org-1:hqvoInulhbV4nJ9yJOEr+4wxhDV4xq2d1DK7S6Nj6rs="
        "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
      ];
    };
  };
}
