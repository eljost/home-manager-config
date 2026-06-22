{ pkgs, ... }:
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      format = ''
        no% $time $hostname in $directory
        $bar$git_branch$git_status$bar $character
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

      bar = {
        symbol = "|";
        format = "[|]";
      };

      git_branch = {
        symbol = "± ";
        format = "[± |](bold cyan)[$branch](bold cyan)";
      };

      git_status = {
        format = "[ ✗](red)[|](green)";
      };

      character = {
        success_symbol = " [→](green)";
        error_symbol = " [→](red)";
      };
    };
  };
}
