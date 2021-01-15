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
    bat
    cacert
    curl
    exa
    fzf
    git
    gnupg
    go
    jq
    mpir
    neovim
    nix-zsh-completions
    nodejs-14_x
    procps
    silver-searcher
    tmux
    tree
    wget
    zsh
    # utils
    unzip
    tilt
    direnv
    jq
    wget
    git
    pkg-config
    inetutils
    coreutils
    shellcheck
    rnix-lsp
    nixpkgs-fmt
    # development
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
    # GUIs
    kitty
  ];

  # TODO: Figure out how to modularize this since the settings will grow
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace (import ./vscode/extensions.nix).extensions;
    userSettings = {
      "workbench.colorTheme" = "Night Owl";
      "workbench.iconTheme" = "vscode-icons";
      "editor.formatOnSave" = true;
      "editor.tabSize" = 2;
      "editor.fontFamily" = "'Fira Code', Consolas, 'Courier New', monospace";
      "editor.fontLigatures" = true;
      "terminal.integrated.shell.linux" = "zsh";
      "terminal.integrated.shell.osx" = "zsh";
      "licenser.author" = "Ulrik Strid";
      "licenser.license" = "BSD3";
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.gpg = {
    enable = true;
    settings = {
      auto-key-retrieve = true;
      no-emit-version = true;
      no-tty = true;
    };
  };

  programs.git = {
    enable = true;
    userName = "Ulrik Strid";
    userEmail = "ulrik.strid@outlook.com";
    signing.signByDefault = true;
    signing.key = "4949 0BE7 0E14 FE29 2BD5  ED89 CFC2 0017 7A68 8B11";
  };

  programs.gh = {
    enable = true;
    gitProtocol = "ssh";
    editor = "code";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initExtraBeforeCompInit = builtins.readFile ./configs/zsh/.zshrc;
    shellAliases = {
      k = "kubectl";
      iw = "init-workspace";
      # create shas for nix, from anmonteiro
      npf = "nix-prefetch-url --type sha256";
      npfu = "nix-prefetch-url --type sha256 --unpack";
      # home-manager utils
      "build-home" = "$HOME/.config/nixpkgs/manage-home.sh";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "kubectl" "docker" ];
      theme = "agnoster";
    };
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
