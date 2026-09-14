{
  home.username = "jst";
  home.homeDirectory = "/home/jst";

  # Seems to be required for Debian
  targets.genericLinux.enable = true;
  programs.home-manager.enable = true;
}
