{ inputs, pkgs, ... }: 

{
  environment.systemPackages = with pkgs; [
    github-cli
    home-manager
    nh
    bat
    delta
    dust
    eza
    fd
    gping
    ripgrep-all
    ripgrep
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
	    nixd.enable = true;
	  };
	};
	cmp = {
	  enable = true;
	  autoEnableSources = true;
	};
	lualine.enable = true;
	treesitter.enable = true;
	
      };
    }; 
  };
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.will = import ./home.nix;
  };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  wsl = {
    enable = true;
    defaultUser = "will";
  };  
  system.stateVersion = "24.05";
}
