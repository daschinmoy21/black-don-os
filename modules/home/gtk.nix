{ pkgs, ... }:

{
  gtk = {
    iconTheme = {
      name = "Tela-purple-dark";
      package = pkgs.tela-icon-theme;
    };
    gtk3.extraConfig = {
      # gtk-application-prefer-dark-theme = 1; # Confilcts with HdyStyleManager
    };
    gtk4.extraConfig = {
      # gtk-application-prefer-dark-theme = 1;
    };
  };

  # For libadwaita/libhandy apps (GNOME Boxes, etc.)
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
