{ pkgs ? import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/21.11.tar.gz";
    sha256 = "162dywda2dvfj1248afxc45kcrg83appjd0nmdb541hl7rnncf02";
  }) {}
}:

let
  self = rec {
    nlohmann_json = pkgs.nlohmann_json;
    amazing = pkgs.stdenv.mkDerivation rec {
      pname = "amazing";
      version = "local";
      src = pkgs.lib.sourceByRegex ./lib [
        "amazing\..pp"
        "meson\.build"
      ];
      nativeBuildInputs = with pkgs; [ meson ninja pkgconfig ];
      propagatedBuildInputs = [ nlohmann_json ];
    };
    example = pkgs.stdenv.mkDerivation rec {
      pname = "example";
      version = "local";
      src = pkgs.lib.sourceByRegex ./example [
        "example\.cpp"
        "meson\.build"
      ];
      nativeBuildInputs = with pkgs; [ meson ninja pkgconfig amazing ];
    };
    example-docker = pkgs.dockerTools.buildImage {
      name = "example";
      tag = "latest";
      contents = [ example ];
      config = {
        Entrypoint = [ "${example}/bin/example" ];
      };
    };
  };
in
  self
