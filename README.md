# ❄️ My first NixOS system flake configuration

## Usage

### First setup

```sh
git clone https://github.com/shipurjan/nixos-config ~/.nix
sudo nixos-rebuild switch --flake ~/.nix
reboot
```

And after the reboot

```
rebuild
```

### Later on

Because of the aliases you can use either of these memorable control for NixOS and home-manager

```nix
ns = "sudo nixos-rebuild switch --flake ~/.nix"; # nix switch
nt = "sudo nixos-rebuild test --flake ~/.nix"; # nix test
hs = "home-manager switch --flake ~/.nix"; # home switch
rebuild = "ns && hs"; # both nix and home switch
```
