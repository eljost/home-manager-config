{
  pkgs,
  ...
}:
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      format = ''
        no% $time $hostname in $directory
        $git_branch$git_status$custom.git_clean$character
      '';

      time = {
        disabled = false;
        format = "[$time]($style) ⌚";
        time_format = "%Y-%m-%d %H:%M:%S";
        style = "bold yellow";
      };

      hostname = {
        ssh_only = false;
        format = "[$hostname]($style)";
        style = "bold green";
      };

      directory = {
        truncation_length = 0;
        truncate_to_repo = false;
        format = "[$path]($style)[$read_only]($read_only_style) ";
        style = "bold blue";
        home_symbol = "~";
      };

      git_branch = {
        symbol = "";
        format = "[± |$branch]($style)";
        style = "bold purple";
      };

      git_status = {
        format = "[$all_status$ahead_behind]($style)";
        style = "red";
      };

      custom.git_clean = {
        command = "echo ✓";
        when = "git rev-parse --is-inside-work-tree > /dev/null 2>&1 && [ -z \"$(git status --porcelain)\"]";
        format = "[ ✓|]($style)";
        style = "green";
      };

      character = {
        success_symbol =  "[→](bold green)";
        error_symbol = "[→](bold red)";
      };
    };
  };
}
