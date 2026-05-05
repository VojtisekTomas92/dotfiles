{ pkgs, ... }:
let
  secrets = import ../../../secrets/secrets.nix;
in
{
  home.packages = [ pkgs.keepassxc ];
  xdg.configFile."keepassxc/keepassxc.ini".text = ''
    [General]
    ConfigVersion=2
    Browser/Enabled=true

    [GUI]
    ApplicationTheme=dark
    CompactMode=true

    [Security]
    LockDatabaseIdle=false
    LockDatabaseMinimize=false
    LockDatabaseScreenLock=false
  '';
  xdg.configFile."autostart/keepassxc.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=KeePassXC (Auto-Unlock)
    Exec=bash -c 'sleep 3 && printf "%s" "$(cat /run/secrets/keepass_pw)" | keepassxc --pw-stdin "${secrets.keepassxc.db_path}"'
    Icon=keepassxc
    Terminal=false
    Categories=Utility;Security;
  '';
}
