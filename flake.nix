{
  description = "Union Labs fork of CosmJS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            bun
            nixd
            biome
            direnv
            python3
            libusb1
            node-gyp
            pkg-config
            yarn-berry
            nixfmt-rfc-style
            nodePackages_latest.nodejs
            nodePackages_latest.node-gyp-build
          ];
        };
      }
    );
}
