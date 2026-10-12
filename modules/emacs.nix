{ pkgs, config, ... }:
{
  imports = [ ./my-lisp.nix ];

  programs.emacs = let
    lisp = config.my.lisp.package;
    lispExe = "${lisp}/bin/sbcl";
  in {
    enable = true;
    package = pkgs.emacs;
    extraPackages = epkgs: [
      epkgs.slime
      epkgs.paredit
    ];
    extraConfig = ''
      (setq standard-indent 2)
      (setq inferior-lisp-program "${lispExe}")

      (dolist (hook '(lisp-data-mode-hook
                      scheme-mode-hook
                      slime-repl-mode-hook))
        (add-hook hook #'enable-paredit-mode))

      ;; paredit >= 25 binds RET to paredit-RET, which stops RET from
      ;; submitting input in the SLIME REPL
      (with-eval-after-load 'paredit
        (define-key paredit-mode-map (kbd "RET") nil))
    '';
  };
}
