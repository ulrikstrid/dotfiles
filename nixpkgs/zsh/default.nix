{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initExtraBeforeCompInit = builtins.readFile ./.zshrc;

    shellAliases = {
      k = "kubectl";
      iw = "init-workspace";
      cat = "bat";
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

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };
}
