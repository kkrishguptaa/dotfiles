{ pkgs, ... }: {
  system.stateVersion = 5;

  environment.systemPackages = with pkgs; [
    # basic command line tools
    bash
    bash-completion
    zsh
    zsh-syntax-highlighting
    vim
    fzf
    wget
    gnupg
    autojump
    bat
    jq

    git
    git-credential-oauth
    git-lfs
    delta
    gh
    gh-poi
    editorconfig-core-c
    direnv
    docker
    colima
    fnm
    bun
    go
    python3
    python312Packages.pip
    python312Packages.venvShellHook

    mas
  ];

  fonts.packages = with pkgs; [
    cascadia-code
    (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
    monaspace
  ];

  homebrew.enable = true;
  homebrew.brewPrefix = "/opt/homebrew/bin";
  homebrew.casks = [
    "raycast"

    "battery"
    "iina"
    "jordanbaird-ice"
    "shottr"

    "discord"
    "figma"
    "chatgpt"
    "google-chrome"
    "zoom"
    "ghostty"
    "visual-studio-code"
  ];
  homebrew.global.autoUpdate = false;
  homebrew.global.brewfile = true;
  homebrew.onActivation.cleanup = "uninstall";
  homebrew.masApps = {
    Shareful = 1522267256;

    "Microsoft Excel" = 462058435;
    "Microsoft PowerPoint" = 462062816;
    "Microsoft Word" = 462054704;

    Pages = 409201541;
    Telegram = 747648890;
    WhatsApp = 310633997;

    "Slack for Desktop" = 803453959;
  };

  networking.computerName = "Krish's M2";
  networking.hostName = "kkrishguptaa";
  networking.localHostName = "kkrishguptaa.m2";

  networking.dns = [ "1.1.1.1" "1.0.0.1" ]; # Cloudflare DNS
  networking.knownNetworkServices =
    [ "Wi-Fi" "Ethernet Adaptor" "Thunderbolt Ethernet" ];

  nix.channel.enable = false;
  nix.gc.automatic = true;
  nix.optimise.automatic = true;
  nix.settings.trusted-users = [ "kkrishguptaa" "root" ];
  nix.settings.commit-lock-file-summary = "chore: update flake.lock";
  nix.settings.always-allow-substitutes = true;
  nix.settings.http-connections = 0;
  nix.settings.max-jobs = "auto";
  nix.settings.accept-flake-config = true;
  nix.settings.experimental-features = "nix-command flakes";
  
  nixpkgs.config.enableParallelBuildingByDefault = true;
  nixpkgs.config.allowUnfree = true;

  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.enableSSHSupport = true;

  programs.vim.enable = true;
  programs.vim.enableSensible = true;

  programs.bash.enable = true;
  programs.bash.completion.enable = true;

  programs.zsh.enableFzfCompletion = true;
  programs.zsh.enableFzfGit = true;
  programs.zsh.enableFzfHistory = true;
  programs.zsh.enableGlobalCompInit = true;
  programs.zsh.enableSyntaxHighlighting = true;

  security.pam.enableSudoTouchIdAuth = true;

  services.openssh.enable = true;

  system.defaults.NSGlobalDomain.AppleFontSmoothing = 2;
  system.defaults.NSGlobalDomain.AppleInterfaceStyle = "Dark";
  system.defaults.NSGlobalDomain.AppleShowAllFiles = true;
  system.defaults.NSGlobalDomain.NSAutomaticCapitalizationEnabled = true;
  system.defaults.NSGlobalDomain.NSDisableAutomaticTermination = false;
  system.defaults.WindowManager.AppWindowGroupingBehavior = false;
  system.defaults.WindowManager.EnableTilingByEdgeDrag = false;
  system.defaults.WindowManager.StandardHideDesktopIcons = true;
  system.defaults.dock.autohide = true;
  system.defaults.dock.expose-group-apps = true;
  system.defaults.dock.magnification = true;
  system.defaults.dock.showhidden = true;
  system.defaults.dock.static-only = true;
  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder.AppleShowAllFiles = true;
  system.defaults.finder.CreateDesktop = false;
  system.defaults.finder.FXEnableExtensionChangeWarning = false;
  system.defaults.finder.FXRemoveOldTrashItems = true;
}
