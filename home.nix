{ config, pkgs, ... }:

{
  home.username = "duktus";
  home.homeDirectory = "/home/duktus";

  programs.dircolors = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };

  programs.direnv = {
    enable = true;
#    enableBashIntegration = true;
#    enableFishIntegration = true;
  };

  programs.fish = {
    enable = true;
    plugins = [];
  };

  # configure git
  programs.git = {
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
        };
     };

  home.packages = with pkgs; [
    # pkgs to install
    tmux
    neovim
    
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

  home.stateVersion = "22.05";
  programs.home-manager.enable = true;
}
