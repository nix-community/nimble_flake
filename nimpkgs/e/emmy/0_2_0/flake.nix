{
  description = ''Algebraic structures and related operations for Nim'';
  inputs.src-emmy-0_2_0.flake = false;
  inputs.src-emmy-0_2_0.type = "github";
  inputs.src-emmy-0_2_0.owner = "andreaferretti";
  inputs.src-emmy-0_2_0.repo = "emmy";
  inputs.src-emmy-0_2_0.ref = "refs/tags/0.2.0";
  
  
  inputs."neo".url = "path:../../../n/neo";
  inputs."neo".type = "github";
  inputs."neo".owner = "riinr";
  inputs."neo".repo = "flake-nimble";
  inputs."neo".ref = "flake-pinning";
  inputs."neo".dir = "nimpkgs/n/neo";

  
  inputs."bigints".url = "path:../../../b/bigints";
  inputs."bigints".type = "github";
  inputs."bigints".owner = "riinr";
  inputs."bigints".repo = "flake-nimble";
  inputs."bigints".ref = "flake-pinning";
  inputs."bigints".dir = "nimpkgs/b/bigints";

  
  inputs."stint".url = "path:../../../s/stint";
  inputs."stint".type = "github";
  inputs."stint".owner = "riinr";
  inputs."stint".repo = "flake-nimble";
  inputs."stint".ref = "flake-pinning";
  inputs."stint".dir = "nimpkgs/s/stint";

  outputs = { self, nixpkgs, src-emmy-0_2_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-emmy-0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-emmy-0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}