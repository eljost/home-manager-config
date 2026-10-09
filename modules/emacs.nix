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
