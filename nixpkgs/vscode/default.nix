{ pkgs }:
{
  vscode = {
      enable = true;
      package = pkgs.vscode;
      extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace (import ./extensions.nix).extensions;
      userSettings = {
        "editor.tabSize" = 2;
        "editor.fontFamily" = "'Fira Code', Consolas, 'Courier New', monospace";
        "workbench.colorTheme" = "Night Owl";
        "editor.formatOnSave" = true;
      };
  };
}