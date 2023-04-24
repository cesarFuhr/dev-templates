{
  description = "Node 14 workspace";

  inputs.nixpkgs.url = "nixpkgs/nixos-22.11";
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
              url = "https://github.com/NixOS/nixpkgs/archive/8ad5e8132c5dcf977e308e7bf5517cc6cc0bf7d8.tar.gz";
              sha256 = "17v6wigks04x1d63a2wcd7cc4z9ca6qr0f4xvw1pdw83f8a3c0nj";
            })
            { inherit (pkgs) system; };
        in
        {
          devShells.default = let p = pkgs; in
            pkgs.mkShell {
              buildInputs =
                [
                  p.awscli2
                  old.nodejs-14_x
                  p.yarn
                ];

              shellHook = ''
                export NODE_OPTIONS=--openssl-legacy-provider
              '';
            };
        });
}
