{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    spotify
    rustc
    cargo
    # Add host-specific packages here
  ];
}
