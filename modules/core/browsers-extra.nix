{
  config,
  lib,
  pkgs,
  helium-browser,
  host,
  ...
}: let
  inherit (import ../../hosts/${host}/variables.nix) enableExtraBrowsers;
in {
  config = lib.mkIf enableExtraBrowsers {
    environment.systemPackages = with pkgs; [
      google-chrome # Google Chrome
      firefox # Mozilla Firefox
      helium-browser # Helium browser
    ];
  };
}
