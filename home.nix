{ pkgs, pkgs-unstable, ... }: {
  home.username = "ainharan";
  home.homeDirectory = "/Users/ainharan";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.sl # for testing purposes
    pkgs-unstable.cowsay # test unstable specified pkg
  ];

  programs = {
    git = (import ~/.config/home-manager/programs/git.nix { inherit pkgs; });
    zsh = (import ~/.config/home-manager/programs/zsh/zsh.nix { inherit pkgs; });
    fzf = (import ~/.config/home-manager/programs/fzf.nix { inherit pkgs; });
    direnv = (import ~/.config/home-manager/programs/direnv.nix { inherit pkgs; });
  };

  
}
