{
  description = ''Test asynchronous code'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."asynctest-main".type = "github";
  inputs."asynctest-main".owner = "riinr";
  inputs."asynctest-main".repo = "flake-nimble";
  inputs."asynctest-main".ref = "flake-pinning";
  inputs."asynctest-main".dir = "nimpkgs/a/asynctest/main";

    inputs."asynctest-0_1_0".type = "github";
  inputs."asynctest-0_1_0".owner = "riinr";
  inputs."asynctest-0_1_0".repo = "flake-nimble";
  inputs."asynctest-0_1_0".ref = "flake-pinning";
  inputs."asynctest-0_1_0".dir = "nimpkgs/a/asynctest/0_1_0";

    inputs."asynctest-0_2_0".type = "github";
  inputs."asynctest-0_2_0".owner = "riinr";
  inputs."asynctest-0_2_0".repo = "flake-nimble";
  inputs."asynctest-0_2_0".ref = "flake-pinning";
  inputs."asynctest-0_2_0".dir = "nimpkgs/a/asynctest/0_2_0";

    inputs."asynctest-0_2_1".type = "github";
  inputs."asynctest-0_2_1".owner = "riinr";
  inputs."asynctest-0_2_1".repo = "flake-nimble";
  inputs."asynctest-0_2_1".ref = "flake-pinning";
  inputs."asynctest-0_2_1".dir = "nimpkgs/a/asynctest/0_2_1";

    inputs."asynctest-0_3_0".type = "github";
  inputs."asynctest-0_3_0".owner = "riinr";
  inputs."asynctest-0_3_0".repo = "flake-nimble";
  inputs."asynctest-0_3_0".ref = "flake-pinning";
  inputs."asynctest-0_3_0".dir = "nimpkgs/a/asynctest/0_3_0";

  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}