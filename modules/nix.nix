{ pkgs, ... }:
let
  sources = import ../nix/sources.nix;
  nix-lsp = import sources.rnix-lsp;
in
{
  environment.systemPackages = [
    nix-lsp
    pkgs.niv
  ];
}

