{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraPackages = epkgs: [
      epkgs.slime
      epkgs.paredit
    ];
    extraConfig = ''
      (setq standard-indent 2)
      (setq inferior-lisp-program "${pkgs.sbcl}/bin/sbcl")
    '';
  };
}
