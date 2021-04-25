{ pkgs, ... }:
let
  sources = import ../nix/sources.nix;
  nix-lsp = import sources.rnix-lsp;
in
{
  environment.systemPackages = with pkgs; [
    nix-lsp
    niv
    nodejs-12_x # necessary to remote vscode-ssh https://github.com/microsoft/vscode-remote-release/issues/3476#issuecomment-669725823
  ];
}

