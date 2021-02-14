{ pkgs, ... }:

{
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

    signing = {
      signByDefault = true;
      key = "4949 0BE7 0E14 FE29 2BD5  ED89 CFC2 0017 7A68 8B11";
    };

    extraConfig = {
      pull = {
        default = "current";
        rebase = "true";
      };
      rebase = { autosquash = "true"; };
    };
  };

  programs.gh = {
    enable = true;
    gitProtocol = "ssh";
    editor = "code";
  };
}
