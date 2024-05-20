{pkgs, ...}: {
  imports = [
    ./files.nix
  ];

  config.stylix = {
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
    };
  };
}
