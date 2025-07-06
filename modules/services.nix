{ config, pkgs, ... }:

{
  services.printing.enable = true;

  services.pipewire = {
    enable        = true;
    alsa.enable   = true;
    alsa.support32Bit = true;
    pulse.enable  = true;
  };
  security.rtkit.enable = true;

  services.minidlna.enable = true;
  services.minidlna.settings = {
    media_dir = [ "V,/mnt/D/LG" ];
  };

  services.openssh.enable = true;
}
