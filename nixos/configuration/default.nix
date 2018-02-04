# This is the top-level configuration module (the equivalent of
# /etc/nixos/configuration.nix on a typical system).

{
  imports = [
    ./nix.nix
    ./robot.nix
  ];

  # Temporary
  users.mutableUsers = false;
  users.users.root.password = "toor";
}
