{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/bootloader.nix
      ./modules/networking.nix
      ./modules/firewall.nix
      ./modules/vpn.nix
      ./modules/internationalisation.nix
      ./modules/desktop.nix
      ./modules/services.nix
      ./modules/users.nix
      ./modules/environment.nix
      ./modules/filesystems.nix
      ./modules/secrets.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";
}
