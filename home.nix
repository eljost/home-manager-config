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
    ll = "ls -lth";
    la = "ls -ltha";
  };

  imports = [
    ./modules/editor.nix
    ./modules/tmux.nix
    ./modules/prompt.nix
    #./git.nix
  ];

  programs.home-manager.enable = true;
  targets.genericLinux.enable = true;
  programs.bash.enable = true;

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
}
