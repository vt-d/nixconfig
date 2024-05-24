{pkgs, ...}: {
  imports = [
    ./files.nix
    ./targets.nix
  ];

  config.stylix = {
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
    };
  };
}
