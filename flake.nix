{
  description = "shipurjan's NixOS system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-unstable-small.url = "github:NixOS/nixpkgs/nixos-unstable-small";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    };

    stylix.url = "github:danth/stylix";

    nixvim-config = {
      url = "github:shipurjan/nixvim-config";
    };

    nix-your-shell = {
      url = "github:MercuryTechnologies/nix-your-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixos-unstable-small,
      ...
    }@inputs:
    let
      # TODO: remove nixos-unstable-small and this overlay
      # when https://github.com/hyprwm/xdg-desktop-portal-hyprland/issues/256
      # works on unstable
      unstable-small-pkgs = import nixos-unstable-small { inherit system; };
      xdphOverlay = final: prev: {
        inherit (unstable-small-pkgs) xdg-desktop-portal-hyprland;
      };
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [ xdphOverlay ];
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs system pkgs;
        };
        modules = [ ./system ];
      };

      homeConfigurations.cyprian = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          inherit inputs system;
        };
        modules = [ ./home ];
      };
    };
}
