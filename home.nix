{pkgs, ...}: {
  home = {
    username = "will";
    homeDirectory = "/home/will";
    stateVersion = "24.05";
    packages = with pkgs; [
      bash
      direnv
      git
      starship
    ];
    sessionVariables = {
      EDITOR = "nvim";
      FLAKE = "/home/will/.dotfiles";
    };
  };
  programs = {
    home-manager.enable = true;
    bash = {
      enable = true;
      shellAliases = {
        nos = "nh os switch ~/.dotfiles";
        ls = "eza --group-directories-first --icons";
        la = "ls -a";
        ll = "la -l";
        lt = "la -T";
        ga = "git add .";
        gc = "git commit";
        gp = "git push";
        gac = "ga && gc";
        gacp = "ga && gc && gp";
        gs = "git status";
        gd = "git diff";
        gl = "git log --oneline";
        dots = "cd ~/.dotfiles && clear && ls -T && echo";
        editcf = "vi ~/.dotfiles/configuration.nix";
        edithm = "vi ~/.dotfiles/home.nix";
        getflakey = ''          nix flake new -t github:nix-community/nix-direnv . 
          && echo "use flake" >> .envrc 
          && direnv allow'';
        vi = "nvim";
        vim = "nvim";
        dcub="docker compose up --build -d";
        dcd="docker compose down";
        dcdv="dcd -v";
      };
    };
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
    git = {
      enable = true;
      userName = "wi11-holdsworth";
      userEmail = "83637728+wi11-holdsworth@users.noreply.github.com";
      extraConfig = {
        init.defaultBranch = "main";
        core.editor = "nvim";
        push.autoSetupRemote = true;
        pull.rebase = false;
        user.signingKey = "6FA0EF08A22DDFE1";
        gpg.program = "/mnt/c/Program Files (x86)/GnuPG/bin/gpg.exe";
        commit.sign = true;
      };
      delta.enable = true;
    };
    starship = {
      enable = true;
      enableIonIntegration = true;
      settings = {
        character = {
          success_symbol = "[➜](bold green) ";
          error_symbol = "[➜](bold red) ";
        };
        add_newline = false;
        cmd_duration.disabled = true;
        line_break.disabled = true;
      };
    };
  };
}
