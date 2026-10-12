{
  lib,
  pkgs,
  ...
}:
{
  options.my.lisp.package = lib.mkOption {
    type = lib.types.package;
    default = pkgs.sbcl.withPackages (ps: with ps; [
      clog
    ]);
    defaultText = lib.literalExpression "pkgs.sbcl.withPackages (ps: [ ps.clog ])";
    description = "SBCL with bundled Lisp systems, used by the shell and slime.";
  };
}
