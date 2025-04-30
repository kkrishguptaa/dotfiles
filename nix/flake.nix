{
  description = "krish's dotfiles";

  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin"; };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, ... }: let
    pkgs = import nixpkgs { system = "aarch64-darwin"; };
  in {
    darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./darwin/default.nix
        ./darwin/packages.nix
        ./darwin/programs.nix
      ];
      specialArgs = { inherit inputs; };
    };
  };
}
