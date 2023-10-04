{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-23.05-darwin";

    nixpkgs-unstable = {
        url = "github:nixos/nixpkgs/nixpkgs-unstable";
      };
    
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, ... }:
  let
    arch = "aarch64-darwin";
  in {
    defaultPackage.${arch} =
      home-manager.defaultPackage.${arch};

    homeConfigurations."ainharan@Ainharans-MBP" = 
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${arch};
        modules = [ ./home.nix ];
        extraSpecialArgs = {
          pkgs-unstable = nixpkgs-unstable.legacyPackages.${arch};
        };
      };

    # set up for oracle machine
    homeConfigurations."ainharan@ainharan-mac" = 
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${arch};
        modules = [ ./home.nix ];
      };

    };

}
