{
  description = "My NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # agenix
    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
    agenix-template.url = "github:jhillyerd/agenix-template";
  };

  outputs = { self, nixpkgs, home-manager, agenix, agenix-template, ... }:
    let
      system = "x86_64-linux";
      pkgs   = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit home-manager agenix;
          secrets = builtins.toString ./secrets;
        };

        modules = [
          ./hardware-configuration.nix
          ./configuration.nix

          agenix.nixosModules.default
          agenix-template.nixosModules.default

          home-manager.nixosModules.home-manager
        ];
      };

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          agenix.packages.${system}.default
        ];
      };
    };
}
