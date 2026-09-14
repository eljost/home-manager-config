{
  description = "Home Manager config that providing basic tooling, standalone or on NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:eljost/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixvim,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      homeModules.default = {
        imports = [
          nixvim.homeModules.nixvim
          ./home.nix
        ];
      };

      homeConfigurations."jst" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          self.homeModules.default
          ./modules/standalone.nix
        ];
      };
    };
}
