_: {
  security = {
    rtkit.enable = true;
    polkit = {
      enable = true;
      extraConfig = ''
        polkit.addRule(function(action, subject) {
          if ( subject.isInGroup("users") && (
           action.id == "org.freedesktop.login1.reboot" ||
           action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
           action.id == "org.freedesktop.login1.power-off" ||
           action.id == "org.freedesktop.login1.power-off-multiple-sessions"
          ))
          { return polkit.Result.YES; }
        })
        polkit.addRule(function(action, subject) {
          if (subject.isInGroup("wheel") && (
            action.id == "org.freedesktop.udisks2.filesystem-mount-system" ||
            action.id == "org.freedesktop.udisks2.filesystem-mount" ||
            action.id == "org.freedesktop.udisks2.filesystem-mount-other-seat" ||
            action.id == "org.freedesktop.udisks2.filesystem-unmount-others" ||
            action.id == "org.freedesktop.udisks2.eject-media-other-seat" ||
            action.id == "org.freedesktop.udisks2.power-off-drive-other-seat" ||
            action.id == "org.freedesktop.udisks2.modify-device-other-seat"
          ))
          { return polkit.Result.YES; }
        });
      '';
    };
    pam.services.swaylock = {
      text = ''auth include login '';
    };
  };
}
