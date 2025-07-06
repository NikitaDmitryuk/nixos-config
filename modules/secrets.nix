{ config, pkgs, agenix, ... }:

{
  age.secrets.userpassword = {
    file  = "./../secrets/userpassword.age";
    owner = "nikita";
    mode  = "0400";
  };
}
