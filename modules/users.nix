{ config, pkgs, ... }:

{
  users.users.nikita = {
    isNormalUser      = true;
    description       = "Nikita";
    extraGroups       = [ "networkmanager" "wheel" ];
    hashedPasswordFile = config.age.secrets.userpassword.path;

    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
