{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs =
    { self
    , flake-utils
    , nixpkgs
    }: flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = (import nixpkgs) {
          inherit system;
        };
      in
      rec
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [ graphviz ruby_3_3 ];
        };
      }
    );
}
