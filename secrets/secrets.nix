let
  # из ~/.ssh/id_ed25519.pub
  user-key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJLmjIhXHZsgbJLBbY9zeB0jKxkM9eoBKV0YWRkdfrw+ nikita@nixos";

  # Публичный ключ хоста (из /etc/ssh/ssh_host_ed25519_key.pub)
  host-key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGTH4CYJlNuae7apyTtNSUy+ElKVczG18SOo2Ab/BY5o root@nixos";
in
{
  "userpassword.age".publicKeys = [ user-key host-key ];
}
