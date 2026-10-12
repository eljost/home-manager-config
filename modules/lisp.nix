{
  config,
  ...
}:
{
  imports = [ ./my-lisp.nix ];

  home.packages = [
    config.my.lisp.package
  ];
}
