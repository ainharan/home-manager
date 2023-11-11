{ pkgs, catppuccin, ... }:

{
  enable = true;
  initExtra = builtins.readFile ./zshrc;

  zplug = {
    enable = true;
    plugins = [
      { name = "zsh-users/zsh-autosuggestions"; }
    ];
  };

  oh-my-zsh = {
    enable = true;
    plugins = [ "dotenv" ];
  };
}

