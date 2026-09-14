{
config,
pkgs,
...
}:
{
  imports = [
    ./modules/editor.nix
    ./modules/tmux.nix
    ./modules/prompt.nix
    ./modules/git.nix
  ];

  home.stateVersion = "26.05";
  
  home.shellAliases = {
    ".." = "cd ..";
    "..." = "cd ../..";
    ll = "ls -lth --color=auto";
    la = "ls -ltha --color=auto";
    tf = "tail -f";
    tF = "tail -f -n +0";
  };

  programs = {
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
