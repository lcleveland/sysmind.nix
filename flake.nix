{
  description = "A NixOS configuration targeted at Framework laptops";
  outputs = { self, nixpkgs, home_manager, niri, nixos_hardware, sysmind_users }@base_inputs:
    let
      inputs = base_inputs // sysmind_users.inputs;
      import_modules = import ./resources/nix/import_modules.nix;
      base_modules = import_modules ./system ++ sysmind_users.nixosModules.default ++ [
        home_manager.nixosModules.home-manager
        niri.nixosModules.niri
        niri.homeModules.niri
        /etc/nixos/hardware-configuration.nix
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
      url = "github:nix-community/home-manager?ref=release-25.05";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos_hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=25.05";
    };
    sysmind_users = {
      url = "github:lcleveland/sysmind.users";
    };
  };
}
