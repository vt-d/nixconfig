{
  lib,
  config,
  ...
}: {
  options = {
    git.enable = lib.mkEnableOption "enable git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;

      # set username and email
      userEmail = "poonadiscord@gmail.com";
      userName = "vt-d";
    };

    # github cli
    programs.gh.enable = true;
  };
}
