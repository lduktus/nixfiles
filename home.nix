{ config, pkgs, ... }:

{
  home = {
    username = "duktus";
    homeDirectory = "/home/duktus";

    packages = with pkgs; [
      # pkgs to install
      tmux
      neovim
      fish
      
      tree
      tig
      ripgrep
      jq
      fzf
      exa
      bat
      fd
      gotop
      mc
      podman-unwrapped
      podman-compose

      ffmpeg_5-full 
      unzip
      p7zip
      python310Packages.pipx
    ];

    file = {
      
      tmux = {
        source = ./tmux/tmux.conf;
	target = ".tmux.conf";
      };

      fish = {
        source = ./fish/config.fish;
	target = ".config/fish/config.fish";
      };

      fish_functions = {
	recursive = true;
        source = ./fish/functions;
	target = ".config/fish/functions";
      };

    };

    stateVersion = "22.05";
  };

  programs = {

    home-manager.enable = true;
  
    git = {
      enable = true;
      userName = "duktus";
      userEmail = "duktus@duck.com";
      extraConfig = {

	  init = {
	    defaultBranch = "main";
          };

          core = {
            editor = "nvim";
          };

	  color = {
	    ui = true;
	  };

        };
     };

    dircolors = {
      enable = true;
    };

    direnv = {
      enable = true;
    };

    bat = {
      enable = true;
      config = {
        theme = "Solarized (dark)";
      };
    };

  };
}
