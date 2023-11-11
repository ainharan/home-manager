{ pkgs, pkgs-unstable, catppuccin, catppuccin-toolbox, ... }: {
  home.username = "ainharan";
  home.homeDirectory = "/Users/ainharan";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.asdf-vm
    pkgs.colima
    pkgs.docker
    pkgs.docker-compose
    pkgs.jq
    pkgs.mysql80
    pkgs.oci-cli
    pkgs.qemu
    pkgs.podman
    pkgs.podman-compose
    pkgs.sl # for testing purposes
    pkgs.yarn
    pkgs-unstable.cowsay # test unstable specified pkg
    pkgs-unstable.terraform
  ];

  programs = {
    fzf = (import ~/.config/home-manager/programs/fzf.nix { inherit pkgs; });
    git = (import ~/.config/home-manager/programs/git/git.nix { inherit pkgs; });
    neovim = (import ~/.config/home-manager/programs/nvim/nvim.nix { inherit pkgs; });
    tmux = (import ~/.config/home-manager/programs/tmux.nix { inherit pkgs; });
    zsh = (import ~/.config/home-manager/programs/zsh/zsh.nix { inherit pkgs catppuccin; });
  };
  
}
