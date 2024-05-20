{
  config,
  lib,
  ...
}: {
  options = {
    foot.enable = lib.mkEnableOption "enable foot module";
  };

  config = lib.mkIf config.foot.enable {
    programs.foot = {
      enable = true;
    };
  };
}
