{
  programs.bash.enable = true;
  programs.bash.completion.enable = true;

  programs.direnv.enable = true;

  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.enableSSHSupport = true;

  programs.vim.enable = true;
  programs.vim.enableSensible = true;

  programs.zsh.enable = true;
  programs.zsh.enableFastSyntaxHighlighting = true;
  programs.zsh.enableFzfCompletion = true;
  programs.zsh.enableGlobalCompInit = true;
}
