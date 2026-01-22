{ pkgs, config, ... }:

{
  # Define the EFI System Partition (Windows ESP)
  fileSystems."/efi" = {
    device = "/dev/disk/by-uuid/F09F-783A";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelModules = [ "v4l2loopback" ];
    extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
    kernel.sysctl = { "vm.max_map_count" = 2147483642; };
    
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    
    # Configure XBOOTLDR split
    loader.efi.efiSysMountPoint = "/efi";
    loader.systemd-boot.xbootldrMountPoint = "/boot";
    # Appimage Support
    binfmt.registrations.appimage = {
      wrapInterpreterInShell = false;
      interpreter = "${pkgs.appimage-run}/bin/appimage-run";
      recognitionType = "magic";
      offset = 0;
      mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
      magicOrExtension = ''\x7fELF....AI\x02'';
    };
    plymouth.enable = true;
    supportedFilesystems = [ "ntfs" ];
  };
}
