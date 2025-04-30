{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # nix
    nixfmt-rfc-style

    # basic command line tools
    git
    git-credential-oauth
    vim
    htop
    bat
    fd
    autojump
    gnupg
    wget
    jq
    editorconfig-core-c

    # shell
    zsh

    # basic developer tools
    direnv
    git-lfs
    gh
    gh-poi
    docker
    colima
    # nodejs
    fnm
    bun
    # golang
    go
    # python
    python3
    python312Packages.pip
    python312Packages.venvShellHook

    # other
    mas # Mac App Store CLI
  ];

    homebrew.brewPrefix = "/opt/homebrew/bin";
  homebrew.enable = true;
  homebrew.global.brewfile = true;
  homebrew.onActivation.cleanup = "uninstall";
  homebrew.onActivation.extraFlags = [ "--verbose" ];

  homebrew.casks = [
    "battery"
    "google-chrome"
    "iina"
    "protonvpn"
    "deluge"
    "jordanbaird-ice"
    "zoom"
    "raycast"
    "figma"
    "shottr"
    "chatgpt"
    "discord"
    "visual-studio-code"
    "ghostty"
  ];

  homebrew.masApps = {
    "Microsoft Excel" = 462058435;
    "Microsoft PowerPoint" = 462062816;
    "Microsoft Word" = 462054704;
    "DaVinci Resolve" = 571213070;
    iMovie = 408981434;
    GarageBand = 682658836;
    Keynote = 361285480;
    Numbers = 409203825;
    Pages = 409201541;
    Telegram = 747648890;
    WhatsApp = 310633997;
    "Slack for Desktop" = 803453959;
    Xcode = 497799835;
    Shareful = 1522267256;
  };

    fonts.packages = with pkgs;
    [ (nerdfonts.override { fonts = [ "CascadiaCode" ]; }) ];
}
