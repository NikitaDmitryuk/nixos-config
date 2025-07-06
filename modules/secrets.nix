{ config, pkgs, agenix, ... }:

{
  config.age.secrets.userpassword = {
    file  = ./../secrets/userpassword.age;
    owner = "nikita";
    mode  = "0400";
  };
}
