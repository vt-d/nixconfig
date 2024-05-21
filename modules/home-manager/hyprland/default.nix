{ 
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./hyprcursor.nix
    ./hyprpicker.nix
    ./hyprpaper.nix
    ./hyprlock.nix
  ];

  options = {
    hyprland.enable = lib.mkEnableOption "enable hyprland module";
  };
  
  # the essentials
  config = lib.mkIf config.hyprland.enable {
    home.packages = with pkgs; [
      grim
      slurp
      imagemagick
      swappy
      wl-clipboard
      brightnessctl
    ];


    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mainMod" = "SUPER";
        "$terminal" = "${lib.getExe pkgs.foot}";
        "$menu" = "${lib.getExe pkgs.rofi-wayland} -show drun";

	monitor = [
          "eDP-1,disable"
	];
        
        env = [
          "XDG_CURRENT_DESKTOP,Hyprland"
          "XDG_SESSION_TYPE,wayland"
          "XDG_SESSION_DESKTOP,Hyprland"

          "QT_AUTO_SCREEN_SCALE_FACTOR,1"
          "QT_QPA_PLATFORM,wayland;xcb"
          "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"

          "EDITOR,nvim"
        ];

        exec-once = [
          "ags"
          "hyprpaper"
        ];

        layerrule = [
          "blur, ags-*"
          "ignorezero, ags-*"
        ];

        general = {
          gaps_in = "4";
          gaps_out = "4";
          border_size = "2";

          layout = "dwindle";

          allow_tearing = true;
        };

        decoration = {
          rounding = "4";
          blur = {
            enabled = true;
            size = "8";
            passes = "4";
            popups = true;
          };
        };

        animations = {
          enabled = true;
          animation = [
            "windows,1,5,default"
            "windowsOut,1,5,default,popin 80%"
            "border,1,5,default"
            "borderangle,1,3,default"
            "fade,1,6,default"
            "workspaces,1,3,default"
          ];
        };

        misc = {
          force_default_wallpaper = "-1";
        };

        bindm = [
          "$mainMod,mouse:272,movewindow"
          "$mainMod,mouse:273,resizewindow"
        ];

        bind = [
          "$mainMod,RETURN,exec,$terminal"
          "$mainMod,Q,killactive"
          "$mainMod,SPACE,togglefloating"
          "$mainMod,D,exec,$menu"
          "$mainMod,J,togglesplit"
          "$mainMod,mouse_down,workspace,e+1"
          "$mainMod,mouse_up,workspace,e-1"

          ", print, exec, grim - | wl-copy"
          "CTRL, print, exec, grim -g \"$(slurp)\" - | wl-copy"
          "ALT, print, exec, grim -g \"$(slurp)\" - | swappy -f -"

          "$mainMod SHIFT, c, exec, hyprpicker -a"
        ]
        ++ (
          builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString(x + 1 - (c * 10));
            in [
              "$mainMod,${ws},workspace,${toString (x + 1)}"
              "$mainMod SHIFT,${ws},movetoworkspace, ${toString(x + 1)}"
            ]
          )
          10)
        );
      };
    };
  };
}
