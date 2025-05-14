{ pkgs, pkgs-unstable, catppuccin, catppuccin-toolbox, ... }: {
  home.username = "ainharan";
  home.homeDirectory = "/Users/ainharan";
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.asdf-vm
    pkgs.awscli2
    pkgs.colima
    pkgs.docker
    pkgs.docker-compose
    pkgs.dos2unix
    pkgs.ffmpeg-full
    pkgs.jq
    pkgs.mysql80
    pkgs.nodejs_23
    pkgs.oci-cli
    pkgs.openssl_3_3
    pkgs.qemu
    pkgs.podman
    pkgs.podman-compose
    pkgs.sl # for testing purposes
    pkgs.tree
    pkgs.xsv
    pkgs.yarn
    pkgs.yt-dlp
    pkgs-unstable.cowsay # test unstable specified pkg
    pkgs-unstable.terraform
  ];

  programs = {
    alacritty = (import ~/.config/home-manager/programs/alacritty/alacritty.nix { inherit pkgs; });
    fzf = (import ~/.config/home-manager/programs/fzf.nix { inherit pkgs; });
    git = (import ~/.config/home-manager/programs/git/git.nix { inherit pkgs; });
    neovim = (import ~/.config/home-manager/programs/nvim/nvim.nix { inherit pkgs; });
    tmux = (import ~/.config/home-manager/programs/tmux.nix { inherit pkgs; });
    zsh = (import ~/.config/home-manager/programs/zsh/zsh.nix { inherit pkgs catppuccin; });
  };
  
}
