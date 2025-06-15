{
  description = "Dev shell with libsodium and luarocks";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    devShells.default = nixpkgs.legacyPackages.x86_64-linux.mkShell {
      packages = with pkgs; [
        lua
        luarocks
        libsodium
        pkg-config # <-- important so luarocks can find the headers
      ];

      # Make sure pkg-config works
      shellHook = ''
        export SODIUM_DIR=${pkgs.libsodium}
        eval "$(luarocks path --bin)"
      '';
    };
  };
}
