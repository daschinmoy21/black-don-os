{
  pkgs,
  host,
  lib,
  ...
}: let
  inherit (import ../../hosts/${host}/variables.nix) stylixImage stylixEnable;
in
  lib.mkIf stylixEnable {
    # Styling Options
    stylix = {
      enable = true;
      image = stylixImage;
      base16Scheme = {
        base00 = "1C2023";
        base01 = "393F45";
        base02 = "565E65";
        base03 = "747C84";
        base04 = "ADB3BA";
        base05 = "C7CCD1";
        base06 = "DFE2E5";
        base07 = "F3F4F5";
        base08 = "C7AE95";
        base09 = "C7C795";
        base0A = "AEC795";
        base0B = "95C7AE";
        base0C = "95AEC7";
        base0D = "AE95C7";
        base0E = "C795AE";
        base0F = "C79595";
      };
      polarity = "dark";
      opacity.terminal = 0.89;
      cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
        size = 24;
      };
      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrains Mono";
        };
        sansSerif = {
          package = pkgs.montserrat;
          name = "Montserrat";
        };
        serif = {
          package = pkgs.montserrat;
          name = "Montserrat";
        };
        sizes = {
          applications = 12;
          terminal = 15;
          desktop = 11;
          popups = 12;
        };
      };
    };
  }
