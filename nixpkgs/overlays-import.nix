
let
  overlays = builtins.fetchTarball {
    url = https://github.com/anmonteiro/nix-overlays/archive/77cbc18.tar.gz;
    sha256 = "09vhh2s72hia09kc9mn3pn1vwqxjrkhrmv1bz0zdhmc1mzzp6a00";
  };

in import overlays
