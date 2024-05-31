
{pkgs, lib, ...}: {
  imports = [
    ./stylix
    ./nh
    ./gnome
    ./apps
  ];

  environment.systemPackages = [
    pkgs.noto-fonts
    pkgs.jetbrains-mono
  ];


  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;

      substituters = [
        "https://nixpkgs-unfree.cachix.org"
      ];
      trusted-public-keys = [
        "nixpkgs-unfree.cachix.org-1:hqvoInulhbV4nJ9yJOEr+4wxhDV4xq2d1DK7S6Nj6rs="
      ];
    };
  };
}
