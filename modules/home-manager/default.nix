{lib, pkgs, ...}: {
  imports = [
    ./hyprland
    ./rofi
    ./foot
    ./git
    ./ags
    ./stylix
    ./apps
    ./direnv
  ];

  foot.enable = lib.mkDefault true;
  rofi.enable = lib.mkDefault true;
  hyprland.enable = lib.mkDefault true;
  git.enable = lib.mkDefault true;
  ags.enable = lib.mkDefault true;
}
