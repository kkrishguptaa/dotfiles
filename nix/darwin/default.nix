{ pkgs, ... }: {
  nix = {
    settings = {
      accept-flake-config = true;
      commit-lock-file-summary = "chore: update flake.lock";
      experimental-features = "flakes nix-command";
      substituters =
        [ "https://cache.nixos.org/" "https://nix-community.cachix.org" ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
    optimise = { automatic = true; };
  };

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config = {
      enableParallelBuildingByDefault = true;
      allowUnfree = true;
      warnUndeclaredOptions = true;
    };
  };

  environment.shellAliases = {
    nix-rebuild = ''
      nix flake update --flake ~/dotfiles/nix
      darwin-rebuild boot --flake ~/dotfiles/nix#darwinConfigurations.mac.system
    '';
  };

  networking.computerName = "mac";
  networking.dns = [ "1.1.1.1" "1.0.0.1" ]; # Cloudflare DNS
  networking.hostName = "mac";
  networking.knownNetworkServices =
    [ "Wi-Fi" "Ethernet Adaptor" "Thunderbolt Ethernet" ];
  networking.localHostName = "kkrishguptaa.mac";

  power.sleep.computer = "never";

  services.openssh.enable = true;

  system.configurationRevision = null;

  system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
  system.defaults.NSGlobalDomain.AppleShowAllFiles = true;
  system.defaults.NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
  system.defaults.dock.autohide = true;
  system.defaults.dock.expose-group-apps = true;
  system.defaults.dock.magnification = true;
  system.defaults.dock.showhidden = true;
  system.defaults.dock.static-only = true;
  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder.AppleShowAllFiles = true;
  system.defaults.finder.CreateDesktop = false;
  system.defaults.finder.FXEnableExtensionChangeWarning = false;

  system.stateVersion = 5;
}
