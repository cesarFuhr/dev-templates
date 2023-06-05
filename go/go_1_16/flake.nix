{
  description = "Go 1.16 workspace";

  inputs.nixpkgs.url = "nixpkgs/nixos-23.05";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    # Add dependencies that are only needed for development
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          old = import
            # Fetching packages from 22.05 to have access to go_1_16
            (builtins.fetchTarball {
              url = "https://github.com/NixOS/nixpkgs/archive/6e3a86f2f73a466656a401302d3ece26fba401d9.tar.gz";
              sha256 = "1dvqwqki44v6s6adlmdy0lw3lm0z53ml6cd6i6wymni2ns1wpzy1";
            })
            { inherit (pkgs) system; };
        in
        {
          devShells.default = pkgs.mkShell {
            buildInputs = let p = pkgs; in
              [
                old.go_1_16
                p.gopls
                p.gotools
                p.go-tools
                p.go-outline
                p.gocode
                p.gopkgs
                p.gocode-gomod
                p.godef
                p.golint
                p.go-mockery
              ];
          };
        });
}

