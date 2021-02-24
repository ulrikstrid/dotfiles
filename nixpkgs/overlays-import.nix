let
  overlays = builtins.fetchTarball {
    url = https://github.com/anmonteiro/nix-overlays/archive/ecd0631a44598e46cfc3d821021712f33bed0a2e.tar.gz;
    sha256 = "14a0r4a7a18f067j92zabrsnn0mgns1vm0k1v6z0v3gm3hd0v4kj";
  };

in
import overlays
