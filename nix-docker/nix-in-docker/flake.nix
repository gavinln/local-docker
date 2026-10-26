# vim: sw=2 ts=2 sts=2 et
{
  description = "nix in docker";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          pi-coding-agent
        ];
      };
      packages.${system} = {
        pi-coding-agent = pkgs.pi-coding-agent;
        default = self.packages.${system}.pi-coding-agent;
      };
    };
}
