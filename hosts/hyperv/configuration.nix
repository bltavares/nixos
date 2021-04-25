# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, systemConfig, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../hardware/hyperv.nix
    {
      hyperv = {
        enhancedSession = true;
        video = true;
      };
    }
    ../../modules/kde.nix
    ../../modules/user.nix
    ../../modules/services.nix
    ../../modules/applications.nix
    ../../modules/commands.nix
    ../../modules/nix.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "hyperv";

  time.timeZone = "Americas/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";

  networking.useDHCP = false;
  networking.interfaces.eth0.useDHCP = true;

  system.stateVersion = "20.09";
}

