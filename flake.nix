{
  description = "please work please";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { home-manager, nixpkgs, ... }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };

    lib = nixpkgs.lib;
  in
  {
    nixosConfigurations = {
      # hp laptop
      ray = lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/ray
        ];
      };
    };
  };
}
