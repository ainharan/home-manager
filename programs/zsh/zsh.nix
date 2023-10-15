{ pkgs, ... }:
{
  enable = true;
  initExtra = builtins.readFile ./zshrc;
}

