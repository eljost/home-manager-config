{
config,
pkgs,
...
}:
{
  home.username = "jst";
  home.homeDirectory = "/home/jst";
  home.stateVersion = "26.05";
  
  home.shellAliases = {
    ".." = "cd ..";
    "..." = "cd ../..";
    ll = "ls -lth --color=auto";
    la = "ls -ltha --color=auto";
  };

  imports = [
    ./modules/editor.nix
    ./modules/tmux.nix
    ./modules/prompt.nix
    ./modules/git.nix
  ];

  # Seems to be required for Debian
  targets.genericLinux.enable = true;

  programs = {
    home-manager.enable = true;
    bash.enable = true;

    # Alternatives to cat and diff
    bat.enable = true;
    difftastic.enable = true;

    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
