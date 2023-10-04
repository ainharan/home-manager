{ pkgs, pkgs-unstable, ... }: {
  home.username = "ainharan";
  home.homeDirectory = "/Users/ainharan";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.sl # for testing purposes
    pkgs-unstable.cowsay # test unstable specified pkg
  ];

  programs.git = {
    enable = true;
    includes = [{ path = "~/.config/nixpkgs/gitconfig"; }];
  };

  programs.zsh = {
    enable = true;
    initExtra = builtins.readFile ./zshrc;
  };

  programs.fzf = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
