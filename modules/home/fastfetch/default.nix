{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        source = "nixos";
        padding = {
          top = 2;
        };
      };

      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "display"
        "de"
        "wm"
        "terminal"
        "cpu"
        "memory"
        "break"
        "colors"
      ];
    };
  };
}
