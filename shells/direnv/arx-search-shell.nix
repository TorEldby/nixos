{pkgs ? import <nixpkgs> {} }: with pkgs;
mkShell {
  packages = [ rustc cargo docker docker-compose jq ];
  buildInputs = [ pkg-config openssl ];
}

