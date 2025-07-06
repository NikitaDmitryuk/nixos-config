{ config, pkgs, ... }:

{
  # Пример для WireGuard
  # services.wireguard.enable = true;
  # networking.wireguard.interfaces = {
  #   wg0 = {
  #     address = [ "10.0.0.2/24" ];
  #     privateKeyFile = "/etc/wireguard/privatekey";
  #     peers = [ { publicKey = "..."; allowedIPs = [ "0.0.0.0/0" ]; } ];
  #   };
  # };
}
