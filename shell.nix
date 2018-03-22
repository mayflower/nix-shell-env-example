with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "test-project";

  buildInputs = [ awscli awsebcli ];
}
