# You might be wondering why im not putting everything here in my 'nixos' module
# I am enabling drivers here so I dont want it to be for every system I have especially because of nvidia and old sound cards
# Some systems also cant run the latest kernel or boot with systemd-boot

# Feel free to use this config without crediting me

{ pkgs, inputs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/nixos
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = [ "amdgpu" ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.networkmanager.enable = true; 
  hardware.opentabletdriver.enable = true;


  # graphics support... nix, correctly name and separate your modules!!! 
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.extraPackages = with pkgs; [
    amdvlk
  ];

  # network
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # stop alsa conflict
  sound.enable = false;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
  };

  # me password
  users.users.vt = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [
      firefox
      tree
    ];
  };

  environment.systemPackages = with pkgs; [
    wget
    neovim
    xdg-utils
  ];

  # home manager yay
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "vt" = import ./home.nix;
    };
  };

  system.stateVersion = "24.05"; # uakari
}
