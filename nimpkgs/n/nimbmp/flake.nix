{
  description = ''BMP encoder and decoder'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."nimbmp-master".type = "github";
  inputs."nimbmp-master".owner = "riinr";
  inputs."nimbmp-master".repo = "flake-nimble";
  inputs."nimbmp-master".ref = "flake-pinning";
  inputs."nimbmp-master".dir = "nimpkgs/n/nimbmp/master";

    inputs."nimbmp-v0_1_6".type = "github";
  inputs."nimbmp-v0_1_6".owner = "riinr";
  inputs."nimbmp-v0_1_6".repo = "flake-nimble";
  inputs."nimbmp-v0_1_6".ref = "flake-pinning";
  inputs."nimbmp-v0_1_6".dir = "nimpkgs/n/nimbmp/v0_1_6";

    inputs."nimbmp-v0_1_7".type = "github";
  inputs."nimbmp-v0_1_7".owner = "riinr";
  inputs."nimbmp-v0_1_7".repo = "flake-nimble";
  inputs."nimbmp-v0_1_7".ref = "flake-pinning";
  inputs."nimbmp-v0_1_7".dir = "nimpkgs/n/nimbmp/v0_1_7";

    inputs."nimbmp-v0_1_8".type = "github";
  inputs."nimbmp-v0_1_8".owner = "riinr";
  inputs."nimbmp-v0_1_8".repo = "flake-nimble";
  inputs."nimbmp-v0_1_8".ref = "flake-pinning";
  inputs."nimbmp-v0_1_8".dir = "nimpkgs/n/nimbmp/v0_1_8";

  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}
