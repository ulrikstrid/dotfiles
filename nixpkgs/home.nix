{ config, ... }:
let

  pkgs = import <nixpkgs> {
    overlays = [ (import ./overlays-import.nix) ];
  };

in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;
  home.file.".config/nixpkgs/config.nix".text = ''
    { allowUnfree = true; }
  '';

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "ulrik.strid";
  home.homeDirectory = "/Users/ulrik.strid";

  home.packages = with pkgs; [
    # utils
    bat
    cacert
    curl
    git
    gnupg
    jq
    neovim
    nix-zsh-completions
    nodejs-14_x
    tree
    wget
    unzip
    direnv
    mpir
    pkg-config
    inetutils
    coreutils
    shellcheck
    rnix-lsp
    nixpkgs-fmt
    cachix
    # development
    tilt
    # opam
    # kubernetes / azure
    open-policy-agent
    kubectl
    kubectx
    kubernetes-helm
    azure-cli
    krew
    fluxctl
    fluxcd
    # Docker doesn't really work on mac
    # docker 
    docker-compose
  ];

  # TODO: Figure out how to modularize this since the settings will grow
  imports = [
    ./vscode
    ./git
    ./zsh
  ];

  programs.octant.enable = true;
  programs.kitty.enable = true;
  programs.taskwarrior = {
    enable = true;
    dataLocation = "${config.xdg.dataHome}/tasks";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";
}
