# This file configures Nix and NixOS.

{
  nixpkgs.overlays = [ (import ../../pkgs/overlay.nix) ];
}
