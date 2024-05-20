{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    rofi.enable = lib.mkEnableOption "enable rofi module";
  };

  config = lib.mkIf config.rofi.enable {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
    };
  };
}
