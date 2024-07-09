{ config, inputs, pkgs, ... }: 

{
  # package management
  environment.systemPackages = with pkgs; [
    github-cli
    home-manager
    nh

    # rust rewrites
    bat
    delta
    dust
    eza
    fd
    gping
    ripgrep-all
    zellij
  ];

  programs = {
    # vscode server
    nix-ld = {
      enable = true;
      package = pkgs.nix-ld-rs;
    };  
    nixvim = {
      enable = true;
      options = {
        shiftwidth = 2;
      	number = true;
	relativenumber = true;
      };
      colorschemes.ayu.enable = true;
      plugins = {
	lsp = {
	  enable = true;
	  servers = {
	    tsserver.enable = true;
	  };
	};
	cmp = {
	  enable = true;
	  autoEnableSources = true;
	};
      };
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
