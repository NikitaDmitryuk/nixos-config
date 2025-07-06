{ config, pkgs, ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Пример Proxy
  # networking.proxy.default  = "http://user:pass@proxy:port/";
  # networking.proxy.noProxy  = "127.0.0.1,localhost";
}
