{
  config,
  lib,
  pkgs,
  host,
  ...
}:
let
  inherit (import ../../hosts/${host}/variables.nix) enableExtraBrowsers;
in
{
  config = lib.mkIf enableExtraBrowsers {
    environment.systemPackages = [
      pkgs.google-chrome # Google Chrome
      pkgs.firefox # Mozilla Firefox
    ];
  };
}
