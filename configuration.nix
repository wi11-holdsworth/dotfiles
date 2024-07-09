{ config, inputs, pkgs, ... }: 

{
  # package management
  environment.systemPackages = with pkgs; [
    bat
    delta
    dust
    eza
    github-cli
    gping
    home-manager
    nh
    nodejs
    wget
    zellij
  ];

  # vscode server
  programs = {
    nix-ld = {
      enable = true;
      package = pkgs.nix-ld-rs;
    };  
    nixvim = {
      enable = true;
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.will = import ./home.nix;
  };

  # enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  wsl = {
    enable = true;
    defaultUser = "will";
  };  

  system.stateVersion = "24.05";
}
