{
  description = "A NixOS configuration for sysmind.nix";
  outputs = { self, nixpkgs, home_manager, nixos_hardware, sysmind_users }@inputs:
    let
      import_modules = import ./resources/nix/import_modules.nix;
      base_modules = import_modules ./system ++ [ home_manager.nixosModules.home-manager /etc/nixos/hardware-configuration.nix ] ++ sysmind_users.nixosModules.default;
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
