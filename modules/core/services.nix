{profile, pkgs, lib, ...}: {
  xdg.portal = {
    enable = true;
   extraPortals = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
    config = {
      common = {
        default = [
          "gtk"
        ];
        "org.freedesktop.impl.portal.Settings" = "gtk";
      };
      hyprland = {
        default = [
          "hyprland"
          "gtk"
        ];
        "org.freedesktop.impl.portal.FileChooser" = "gtk";
        "org.freedesktop.impl.portal.ScreenCast" = "hyprland";
        "org.freedesktop.impl.portal.Screenshot" = "hyprland";
        "org.freedesktop.impl.portal.Settings" = "gtk";
      };
      # niri config provided by programs.niri.enable = true;
      niri = {
        default = lib.mkForce [
          "gtk"
        ];
        "org.freedesktop.impl.portal.FileChooser" = lib.mkForce "gtk";
        "org.freedesktop.impl.portal.ScreenCast" = lib.mkForce "gnome";
        "org.freedesktop.impl.portal.Screenshot" = lib.mkForce "gnome";
        "org.freedesktop.impl.portal.Settings" = lib.mkForce "gtk";
      };
    };
    configPackages = [
      pkgs.hyprland
      pkgs.niri
    ];
  };

  programs.dconf.enable = true;

  # Services to start
  services = {
    libinput.enable = true; # Input Handling
    fstrim.enable = true; # SSD Optimizer
    gvfs.enable = true; # For Mounting USB & More
    openssh.enable = true; # Enable SSH
    blueman.enable = true; # Bluetooth Support
    tumbler.enable = true; # Image/video preview
    gnome.gnome-keyring.enable = true;
    upower.enable = true; # Power management (required for DMS battery monitoring)
    udisks2.enable = true;
    cloudflare-warp.enable = true;

    smartd = {
      enable =
        if profile == "vm"
        then false
        else true;
      autodetect = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true; # Enable WirePlumber session manager
    };
  };

  # zram swap configuration
  zramSwap = {
    enable = true;
    memoryPercent = 50; # Use 50% of RAM for zram
  };

  # 6GB swap file
  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 6 * 1024; # 6GB in MB
  }];
}
