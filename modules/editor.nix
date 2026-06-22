{
pkgs,
nixvim,
...
}:
{
  home.packages = [
    nixvim.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
