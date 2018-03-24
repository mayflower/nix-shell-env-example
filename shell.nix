let
  fetchNixpkgs = import ./fetchNixpkgs.nix;
  rev = "0e7c9b32817e5cbe61212d47a6cf9bcd71789322"; # 18.03-beta as of 22-Mar-2018
  nixpkgs = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
    sha256 = "1dm777cmlhqcwlrq8zl9q2d87h3p70rclpvq36y43kp378f3pd0y";
  };
in
with import nixpkgs { config = {}; overlays = []; };

stdenv.mkDerivation {
  name = "test-project";

  buildInputs = [ awscli awsebcli ];

  shellHook = ''
    alias hi="echo Hello nix-shell User!"
    hi
  '';
}
