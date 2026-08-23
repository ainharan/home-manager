{ pkgs, catppuccin, ... }:

{
  enable = true;
  initExtra = ''
    ${builtins.readFile ./zshrc}

    # Load local uncommitted secrets if present
    if [[ -f ~/.zshrc.local ]]; then
      source ~/.zshrc.local
    fi
  '';

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
