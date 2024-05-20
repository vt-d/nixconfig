{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hyprland.enable {
    home.packages = [
      inputs.hyprpicker.packages.${pkgs.system}.hyprpicker
    ];
  };
}
