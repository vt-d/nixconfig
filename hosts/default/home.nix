{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home-manager
  ];

  home.username = "vt";
  home.homeDirectory = "/home/vt";

  home.stateVersion = "24.05"; # Please read the comment before changing.
  
  fonts.fontconfig.enable = true;
  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "Iosevka" ]; })
  ];

  home.file = {};

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
