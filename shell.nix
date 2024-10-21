{
  pkgs ? import <nixpkgs> {}
}:
pkgs.mkShell {
  name = "Muller-Satterthwaite--Arrow Correspondence LaTeX shell";
  packages = [
    pkgs.texliveFull
  ];
  shellHook = ''
    echo "This is the NixCon 2024 Slides Environment LaTeX shell!"
  '';
}
