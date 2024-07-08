{ config, pkgs, ... }:

{
    home = {
        username = "will";
        homeDirectory = "/home/will";
        stateVersion = "24.05";
        packages = with pkgs; [
            bash
            git
            starship
        ];
        sessionVariables = {
            EDITOR = "vim";
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
                gacp = "ga && gc && gp";
                dots = "cd ~/.dotfiles && clear && ls -T && echo";
                editcf = "vi ~/.dotfiles/hosts/$HOSTNAME/configuration.nix";
                edithm = "vi ~/.dotfiles/hosts/$HOSTNAME/home.nix";
                getflakey = ''nix flake new -t github:nix-community/nix-direnv . 
                                && echo "use flake" >> .envrc 
                                && direnv allow'';
                };
        };
        
        git = {
            enable = true;
            userName = "wi11-holdsworth";
            userEmail = "83637728+wi11-holdsworth@users.noreply.github.com";
            extraConfig.init.defaultBranch = "main";
            delta.enable = true;
        };
        
        starship = {
            enable = true;
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