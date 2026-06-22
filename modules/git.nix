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

  programs.bash.shellAliases = {
    gs = "git status";
    gd = "git diff";
    gca = "git commit --all";
  };
}
