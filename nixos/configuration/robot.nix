# This file configures robot-specific software.

{ pkgs, ... }:

{
  systemd.services.robotd = let
    pythonWithRobotd = pkgs.python35.withPackages (pyPkgs: [ pkgs.robotd ]);
  in {
    description = "Provide access to robot peripherals";
    script = "${pythonWithRobotd}/bin/python -u -m robotd.master";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "notify";
      NotifyAccess = "all";
      KillMode = "mixed";
      KillSignal = "SIGINT";
      TimeoutStopSec = 5;
    };
  };
}
