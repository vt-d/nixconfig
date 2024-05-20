{pkgs, ...}: {
  home.packages = with pkgs; [
    (vesktop.override { withSystemVencord = false; })
  ];
}
