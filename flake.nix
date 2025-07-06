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

        # Прокидываем модули в конфиг
        specialArgs = {
          inherit home-manager agenix;
          secrets = builtins.toString ./secrets;
        };

        modules = [
          ./hardware-configuration.nix
          ./configuration.nix

          # Сначала системный agenix-модуль (с патчем ln -sfnT)
          agenix.nixosModules.default
          agenix-template.nixosModules.default

          # Затем интеграция Home-Manager
          home-manager.nixosModules.home-manager
        ];

        # (другие опции, например boot.loader и т.д.)
      };

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          agenix.packages.${system}.default
        ];
      };
    };
}
