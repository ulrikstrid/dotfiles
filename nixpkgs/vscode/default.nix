{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace (import ./extensions.nix).extensions;
    userSettings = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.fontFamily" = "'Fira Code', Consolas, 'Courier New', monospace";
      "editor.fontLigatures" = true;
      "editor.formatOnSave" = true;
      "editor.tabSize" = 2;
      "licenser.author" = "Ulrik Strid";
      "licenser.license" = "BSD3";
      "telemetry.enableTelemetry" = false;
      "terminal.integrated.shell.linux" = "zsh";
      "terminal.integrated.shell.osx" = "zsh";
      "workbench.colorTheme" = "Night Owl";
      "workbench.iconTheme" = "material-icon-theme";
      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "todo-tree.general.tags" = [
        "BUG"
        "HACK"
        "FIXME"
        "TODO"
        "XXX"
        "[ ]"
      ];
    };
  };
}
