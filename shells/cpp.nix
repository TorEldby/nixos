with import <nixpkgs> {};

mkShell {
  name = "cpp-env";
  packages = [
   clang
  ];
}
