{ pkgs, ... }:
{
    enable = true;
    includes = [{ path = "~/.config/nixpkgs/gitconfig"; }];
}

