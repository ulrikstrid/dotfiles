let
  overlays = builtins.fetchTarball {
    url = https://github.com/anmonteiro/nix-overlays/archive/dec2cdc4f8581b67727248d39f4882c2ef9d83ec.tar.gz;
    sha256 = "14a0r4a7a18f067j92zabrsnn0mgns1vm0k1v6z0v3gm3hd0v4kj";
  };

in
import overlays
