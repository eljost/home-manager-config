{ pkgs, ... }:
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;

    # These settings more or less mimic the default theme bobby theme
    # from the bash-it project.
    #
    # See https://starship.rs/config/#configuration for more options
    settings = {
      format = ''
        no% $time $hostname in $directory
        $git_branch$git_status$character
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

      character = {
        success_symbol = " [→](green)";
        error_symbol = " [→](red)";
      };
    };
  };
}
