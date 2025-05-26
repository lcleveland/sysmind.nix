{
  description = "A NixOS configuration for sysmind.nix";
  outputs = { self, nixpkgs, home_manager, nixos_hardware }@inputs:
    let
      base_modules = [
        ./system
      ];

      make_framework_16 = nixpkgs.lib.nixosSystem {
        modules = base_modules ++ [ nixos_hardware.nixosModules.framework-16-7040-amd ];
        specialArgs = { inherit inputs; };
      };
    in
    {
      nixosConfigurations = {
        fw16 = make_framework_16;
      };
    };
  inputs = {
    home_manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    nixos_hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=25.05";
    };
  };
}
