{
  description = "Home Manager configuration";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-23.11-darwin";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };
    
    # theme + tools
    catppuccin.url = "github:Stonks3141/ctp-nix";
    catppuccin-toolbox.url = "github:catppuccin/toolbox";

    home-manager = {
      #url = "github:nix-community/home-manager/release-23.11";
      url = "github:nix-community/home-manager/release-24.11";
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
	      # Temp solution: https://github.com/NixOS/nixpkgs/issues/402079
              {
                  nixpkgs.overlays = [
                      (self: super: {
                          #nixfmt-latest = nixfmt.packages."x86_64-darwin".nixfmt;
                          nodejs = super.nodejs_23;
                      })
                  ];
	      }
	      ];
          extraSpecialArgs = {
            pkgs-unstable = nixpkgs-unstable.legacyPackages.${arch};
          };
        };
    };

}
