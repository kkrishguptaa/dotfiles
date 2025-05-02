{
  description = "krish's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-24.11-darwin";

    darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, darwin, ... }: {
    darwinConfigurations = {
      mac = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = inputs;
        modules = [
          ./nix-darwin.nix
        ];
      };
    };
  };

  nixConfig = {
    commit-lock-file-summary = "chore: update flake.lock";
    always-allow-substitutes = true;
    http-connections = 0;
    max-jobs = "auto";
  };
}
