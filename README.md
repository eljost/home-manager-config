# home-manager-config

My [home-manager](https://github.com/nix-community/home-manager) configuration
that provides some basic tools (nixvim, tmux, git) on NixOS systems.

## Install
It requires `extra-experimental-features = nix-command  flakes` in `/etc/nix/nix.conf`.
 ```bash
 nix run home-manager -- switch -b backup --flake github:eljost/home-manager-config#jst
 ```

 ## Update
 ```
 home-manager switch --flake github:eljost/home-manager-config#jst
 ```
