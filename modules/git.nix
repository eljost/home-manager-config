{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Johannes Steinmetzer";
        #email = varies
      };

      init.defaultBranch = "main";
    };
  };
}
