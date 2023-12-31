{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-23.05-darwin";

    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };
    
    # theme + tools
    catppuccin.url = "github:Stonks3141/ctp-nix";
    catppuccin-toolbox.url = "github:catppuccin/toolbox";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, nixpkgs-unstable, catppuccin, catppuccin-toolbox, home-manager, ... }: 
    let
      arch = "aarch64-darwin";
    in {
      defaultPackage.${arch} =
        home-manager.defaultPackage.${arch};

      homeConfigurations.ainharan = 
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${arch};
          modules = [
            catppuccin.homeManagerModules.catppuccin
	    ./home.nix 
	  ];
          extraSpecialArgs = {
            pkgs-unstable = nixpkgs-unstable.legacyPackages.${arch};
          };
        };
    };

}
