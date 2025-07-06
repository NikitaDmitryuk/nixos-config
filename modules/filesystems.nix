{ config, pkgs, ... }:

{
  fileSystems."/mnt/D" = {
    device = "/dev/disk/by-label/D";
    fsType = "ntfs-3g";
    options = [
      "defaults"
      "uid=1000"
      "gid=100"
      "umask=002"
      "fmask=113"
      "dmask=002"
      "locale=ru_RU.UTF-8"
    ];
  };

  systemd.services.minidlna = {
    after   = [ "mnt-D.mount" ];
    requires = [ "mnt-D.mount" ];
  };
}
