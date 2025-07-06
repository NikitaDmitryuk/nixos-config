{ config, pkgs, ... }:

{
  networking.firewall.enable       = true;
  networking.firewall.allowedTCPPorts = [ 8200 ];
  networking.firewall.allowedUDPPorts = [ 1900 ];
}
