{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    vscode
    google-chrome
    curl
    emacs
    git
    telegram-desktop
    gparted
    ntfs3g
    minidlna
    firefox
    agenix
  ];
}
