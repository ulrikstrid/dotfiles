let
  overlays = builtins.fetchTarball {
    url = https://github.com/anmonteiro/nix-overlays/archive/a72c7e52761220cf378f9fe90ad1f2d7bb27e95f.tar.gz;
    sha256 = "1qlrfcg7lqi2zipy9jxlhxr9klhgsviink9b8h9raw67hcj4yid7";
  };

in
import overlays
