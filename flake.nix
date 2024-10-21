{
  description = "NixCon 2024 Slides Environment";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };
  outputs = inputs@{
    self,
      nixpkgs,
      ...
  }: let
    supportedSystems = [
      "x86_64-linux"
      "x86_64-darwin"
      "aarch64-linux"
      "aarch64-darwin"
    ];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
  in {
    devShells = forAllSystems ( system: ( let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      default = import ./shell.nix { inherit pkgs; };
    }));
  };
}
