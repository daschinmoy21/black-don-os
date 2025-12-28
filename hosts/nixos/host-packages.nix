{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    spotify
    rustc
    cargo
    scrcpy
    affine
    floorp-bin
    # Add host-specific packages here
  ];
}
